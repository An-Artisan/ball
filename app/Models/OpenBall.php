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

    const SUM_PHASE = 240;
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
