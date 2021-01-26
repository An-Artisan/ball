<?php

namespace App\Http\Controllers\Ball;

use App\Console\Commands\CreateOpenBall;
use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\UserBet;
use App\Models\UserBetOdds;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Log;

class IndexController extends Controller
{


    /**
     *  15 广东11选5
     * 51 文莱幸运5
     * 31 澳洲幸运5
     * 68 极速11选5
     */
//        https://dy.66yy09.com/api/homePage/gameNewDataForLotteryHall?iGameId=31
//        https://dy.66yy09.com/api/homePage/gameNewDataForLotteryHall?iGameId=51
//        https://dy.66yy09.com/api/homePage/gameNewDataForLotteryHall?iGameId=15
//        https://dy.66yy09.com/api/homePage/gameNewDataForLotteryHall?iGameId=68

    /**
     * 彩种名称
     */
    const WLXY5 = 'wlxy5';
    const WLXY5_CN = '文莱幸运5';
    const AZXY5 = 'azxy5';
    const AZXY5_CN = '澳洲幸运5';
    const GD11CHECK5 = 'gd11check5';
    const GD11CHECK5_CN = '广东11选5';
    const CUSTOMER_FIRST = 'customer';
    const CUSTOMER_FIRST_CN = '自定义彩种';
    const REQUEST_RETRY_COUNT = 3;
    /**
     * 开奖网接口地址
     */
    const OPEN_LUCKY_API = "http://dy.66yy09.com/api/homePage/gameNewDataForLotteryHall?iGameId=";
    /**
     * 彩种的ID
     */
    const PLAY_TYPE_GAME_IDS = [
        self::WLXY5 => 51,
        self::AZXY5 => 31,
        self::GD11CHECK5 => 15,
    ];
    const PLAY_TYPE_LIST = [
        self::WLXY5 => self::WLXY5_CN,
        self::AZXY5 => self::AZXY5_CN,
        self::GD11CHECK5 => self::GD11CHECK5_CN,
        self::CUSTOMER_FIRST => self::CUSTOMER_FIRST_CN,
    ];

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

        $azxy5Response = self::request163KKCom(self::PLAY_TYPE_GAME_IDS[self::AZXY5]);
        $wlxy5Response = self::request163KKCom(self::PLAY_TYPE_GAME_IDS[self::WLXY5]);
        $gd11Check5Response = self::request163KKCom(self::PLAY_TYPE_GAME_IDS[self::GD11CHECK5]);
        $time = time();
        $azxy5Data = self::responseDataPackage($time, $azxy5Response, self::AZXY5_CN, self::AZXY5);
        $wlxy5Data = self::responseDataPackage($time, $wlxy5Response, self::WLXY5_CN, self::WLXY5);
        $gd11Check5Data = self::responseDataPackage($time, $gd11Check5Response, self::GD11CHECK5_CN, self::GD11CHECK5);

        $data = ["code" => 0, "errorMessage" => "查询成功", "pageAction" => null, "token" => null,
            "result" => ["pkLotList" => [], "sscLotList" =>
                [
                    $azxy5Data,
                    $wlxy5Data,
                    $gd11Check5Data
                ]
            ]];


        return response()->json($data);
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
                "lotIcon" => "https://lottery-20190422.oss-cn-hongkong.aliyuncs.com/lottery_icon/azxy5.png"
            ];

            Cache::put($paramName, $result["sgameperiod"]);
        }
        return $data;
    }


    private function request163KKCom($iGameId, $count = 1)
    {

        if ($count === self::REQUEST_RETRY_COUNT) {
            return false;
        }
        $url = self::OPEN_LUCKY_API . $iGameId;
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
        if (!in_array($type, array_keys(self::PLAY_TYPE_LIST))) {
            $data = ["code" => 304,"errorMessage" => "暂未查询成功","result" => null,"pageAction" => null,"token" => null];
            return response()->json($data);
        }
//
//        /**
//         * 其他彩种
//         */
        if ($type != self::CUSTOMER_FIRST) {
            sleep(2);
            $data = self::apiOpenLucky($type, $lotIssue);
            if ($data === false) {
                $data = ["code" => 304,"errorMessage" => "暂未查询成功","result" => null,"pageAction" => null,"token" => null];
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

        $response = self::request163KKCom(self::PLAY_TYPE_GAME_IDS[$type]);
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
                    "afterThreeVal" => $openResult['tailThree'], "lotName" => self::PLAY_TYPE_LIST[$type], "paramName" => $type, "openType" => 1,
                    "nextIssue" => $result['nextGamePeriod'], "nextOpentime" => date('Y-m-d H:i:s', time() + ceil($result['nextOpenTime'] / 1000)),
                    "totalCount" => $result['alreadyOpenedPeriod'] + $result['remainPeriod'], "openCount" => $result['alreadyOpenedPeriod'], "lotIcon" => "https://lottery-20190422.oss-cn-hongkong.aliyuncs.com/lottery_icon/azxy1.png"
                ]
            ],
                "pageAction" => null, "token" => null];
            return $data;
        }
    }


}
