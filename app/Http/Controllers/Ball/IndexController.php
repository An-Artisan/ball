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


    public function test() {
        $create = new CreateOpenBall();
        $create->handle();
    }
    public function success()
    {

    }

    public function getSysTime(Request $request)
    {

        /**
         *  15 广东11选5
         * 51 文莱幸运5
         * 31 澳洲幸运5
         */
//        https://dy.66yy09.com/api/homePage/gameNewDataForLotteryHall?iGameId=31
//        https://dy.66yy09.com/api/homePage/gameNewDataForLotteryHall?iGameId=51
//        https://dy.66yy09.com/api/homePage/gameNewDataForLotteryHall?iGameId=15

//        $url = "http://dy.66yy09.com/api/homePage/gameNewDataForLotteryHall?iGameId=31";
//        try {
//            $http = new \GuzzleHttp\Client;
//            $response = $http->get($url);
//        } catch (\Exception $e) {
//            dd($e->getMessage());
//        }
//        $test = $response->getBody()->getContents();
//        dd($test);

        list($msec, $sec) = explode(' ', microtime());
        $msectime = (float)sprintf('%.0f', (floatval($msec) + floatval($sec)) * 1000);
        $data = ["datetime" => Carbon::now()->toDateTimeString(), "timestamp" => $msectime];
        return response()->json($data);

    }

    public function lotIndexList(Request $request) {




//参数拼接
//        ['form_params' => ['grant_type' => $grant_type, 'client_id' => $client_id, 'client_secret' => $client_secret,
//            'redirect_uri' => $redirect_uri, 'code' => $code],]


        $json = '{"code":0,"errorMessage":"查询成功","result":{"sscLotList":[{"expect":"50755295","num1Val":"7","num2Val":"1","num3Val":"9","num4Val":"8","num5Val":"6","numSum":31,"isSumBigSmallVal":"大","isSumSingleDoubleVal":"单","isSumDragonTigerVal":"龙","beforeThreeVal":"杂六","middleThreeVal":"半顺","afterThreeVal":"半顺","lotName":"澳洲幸运5","paramName":"azxy5","openType":1,"nextIssue":"50755296","nextOpentime":"2021-01-17 19:03:40","startTime":"2021-01-16 17:53:32","totalCount":288,"openCount":214,"lotIcon":"https://lottery-20190422.oss-cn-hongkong.aliyuncs.com/lottery_icon/azxy5.png"},{"expect":"20210116536","num1Val":"4","num2Val":"0","num3Val":"8","num4Val":"6","num5Val":"6","numSum":24,"isSumBigSmallVal":"大","isSumSingleDoubleVal":"双","isSumDragonTigerVal":"虎","beforeThreeVal":"杂六","middleThreeVal":"杂六","afterThreeVal":"对子","lotName":"澳洲幸运2","paramName":"twominute","openType":1,"nextIssue":"20210116537","nextOpentime":"2021-01-16 17:54:00","startTime":"2021-01-16 17:53:32","totalCount":720,"openCount":536,"lotIcon":"https://lottery-20190422.oss-cn-hongkong.aliyuncs.com/lottery_icon/azxy2.png"},{"expect":"20210116214","num1Val":"6","num2Val":"7","num3Val":"4","num4Val":"0","num5Val":"8","numSum":25,"isSumBigSmallVal":"大","isSumSingleDoubleVal":"单","isSumDragonTigerVal":"虎","beforeThreeVal":"半顺","middleThreeVal":"杂六","afterThreeVal":"杂六","lotName":"加拿大五分彩","paramName":"jndxy5","openType":1,"nextIssue":"20210116215","nextOpentime":"2021-01-16 17:55:00","startTime":"2021-01-16 17:53:32","totalCount":288,"openCount":214,"lotIcon":"https://lottery-20190422.oss-cn-hongkong.aliyuncs.com/lottery_icon/jndxy5.png"},{"expect":"20210116023","num1Val":"8","num2Val":"5","num3Val":"2","num4Val":"3","num5Val":"3","numSum":21,"isSumBigSmallVal":"小","isSumSingleDoubleVal":"单","isSumDragonTigerVal":"龙","beforeThreeVal":"杂六","middleThreeVal":"半顺","afterThreeVal":"对子","lotName":"新疆时时彩","paramName":"xjssc","openType":1,"nextIssue":"20210116024","nextOpentime":"2021-01-16 18:00:00","startTime":"2021-01-16 17:53:32","totalCount":48,"openCount":23,"lotIcon":"https://lottery-20190422.oss-cn-hongkong.aliyuncs.com/lottery_icon/xjssc.png"}],"pkLotList":[]},"pageAction":null,"token":null}';
//        $json = '{"code":0,"errorMessage":"查询成功","result":{"sscLotList":[{"expect":"50754680","num1Val":"6","num2Val":"1","num3Val":"9","num4Val":"5","num5Val":"5","numSum":26,"isSumBigSmallVal":"大","isSumSingleDoubleVal":"双","isSumDragonTigerVal":"龙","beforeThreeVal":"杂六","middleThreeVal":"杂六","afterThreeVal":"对子","lotName":"澳洲幸运5","paramName":"azxy5","openType":1,"nextIssue":"50754681","nextOpentime":"2021-01-14 14:38:50","startTime":"2021-01-14 14:38:28","totalCount":288,"openCount":175,"lotIcon":"https://lottery-20190422.oss-cn-hongkong.aliyuncs.com/lottery_icon/azxy5.png"},{"expect":"20210114439","num1Val":"6","num2Val":"5","num3Val":"9","num4Val":"2","num5Val":"5","numSum":27,"isSumBigSmallVal":"大","isSumSingleDoubleVal":"单","isSumDragonTigerVal":"龙","beforeThreeVal":"半顺","middleThreeVal":"杂六","afterThreeVal":"杂六","lotName":"澳洲幸运2","paramName":"twominute","openType":1,"nextIssue":"20210114440","nextOpentime":"2021-01-14 14:40:00","startTime":"2021-01-14 14:38:28","totalCount":720,"openCount":439,"lotIcon":"https://lottery-20190422.oss-cn-hongkong.aliyuncs.com/lottery_icon/azxy2.png"},{"expect":"202101140878","num1Val":"9","num2Val":"8","num3Val":"4","num4Val":"6","num5Val":"7","numSum":34,"isSumBigSmallVal":"大","isSumSingleDoubleVal":"双","isSumDragonTigerVal":"龙","beforeThreeVal":"半顺","middleThreeVal":"杂六","afterThreeVal":"半顺","lotName":"澳洲幸运1","paramName":"azxy1","openType":1,"nextIssue":"202101140879","nextOpentime":"2021-01-14 14:39:00","startTime":"2021-01-14 14:38:28","totalCount":1440,"openCount":878,"lotIcon":"https://lottery-20190422.oss-cn-hongkong.aliyuncs.com/lottery_icon/azxy1.png"},{"expect":"20210114175","num1Val":"6","num2Val":"1","num3Val":"8","num4Val":"4","num5Val":"1","numSum":20,"isSumBigSmallVal":"小","isSumSingleDoubleVal":"双","isSumDragonTigerVal":"龙","beforeThreeVal":"杂六","middleThreeVal":"杂六","afterThreeVal":"杂六","lotName":"加拿大五分彩","paramName":"jndxy5","openType":1,"nextIssue":"20210114176","nextOpentime":"2021-01-14 14:40:00","startTime":"2021-01-14 14:38:28","totalCount":288,"openCount":175,"lotIcon":"https://lottery-20190422.oss-cn-hongkong.aliyuncs.com/lottery_icon/jndxy5.png"},{"expect":"20210114013","num1Val":"5","num2Val":"0","num3Val":"9","num4Val":"6","num5Val":"7","numSum":27,"isSumBigSmallVal":"大","isSumSingleDoubleVal":"单","isSumDragonTigerVal":"虎","beforeThreeVal":"半顺","middleThreeVal":"半顺","afterThreeVal":"半顺","lotName":"新疆时时彩","paramName":"xjssc","openType":1,"nextIssue":"20210114014","nextOpentime":"2021-01-14 14:40:00","startTime":"2021-01-14 14:38:28","totalCount":48,"openCount":13,"lotIcon":"https://lottery-20190422.oss-cn-hongkong.aliyuncs.com/lottery_icon/xjssc.png"}],"pkLotList":[]},"pageAction":null,"token":null}';
        $json = json_decode($json,true);
        return response()->json($json);
    }

    public function lotSingleAward(Request $request)
    {
        $type = $request->get('lotType');
        $data = ["code" => 0, "errorMessage" => "查询成功", "result" => [["expect" => "202101140831", "num1Val" => (string) rand(0,9), "num2Val" =>  (string) rand(0,9),
            "num3Val" => (string) rand(0,9), "num4Val" =>  (string) rand(0,9), "num5Val" =>  (string) rand(0,9), "numSum" =>  (string) rand(0,45), "isSumBigSmallVal" => "小", "isSumSingleDoubleVal" => "双", "isSumDragonTigerVal" => "龙", "beforeThreeVal" => "半顺",
            "middleThreeVal" => "半顺", "afterThreeVal" => "杂六", "lotName" => "澳洲幸运1", "paramName" => $type, "openType" => 1, "nextIssue" => "202101140832", "nextOpentime" => date("Y-m-d H:i:s",time() + 30),
            "totalCount" => 1440, "openCount" => rand(100,999), "lotIcon" => "https://lottery-20190422.oss-cn-hongkong.aliyuncs.com/lottery_icon/azxy1.png"]], "pageAction" => null, "token" => null];
        return response()->json($data);
    }
}
