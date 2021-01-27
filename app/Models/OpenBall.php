<?php

namespace App\Models;

use DateTimeInterface;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class OpenBall extends Model
{
    use HasFactory;

    /**
     * 所有球
     */
    const ALL_BALL = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
    /**
     * 算法开奖
     */
    const ALGORITHM_OPEN = 0;
    /**
     * 随机开奖
     */
    const  RANDOM_OPEN = 1;
    /**
     * 人工开奖
     */
    const  ADMIN_OPEN = 2;
    /**
     * 开奖列表
     */
    const OPEN_METHOD = [
        self::ALGORITHM_OPEN => "算法开奖",
        self::RANDOM_OPEN => "随机开奖",
        self::ADMIN_OPEN => "人工开奖"
    ];
    const  CURRENT_OPEN_BALL_TIME = 300;
    const  NEXT_OPEN_BALL_TIME = 300;
    const  CURRENT_SEALING_TIME = 200;
    const  NEXT_SEALING_TIME = 200;
    // 下注中
    const STATUS_BETTING = 0;
    // 封盘中
    const STATUS_SEALING = 1;
    // 已结束
    const STATUS_ENDED = 2;

    // 总期数
    const SUM_PHASE = 240;


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

    const PLAY_TYPE_ICON_LIST = [
        self::WLXY5 => "http://127.0.0.1:8000/images/wlxy5.png",
        self::AZXY5 => "http://127.0.0.1:8000/images/azxy5.png",
        self::GD11CHECK5 => "http://127.0.0.1:8000/images/gd11check5.png",
        self::CUSTOMER_FIRST => "http://127.0.0.1:8000/images/gd11check5.png",
    ];
    protected $table = 'open_ball';
    protected $primaryKey = 'id';

    public function __construct(array $attributes = [])
    {
        parent::__construct($attributes);
        $this->timestamps = true;
    }

    protected function serializeDate(DateTimeInterface $date)
    {
        return $date->format('Y-m-d H:i:s');
    }


    public static function isSumBigSmallVal(array $array): string
    {
        if (array_sum($array) > 22) {
            return "大";
        }
        return "小";
    }

    public static function isSumSingleDoubleVal(array $array): string
    {

        if ((array_sum($array) % 2) != 0) {
            return "单";
        }
        return "双";
    }

    public static function isSumDragonTigerVal(array $array): string
    {
        if ($array[0] > $array[4]) {
            return "龙";
        } else if ($array[0] < $array[4]) {
            return "虎";
        } else if ($array[0] === $array[4]) {
            return "和";
        }
    }

    public static function beforeThreeVal(array $array): string
    {
        /**
         * 豹子
         */
        if (($array[0] === $array[1]) && ($array[1] === $array[2])) {
            return "豹子";
        }


        /**
         * 顺子
         */
        $is_straight_array = [$array[0], $array[1], $array[2]];
        sort($is_straight_array);
        if (($is_straight_array[1] - $is_straight_array[0] === 1) && ($is_straight_array[2] - $is_straight_array[1] === 1)) {
            return "顺子";
        }
        if ((($is_straight_array[0] === 0) && ($is_straight_array[1] === 1) && ($is_straight_array[2] === 9)) ||
            (($is_straight_array[0] === 0) && ($is_straight_array[1] === 8) && ($is_straight_array[2] === 9)) ||
            (($is_straight_array[0] === 8) && ($is_straight_array[1] === 9) && ($is_straight_array[2] === 0))) {
            return "顺子";
        }

        /**
         * 对子
         */
        if (($array[0] === $array[1]) || ($array[0] === $array[2]) || ($array[1] === $array[2])) {
            return "对子";
        }

        /**
         * 半顺
         */
        if (($is_straight_array[1] - $is_straight_array[0] === 1) || ($is_straight_array[2] - $is_straight_array[1] === 1)) {
            return "半顺";
        }
        if (($is_straight_array[0] === 0) && ($is_straight_array[2] === 9)) {
            return "半顺";
        }

        /**
         * 以上都不是就是杂六
         */
        return "杂六";
    }

    public static function middleThreeVal (array $array): string
    {
        /**
         * 豹子
         */
        if (($array[1] === $array[2]) && ($array[2] === $array[3])) {
            return "豹子";
        }

        /**
         * 顺子
         */
        $is_straight_array = [$array[1], $array[2], $array[3]];
        sort($is_straight_array);
        if (($is_straight_array[1] - $is_straight_array[0] === 1) && ($is_straight_array[2] - $is_straight_array[1] === 1)) {
            return "顺子";
        }
        if ((($is_straight_array[0] === 0) && ($is_straight_array[1] === 1) && ($is_straight_array[2] === 9)) ||
            (($is_straight_array[0] === 0) && ($is_straight_array[1] === 8) && ($is_straight_array[2] === 9)) ||
            (($is_straight_array[0] === 8) && ($is_straight_array[1] === 9) && ($is_straight_array[2] === 0))) {
            return "顺子";
        }
        /**
         * 对子
         */
        if (($array[1] === $array[2]) || ($array[1] === $array[3]) || ($array[2] === $array[3])) {
            return "对子";
        }

        /**
         * 半顺
         */
        if (($is_straight_array[1] - $is_straight_array[0] === 1) || ($is_straight_array[2] - $is_straight_array[1] === 1)) {
            return "半顺";
        }
        if (($is_straight_array[0] === 0) && ($is_straight_array[2] === 9)) {
            return "半顺";
        }
        /**
         * 以上都不是就是杂六
         */
        return "杂六";

    }


    public static function afterThreeVal(array $array) : string{
        /**
         * 豹子
         */
        if (($array[2] === $array[3]) && ($array[3] === $array[4])) {
            return "豹子";
        }

        /**
         * 栓子
         */
        $is_straight_array = [$array[2], $array[3], $array[4]];
        sort($is_straight_array);
        if (($is_straight_array[1] - $is_straight_array[0] === 1) && ($is_straight_array[2] - $is_straight_array[1] === 1)) {
            return "顺子";
        }
        if ((($is_straight_array[0] === 0) && ($is_straight_array[1] === 1) && ($is_straight_array[2] === 9)) ||
            (($is_straight_array[0] === 0) && ($is_straight_array[1] === 8) && ($is_straight_array[2] === 9)) ||
            (($is_straight_array[0] === 8) && ($is_straight_array[1] === 9) && ($is_straight_array[2] === 0))) {
            return "顺子";
        }
        /**
         * 对子
         */
        if (($array[2] === $array[3]) || ($array[2] === $array[4]) || ($array[3] === $array[4])) {
            return "对子";
        }

        /**
         * 半顺
         */
        $is_straight_array = [$array[2], $array[3], $array[4]];
        sort($is_straight_array);
        if (($is_straight_array[1] - $is_straight_array[0] === 1) || ($is_straight_array[2] - $is_straight_array[1] === 1)) {
            return "半顺";
        }
        if (($is_straight_array[0] === 0) && ($is_straight_array[2] === 9)) {
            return "半顺";
        }

        /**
         * 以上都不是就是杂六
         */
        return "杂六";

    }

}
