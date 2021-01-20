<?php

namespace App\Models;

use DateTimeInterface;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UserBet extends Model
{
    use HasFactory;

    protected $table = 'user_bet';
    protected $primaryKey = 'id';
    public function __construct(array $attributes = [])
    {
        parent::__construct($attributes);
        $this->timestamps = true;
    }
    // 未开奖
    const NOT_OPEN = 0;
    // 已开奖
    const ALREADY_OPEN = 1;
    const NAMES = [
        "sum_max" => "总和大", "sum_min" => "总和小", "sum_odd" => "总和奇", "sum_even" => "总和偶", "dragon" => "龙", "tiger" => "虎", "draw" => "和",
        "first_max" => "一球大", "first_min" => "一球小", "first_odd" => "一球单", "first_even" => "一球双", "first_0" => "一球0", "first_1" => "一球1", "first_2" => "一球2",
        "first_3" => "一球3", "first_4" => "一球4", "first_5" => "一球5", "first_6" => "一球6", "first_7" => "一球7", "first_8" => "一球8", "first_9" => "一球9",

        "second_max" => "二球大", "second_min" => "二球小", "second_odd" => "二球单", "second_even" => "二球双", "second_0" => "二球0", "second_1" => "二球1", "second_2" => "二球2",
        "second_3" => "二球3", "second_4" => "二球4", "second_5" => "二球5", "second_6" => "二球6", "second_7" => "二球7", "second_8" => "二球8", "second_9" => "二球9",

        "third_max" => "三球大", "third_min" => "三球小", "third_odd" => "三球单", "third_even" => "三球双", "third_0" => "三球0", "third_1" => "三球1", "third_2" => "三球2",
        "third_3" => "三球3", "third_4" => "三球4", "third_5" => "三球5", "third_6" => "三球6", "third_7" => "三球7", "third_8" => "三球8", "third_9" => "三球9",

        "fourth_max" => "四球大", "fourth_min" => "四球小", "fourth_odd" => "四球单", "fourth_even" => "四球双", "fourth_0" => "四球0", "fourth_1" => "四球1", "fourth_2" => "四球2",
        "fourth_3" => "四球3", "fourth_4" => "四球4", "fourth_5" => "四球5", "fourth_6" => "四球6", "fourth_7" => "四球7", "fourth_8" => "四球8", "fourth_9" => "四球9",

        "fifth_max" => "五球大", "fifth_min" => "五球小", "fifth_odd" => "五球单", "fifth_even" => "五球双", "fifth_0" => "五球0", "fifth_1" => "五球1", "fifth_2" => "五球2",
        "fifth_3" => "五球3", "fifth_4" => "五球4", "fifth_5" => "五球5", "fifth_6" => "五球6", "fifth_7" => "五球7", "fifth_8" => "五球8", "fifth_9" => "五球9",

        "before_three_leopard" => "前三豹子", "before_three_straight" => "前三顺子",
        "before_three_two_pairs" => "前三对子", "before_three_half_straight" => "前三半顺", "before_three_discrete" => "前三杂六",

        "middle_three_leopard" => "中三豹子", "middle_three_straight" => "中三顺子", "middle_three_two_pairs" => "中三对子",
        "middle_three_half_straight" => "中三半顺", "middle_three_discrete" => "中三杂六",

        "after_three_leopard" => "后三豹子", "after_three_straight" => "后三顺子", "after_three_two_pairs" => "后三对子",
        "after_three_half_straight" => "后三半顺", "after_three_discrete" => "后三杂六",
    ];
    protected function serializeDate(DateTimeInterface $date)
    {
        return $date->format('Y-m-d H:i:s');
    }
}
