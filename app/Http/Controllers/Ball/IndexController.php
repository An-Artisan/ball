<?php

namespace App\Http\Controllers\Ball;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\UserBet;
use App\Models\UserBetOdds;
use Carbon\Carbon;
use Illuminate\Http\Request;

class IndexController extends Controller
{


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

    public function lotIndexList(Request $request) {
        $json = '{"code":0,"errorMessage":"查询成功","result":{"sscLotList":[{"expect":"50754680","num1Val":"6","num2Val":"1","num3Val":"9","num4Val":"5","num5Val":"5","numSum":26,"isSumBigSmallVal":"大","isSumSingleDoubleVal":"双","isSumDragonTigerVal":"龙","beforeThreeVal":"杂六","middleThreeVal":"杂六","afterThreeVal":"对子","lotName":"澳洲幸运5","paramName":"azxy5","openType":1,"nextIssue":"50754681","nextOpentime":"2021-01-14 14:38:50","startTime":"2021-01-14 14:38:28","totalCount":288,"openCount":175,"lotIcon":"https://lottery-20190422.oss-cn-hongkong.aliyuncs.com/lottery_icon/azxy5.png"},{"expect":"20210114439","num1Val":"6","num2Val":"5","num3Val":"9","num4Val":"2","num5Val":"5","numSum":27,"isSumBigSmallVal":"大","isSumSingleDoubleVal":"单","isSumDragonTigerVal":"龙","beforeThreeVal":"半顺","middleThreeVal":"杂六","afterThreeVal":"杂六","lotName":"澳洲幸运2","paramName":"twominute","openType":1,"nextIssue":"20210114440","nextOpentime":"2021-01-14 14:40:00","startTime":"2021-01-14 14:38:28","totalCount":720,"openCount":439,"lotIcon":"https://lottery-20190422.oss-cn-hongkong.aliyuncs.com/lottery_icon/azxy2.png"},{"expect":"202101140878","num1Val":"9","num2Val":"8","num3Val":"4","num4Val":"6","num5Val":"7","numSum":34,"isSumBigSmallVal":"大","isSumSingleDoubleVal":"双","isSumDragonTigerVal":"龙","beforeThreeVal":"半顺","middleThreeVal":"杂六","afterThreeVal":"半顺","lotName":"澳洲幸运1","paramName":"azxy1","openType":1,"nextIssue":"202101140879","nextOpentime":"2021-01-14 14:39:00","startTime":"2021-01-14 14:38:28","totalCount":1440,"openCount":878,"lotIcon":"https://lottery-20190422.oss-cn-hongkong.aliyuncs.com/lottery_icon/azxy1.png"},{"expect":"20210114175","num1Val":"6","num2Val":"1","num3Val":"8","num4Val":"4","num5Val":"1","numSum":20,"isSumBigSmallVal":"小","isSumSingleDoubleVal":"双","isSumDragonTigerVal":"龙","beforeThreeVal":"杂六","middleThreeVal":"杂六","afterThreeVal":"杂六","lotName":"加拿大五分彩","paramName":"jndxy5","openType":1,"nextIssue":"20210114176","nextOpentime":"2021-01-14 14:40:00","startTime":"2021-01-14 14:38:28","totalCount":288,"openCount":175,"lotIcon":"https://lottery-20190422.oss-cn-hongkong.aliyuncs.com/lottery_icon/jndxy5.png"},{"expect":"20210114013","num1Val":"5","num2Val":"0","num3Val":"9","num4Val":"6","num5Val":"7","numSum":27,"isSumBigSmallVal":"大","isSumSingleDoubleVal":"单","isSumDragonTigerVal":"虎","beforeThreeVal":"半顺","middleThreeVal":"半顺","afterThreeVal":"半顺","lotName":"新疆时时彩","paramName":"xjssc","openType":1,"nextIssue":"20210114014","nextOpentime":"2021-01-14 14:40:00","startTime":"2021-01-14 14:38:28","totalCount":48,"openCount":13,"lotIcon":"https://lottery-20190422.oss-cn-hongkong.aliyuncs.com/lottery_icon/xjssc.png"}],"pkLotList":[]},"pageAction":null,"token":null}';
        $json = json_decode($json,true);
        return response()->json($json);
    }

    public function lotSingleAward(Request $request)
    {
        $type = $request->get('lotType');
        $data = ["code" => 0, "errorMessage" => "查询成功", "result" => [["expect" => "202101140831", "num1Val" => "7", "num2Val" => "3", "num3Val" => "2", "num4Val" => "6", "num5Val" => "0", "numSum" => 18, "isSumBigSmallVal" => "小", "isSumSingleDoubleVal" => "双", "isSumDragonTigerVal" => "龙", "beforeThreeVal" => "半顺",
            "middleThreeVal" => "半顺", "afterThreeVal" => "杂六", "lotName" => "澳洲幸运1", "paramName" => $type, "openType" => 1, "nextIssue" => "202101140832", "nextOpentime" => "2021-01-14 13:52:00",
            "totalCount" => 1440, "openCount" => 831, "lotIcon" => "https://lottery-20190422.oss-cn-hongkong.aliyuncs.com/lottery_icon/azxy1.png"]], "pageAction" => null, "token" => null];
        return response()->json($data);
    }
}
