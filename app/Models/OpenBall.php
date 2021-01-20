<?php

namespace App\Models;

use DateTimeInterface;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class OpenBall extends Model
{
    use HasFactory;

    // 下注中
    const STATUS_BETTING = 0;
    // 封盘中
    const STATUS_SEALING = 1;
    // 已结束
    const STATUS_ENDED = 2;

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
