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


//        Cache::put("test","2",5);
//        dd(Cache::get("test"));exit;
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
//



        $azxy5Count = $wlxy5Count = $gd11Check5Count = 1;
        $azxy5Response = self::request163KKCom($azxy5Count,31);
        $wlxy5Response = self::request163KKCom($wlxy5Count,51);
        $gd11Check5Response = self::request163KKCom($gd11Check5Count,15);
        $time = time();
        $azxy5Data = self::responseDataPackage($time, $azxy5Response, "澳洲幸运5", "azxy5");
        $wlxy5Data = self::responseDataPackage($time, $wlxy5Response, "文莱幸运5", "wlxy5");
        $gd11Check5Data = self::responseDataPackage($time, $gd11Check5Response, "广东11选5", "gd11check5");

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
                "nextOpentime" => date('Y-m-d H:i:s', $time + ceil($result['nextOpenTime'] / 1000)),
                "nextIssue" => $result['nextGamePeriod'],
                "startTime" => $result['drealopen'],
                "totalCount" => $result['alreadyOpenedPeriod'] + $result['remainPeriod'],
                "openCount" => $result['alreadyOpenedPeriod'],
                "lotIcon" => "https://lottery-20190422.oss-cn-hongkong.aliyuncs.com/lottery_icon/azxy5.png"
            ];
        }
        return $data;
    }


    private function request163KKCom($count,$iGameId)
    {

        if ($count === 4) {
            return false;
        }
        $url = "http://dy.66yy09.com/api/homePage/gameNewDataForLotteryHall?iGameId={$iGameId}";
        try {
            $http = new \GuzzleHttp\Client;
            $response = $http->get($url);
            return $response->getBody()->getContents();
        } catch (\Exception $e) {
            sleep(1);
            $count++;
            return self::request163KKCom($count,$iGameId);
        }
    }

    public function lotSingleAward(Request $request)
    {
        $type = $request->get('lotType');
        $data = ["code" => 0, "errorMessage" => "查询成功", "result" => [["expect" => "202101140831", "num1Val" => (string)rand(0, 9), "num2Val" => (string)rand(0, 9),
            "num3Val" => (string)rand(0, 9), "num4Val" => (string)rand(0, 9), "num5Val" => (string)rand(0, 9), "numSum" => (string)rand(0, 45), "isSumBigSmallVal" => "小", "isSumSingleDoubleVal" => "双", "isSumDragonTigerVal" => "龙", "beforeThreeVal" => "半顺",
            "middleThreeVal" => "半顺", "afterThreeVal" => "杂六", "lotName" => "澳洲幸运1", "paramName" => $type, "openType" => 1, "nextIssue" => "202101140832", "nextOpentime" => date("Y-m-d H:i:s", time() + 30),
            "totalCount" => 1440, "openCount" => rand(100, 999), "lotIcon" => "https://lottery-20190422.oss-cn-hongkong.aliyuncs.com/lottery_icon/azxy1.png"]], "pageAction" => null, "token" => null];
        return response()->json($data);
    }
}
