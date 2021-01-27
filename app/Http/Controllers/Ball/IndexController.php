<?php

namespace App\Http\Controllers\Ball;

use App\Console\Commands\CreateOpenBall;
use App\Http\Controllers\Controller;
use App\Models\OpenBall;
use App\Models\User;
use App\Models\UserBet;
use App\Models\UserBetOdds;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Log;

class IndexController extends Controller
{


    public function test()
    {
        $create = new CreateOpenBall();
        $create->handle();
    }

    public function success()
    {

    }

    public function getSysTime(Request $request)
    {


        list($msec, $sec) = explode(' ', microtime());
        $msectime = (float)sprintf('%.0f', (floatval($msec) + floatval($sec)) * 1000);
        $data = ["datetime" => Carbon::now()->toDateTimeString(), "timestamp" => $msectime];
        return response()->json($data);

    }

    public function lotIndexList(Request $request)
    {

        /**
         *  最后一条结束记录
         */
        $lastEndBet = OpenBall::query()->where("play_type", OpenBall::CUSTOMER_FIRST)
            ->where("status", OpenBall::STATUS_ENDED)
            ->orderBy('id', "desc")->get()->first();
        /**
         * 最后一条正在进行中记录
         */
        $lastBetting = OpenBall::query()->where("play_type", OpenBall::CUSTOMER_FIRST)
            ->where("status", "!=", OpenBall::STATUS_ENDED)
            ->orderBy('id', "desc")->get()->first();
        $customerFirstData = self::customerDataPackage($lastEndBet,$lastBetting);

        $azxy5Response = self::request163KKCom(OpenBall::PLAY_TYPE_GAME_IDS[OpenBall::AZXY5]);
        $wlxy5Response = self::request163KKCom(OpenBall::PLAY_TYPE_GAME_IDS[OpenBall::WLXY5]);
        $gd11Check5Response = self::request163KKCom(OpenBall::PLAY_TYPE_GAME_IDS[OpenBall::GD11CHECK5]);
        $time = time();
        $azxy5Data = self::responseDataPackage($time, $azxy5Response, OpenBall::AZXY5_CN, OpenBall::AZXY5);
        $wlxy5Data = self::responseDataPackage($time, $wlxy5Response, OpenBall::WLXY5_CN, OpenBall::WLXY5);
        $gd11Check5Data = self::responseDataPackage($time, $gd11Check5Response, OpenBall::GD11CHECK5_CN, OpenBall::GD11CHECK5);

        $data = ["code" => 0, "errorMessage" => "查询成功", "pageAction" => null, "token" => null,
            "result" => ["pkLotList" => [], "sscLotList" =>
                [
                    $azxy5Data,
                    $wlxy5Data,
                    $gd11Check5Data,
                    $customerFirstData
                ]
            ]];


        return response()->json($data);
    }


    private function customerDataPackage(OpenBall $lastEndBet, OpenBall $lastBetting)
    {
        $ball = [$lastEndBet->first_ball, $lastEndBet->second_ball, $lastEndBet->third_ball, $lastEndBet->fourth_ball, $lastEndBet->fifth_ball];
        $data = [
            "expect" => $lastEndBet->phase_number,
            "num1Val" => $lastEndBet->first_ball,
            "num2Val" => $lastEndBet->second_ball,
            "num3Val" => $lastEndBet->third_ball,
            "num4Val" => $lastEndBet->fourth_ball,
            "num5Val" => $lastEndBet->fifth_ball,
            "isSumBigSmallVal" => OpenBall::isSumBigSmallVal($ball),
            "isSumSingleDoubleVal" => OpenBall::isSumSingleDoubleVal($ball),
            "isSumDragonTigerVal" => OpenBall::isSumDragonTigerVal($ball),
            "beforeThreeVal" => OpenBall::beforeThreeVal($ball),
            "middleThreeVal" => OpenBall::middleThreeVal($ball),
            "afterThreeVal" => OpenBall::afterThreeVal($ball),
            "lotName" => OpenBall::CUSTOMER_FIRST_CN,
            "paramName" => OpenBall::CUSTOMER_FIRST,
            "openType" => 1,
            "nextOpentime" => date('Y-m-d H:i:s', $lastBetting->start_time + $lastBetting->current_open_ball_time),
//                "nextOpentime" => date('Y-m-d H:i:s', $time + 10),
            "nextIssue" => $lastBetting->phase_number,
            "startTime" => date('Y-m-d H:i:s', $lastEndBet->start_time),
            "totalCount" => OpenBall::SUM_PHASE,
            "openCount" => $lastEndBet->current_phase,
            "lotIcon" =>  OpenBall::PLAY_TYPE_ICON_LIST[OpenBall::CUSTOMER_FIRST]
        ];
        return $data;
    }


    private function responseDataPackage($time, $response, $lotName, $paramName)
    {
        if ($response === false) {
            $data = [];
        } else {
            $content = json_decode($response, true);
            $result = $content['result'];
            $openResult = json_decode($result['property'], true);
            $data = [
                "expect" => $result["sgameperiod"],
                "num1Val" => $result['iopennum1'],
                "num2Val" => $result['iopennum2'],
                "num3Val" => $result['iopennum3'],
                "num4Val" => $result['iopennum4'],
                "num5Val" => $result['iopennum5'],
                "isSumBigSmallVal" => $openResult['sumBigSmall'],
                "isSumSingleDoubleVal" => $openResult['sumSingleDouble'],
                "isSumDragonTigerVal" => $openResult['dragonTiger'],
                "beforeThreeVal" => $openResult['topThree'],
                "middleThreeVal" => $openResult['middleThree'],
                "afterThreeVal" => $openResult['tailThree'],
                "lotName" => $lotName,
                "paramName" => $paramName,
                "openType" => 1,
                /**
                 * 这里是毫秒，需要除以1000
                 */
                "nextOpentime" => date('Y-m-d H:i:s', $time + ceil($result['nextOpenTime'] / 1000)),
//                "nextOpentime" => date('Y-m-d H:i:s', $time + 10),
                "nextIssue" => $result['nextGamePeriod'],
                "startTime" => $result['drealopen'],
                "totalCount" => $result['alreadyOpenedPeriod'] + $result['remainPeriod'],
                "openCount" => $result['alreadyOpenedPeriod'],
                "lotIcon" =>  OpenBall::PLAY_TYPE_ICON_LIST[$paramName],

            ];

            Cache::put($paramName, $result["sgameperiod"]);
        }
        return $data;
    }


    private function request163KKCom($iGameId, $count = 1)
    {

        if ($count === OpenBall::REQUEST_RETRY_COUNT) {
            return false;
        }
        $url = OpenBall::OPEN_LUCKY_API . $iGameId;
        try {
            $http = new \GuzzleHttp\Client;
            $response = $http->get($url);
            return $response->getBody()->getContents();
        } catch (\Exception $e) {
            sleep(2);
            $count++;
            return self::request163KKCom($iGameId, $count);
        }
    }

    public function lotSingleAward(Request $request)
    {
        $type = $request->get('lotType');
        $lotIssue = $request->get('lotIssue');
        if (!in_array($type, array_keys(OpenBall::PLAY_TYPE_LIST))) {
            $data = ["code" => 304, "errorMessage" => "暂未查询成功", "result" => null, "pageAction" => null, "token" => null];
            return response()->json($data);
        }
//
//        /**
//         * 其他彩种
//         */
        if ($type != OpenBall::CUSTOMER_FIRST) {
            sleep(2);
            $data = self::apiOpenLucky($type, $lotIssue);
            if ($data === false) {
                $data = ["code" => 304, "errorMessage" => "暂未查询成功", "result" => null, "pageAction" => null, "token" => null];
                return response()->json($data);
            }
        } else { // 自定义彩种
            $data = [];
        }
//        $data = ["code" => 0, "errorMessage" => "查询成功", "result" => [
//            [
//                "expect" => "000001", "num1Val" =>  "1", "num2Val" => "2",
//                "num3Val" => "3", "num4Val" => "4", "num5Val" => "5",
//                "numSum" => "15", "isSumBigSmallVal" => "小", "isSumSingleDoubleVal" => "单",
//                "isSumDragonTigerVal" => "虎", "beforeThreeVal" => "顺子", "middleThreeVal" => "顺子",
//                "afterThreeVal" => "顺子", "lotName" => self::PLAY_TYPE_LIST[$type], "paramName" => $type, "openType" => 1,
//                "nextIssue" => "000002", "nextOpentime" => date('Y-m-d H:i:s', time() + 10),
//                "totalCount" => "120", "openCount" => "20", "lotIcon" => "https://lottery-20190422.oss-cn-hongkong.aliyuncs.com/lottery_icon/azxy1.png"
//            ]
//        ],
//            "pageAction" => null, "token" => null];

        return response()->json($data);
    }

    private
    function apiOpenLucky($type, $lotIssue)
    {

        $response = self::request163KKCom(OpenBall::PLAY_TYPE_GAME_IDS[$type]);
        if ($response === false) {
            Log::info("开奖查询接口调用三次失败", ["play_type" => $type, "lotIssue" => $lotIssue]);
            return false;
        } else {
            $content = json_decode($response, true);
            $result = $content['result'];
            $openResult = json_decode($result['property'], true);
            if ($result["sgameperiod"] == $lotIssue) {
                Log::info("开奖查询期数相同", ["play_type" => $type, "data" => $result, "lotIssue" => $lotIssue]);
                return false;
            }

            $numSum = $result['iopennum1'] + $result['iopennum2'] + $result['iopennum3'] + $result['iopennum4'] + $result['iopennum5'];
            $data = ["code" => 0, "errorMessage" => "查询成功", "result" => [
                [
                    "expect" => $result["sgameperiod"], "num1Val" => $result['iopennum1'], "num2Val" => $result['iopennum2'],
                    "num3Val" => $result['iopennum3'], "num4Val" => $result['iopennum4'], "num5Val" => $result['iopennum5'],
                    "numSum" => $numSum, "isSumBigSmallVal" => $openResult['sumBigSmall'], "isSumSingleDoubleVal" => $openResult['sumSingleDouble'],
                    "isSumDragonTigerVal" => $openResult['dragonTiger'], "beforeThreeVal" => $openResult['topThree'], "middleThreeVal" => $openResult['middleThree'],
                    "afterThreeVal" => $openResult['tailThree'], "lotName" => OpenBall::PLAY_TYPE_LIST[$type], "paramName" => $type, "openType" => 1,
                    "nextIssue" => $result['nextGamePeriod'], "nextOpentime" => date('Y-m-d H:i:s', time() + ceil($result['nextOpenTime'] / 1000)),
                    "totalCount" => $result['alreadyOpenedPeriod'] + $result['remainPeriod'], "openCount" => $result['alreadyOpenedPeriod'],
                    "lotIcon" =>  OpenBall::PLAY_TYPE_ICON_LIST[$type],
                ]
            ],
                "pageAction" => null, "token" => null];
            return $data;
        }
    }


}
