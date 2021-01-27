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
}
