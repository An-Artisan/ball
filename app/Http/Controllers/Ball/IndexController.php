<?php

namespace App\Http\Controllers\Ball;

use App\Console\Commands\CreateOpenBall;
use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\UserBet;
use App\Models\UserBetOdds;
use Carbon\Carbon;
use Illuminate\Http\Request;

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
         *  15 广东11选5
         * 51 文莱幸运5
         * 31 澳洲幸运5
         */
//        https://dy.66yy09.com/api/homePage/gameNewDataForLotteryHall?iGameId=31
//        https://dy.66yy09.com/api/homePage/gameNewDataForLotteryHall?iGameId=51
//        https://dy.66yy09.com/api/homePage/gameNewDataForLotteryHall?iGameId=15
//

        $azxy5Count = 1;
        $azxy5Response = self::azxy5($azxy5Count);
        $time = time();
        if ($azxy5Response === false) {
            return response()->json([]);
        }
        $azxy5Content = $azxy5Response->getBody()->getContents();
        $azxy5Content = json_decode($azxy5Content, true);
        $azxy5Result = $azxy5Content['result'];
        $azxy5OpenResult = json_decode($azxy5Result['property'], true);
        $data = ["code" => 0, "errorMessage" => "查询成功", "pageAction" => null, "token" => null,
            "result" => ["pkLotList" => [], "sscLotList" =>
                [
                    [
                        "expect" => $azxy5Result["sgameperiod"],
                        "num1Val" => $azxy5Result['iopennum1'],
                        "num2Val" => $azxy5Result['iopennum2'],
                        "num3Val" => $azxy5Result['iopennum3'],
                        "num4Val" => $azxy5Result['iopennum4'],
                        "num5Val" => $azxy5Result['iopennum5'],
                        "isSumBigSmallVal" => $azxy5OpenResult['sumBigSmall'],
                        "isSumSingleDoubleVal" => $azxy5OpenResult['sumSingleDouble'],
                        "isSumDragonTigerVal" => $azxy5OpenResult['dragonTiger'],
                        "beforeThreeVal" => $azxy5OpenResult['topThree'],
                        "middleThreeVal" => $azxy5OpenResult['middleThree'],
                        "afterThreeVal" => $azxy5OpenResult['tailThree'],
                        "lotName" => "澳洲幸运5",
                        "paramName" => "azxy5",
                        "openType" => 1,
                        "nextOpentime" => date('Y-m-d H:i:s',$time  + ceil($azxy5Result['nextOpenTime'] / 1000)),
                        "nextIssue" => $azxy5Result['nextGamePeriod'],
                        "startTime" => $azxy5Result['drealopen'],
                        "totalCount" => $azxy5Result['alreadyOpenedPeriod'] + $azxy5Result['remainPeriod'],
                        "openCount" => $azxy5Result['alreadyOpenedPeriod'],
                        "lotIcon" => "https://lottery-20190422.oss-cn-hongkong.aliyuncs.com/lottery_icon/azxy5.png"
                    ]
                ]
            ]];


        return response()->json($data);
    }


    private  function wlxy5(int &$count) {

        if ($count === 4) {
            return false;
        }
        $url = "http://dy.66yy09.com/api/homePage/gameNewDataForLotteryHall?iGameId=51";
        try {
            $http = new \GuzzleHttp\Client;
            $response = $http->get($url);
            return $response;
        } catch (\Exception $e) {
            sleep(1);
            $count ++;
            return self::azxy5($count);
        }
    }

    private  function azxy5(int &$count) {

        if ($count === 4) {
            return false;
        }
        $url = "http://dy.66yy09.com/api/homePage/gameNewDataForLotteryHall?iGameId=31";
        try {
            $http = new \GuzzleHttp\Client;
            $response = $http->get($url);
            return $response;
        } catch (\Exception $e) {
            sleep(1);
            $count ++;
           return self::azxy5($count);
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
