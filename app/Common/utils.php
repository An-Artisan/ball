<?php

function rules($array)
{
//    $rules = [
//        // 总和大，总和小，总和奇，总和偶，龙，虎，和，
//        "sum_max","sum_min","sum_odd","sum_even","dragon","tiger","draw",
//        // 第一球大，第一球小，第一球奇，第一球偶，第一球为1，第一球为2，第一球为3，第一球为4，第一球为5，第一球为6，第一球为7，第一球为8，第一球为9，
//        "first_max","first_min","first_odd","first_even","first_0","first_2","first_3","first_4","first_5","first_6","first_7","first_8","first_9",
//        // 第二球大，第二球小，第二球奇，第二球偶，第二球为1，第二球为2，第二球为3，第二球为4，第二球为5，第二球为6，第二球为7，第二球为8，第二球为9，
//        "second_max","second_min","second_odd","second_even","second_0","second_2","second_3","second_4","second_5","second_6","second_7","second_8","second_9",
//        // 第三球大，第三球小，第三球奇，第三球偶，第三球为1，第三球为2，第三球为3，第三球为4，第三球为5，第三球为6，第三球为7，第三球为8，第三球为9，
//        "third_max","third_min","third_odd","third_even","third_0","third_2","third_3","third_4","third_5","third_6","third_7","third_8","third_9",
//        // 第四球大，第四球小，第四球奇，第四球偶，第四球为1，第四球为2，第四球为3，第四球为4，第四球为5，第四球为6，第四球为7，第四球为8，第四球为9，
//        "fourth_max","fourth_min","fourth_odd","fourth_even","fourth_0","fourth_2","fourth_3","fourth_4","fourth_5","fourth_6","fourth_7","fourth_8","fourth_9",
//        // 第五球大，第五球小，第五球奇，第五球偶，第五球为1，第五球为2，第五球为3，第五球为4，第五球为5，第五球为6，第五球为7，第五球为8，第五球为9，
//        "fifth_max","fifth_min","fifth_odd","fifth_even","fifth_0","fifth_2","fifth_3","fifth_4","fifth_5","fifth_6","fifth_7","fifth_8","fifth_9",
//        // 前三豹子，前三顺子，前三对子，前三半顺，前三杂六
//        "before_three_leopard","before_three_straight","before_three_two_pairs","before_three_half_straight","before_three_discrete",
//        // 中三豹子，中三顺子，中三对子，中三半顺，中三杂六
//        "middle_three_leopard","middle_three_straight","middle_three_two_pairs","middle_three_half_straight","middle_three_discrete",
//        // 后三豹子，后三顺子，后三对子，后三半顺，后三杂六
//        "after_three_leopard","after_three_straight","after_three_two_pairs","after_three_half_straight","after_three_discrete",
//    ];
    $rules = [
// 总和大，总和小，总和奇，总和偶，龙，虎，和，
        "sum_max" => 1, "sum_min" => 2, "sum_odd" => 3, "sum_even" => 4, "dragon" => 5, "tiger" => 6, "draw" => 7,
// 第一球大，第一球小，第一球奇，第一球偶，第一球为1，第一球为2，第一球为3，第一球为4，第一球为5，第一球为6，第一球为7，第一球为8，第一球为9，
        "first_max" => 8, "first_min" => 9, "first_odd" => 10, "first_even" => 11, "first_0" => 12, "first_2" => 13, "first_3" => 14, "first_4" => 15, "first_5" => 16, "first_6" => 17, "first_7" => 18, "first_8" => 19, "first_9" => 20,
// 第二球大，第二球小，第二球奇，第二球偶，第二球为1，第二球为2，第二球为3，第二球为4，第二球为5，第二球为6，第二球为7，第二球为8，第二球为9，
        "second_max" => 21, "second_min" => 22, "second_odd" => 23, "second_even" => 24, "second_0" => 25, "second_2" => 26, "second_3" => 27, "second_4" => 28, "second_5" => 29, "second_6" => 30, "second_7" => 31, "second_8" => 32, "second_9" => 33,
// 第三球大，第三球小，第三球奇，第三球偶，第三球为1，第三球为2，第三球为3，第三球为4，第三球为5，第三球为6，第三球为7，第三球为8，第三球为9，
        "third_max" => 34, "third_min" => 35, "third_odd" => 36, "third_even" => 37, "third_0" => 38, "third_2" => 39, "third_3" => 40, "third_4" => 41, "third_5" => 42, "third_6" => 43, "third_7" => 44, "third_8" => 45, "third_9" => 46,
// 第四球大，第四球小，第四球奇，第四球偶，第四球为1，第四球为2，第四球为3，第四球为4，第四球为5，第四球为6，第四球为7，第四球为8，第四球为9，
        "fourth_max" => 47, "fourth_min" => 48, "fourth_odd" => 49, "fourth_even" => 50, "fourth_0" => 51, "fourth_2" => 52, "fourth_3" => 53, "fourth_4" => 54, "fourth_5" => 55, "fourth_6" => 56, "fourth_7" => 57, "fourth_8" => 58, "fourth_9" => 59,
// 第五球大，第五球小，第五球奇，第五球偶，第五球为1，第五球为2，第五球为3，第五球为4，第五球为5，第五球为6，第五球为7，第五球为8，第五球为9，
        "fifth_max" => 60, "fifth_min" => 61, "fifth_odd" => 62, "fifth_even" => 63, "fifth_0" => 64, "fifth_2" => 65, "fifth_3" => 66, "fifth_4" => 67, "fifth_5" => 68, "fifth_6" => 69, "fifth_7" => 70, "fifth_8" => 71, "fifth_9" => 72,
// 前三豹子，前三顺子，前三对子，前三半顺，前三杂六
        "before_three_leopard" => 73, "before_three_straight" => 74, "before_three_two_pairs" => 75, "before_three_half_straight" => 76, "before_three_discrete" => 77,
// 中三豹子，中三顺子，中三对子，中三半顺，中三杂六
        "middle_three_leopard" => 78, "middle_three_straight" => 79, "middle_three_two_pairs" => 80, "middle_three_half_straight" => 81, "middle_three_discrete" => 82,
// 后三豹子，后三顺子，后三对子，后三半顺，后三杂六
        "after_three_leopard" => 83, "after_three_straight" => 84, "after_three_two_pairs" => 85, "after_three_half_straight" => 86, "after_three_discrete" => 87,
    ];


//    $rules = [
//        "first_odd" => 1000, "first_even" => 200
//    ];
    return money($array, $rules);
}

//  当前球的所有规则计算的亏损
function money($balls, $rules)
{
    $money = 0;
    foreach ($rules as $func => $value) {
        $result = $func($balls);
        if ($result == 1) {
            $money -= $value;
        } else if ($result == 0) {
            $money += $value;
        }
    }
    return $money;

}

// 总和大
function sum_max($array)
{
    if (array_sum($array) > 22) {
        return 1;
    }
    return 0;
}

// 总和小
function sum_min($array)
{
    if (array_sum($array) < 23) {
        return 1;
    }
    return 0;
}

// 总合奇
function sum_odd($array)
{

    if ((array_sum($array) % 2) != 0) {
        return 1;
    }

    return 0;
}

// 总合偶
function sum_even($array)
{
    if ((array_sum($array) % 2) == 0) {
        return 1;
    }
    return 0;
}

// 龙
function dragon($array)
{
    if ($array[0] > $array[4]) {
        return 1;
    } else if ($array[0] < $array[4]) {
        return 0;
    } else if ($array[0] === $array[4]) {
        return 2;
    }
}

// 虎
function tiger($array)
{
    if ($array[0] < $array[4]) {
        return 1;
    } else if ($array[0] > $array[4]) {
        return 0;
    } else if ($array[0] === $array[4]) {
        return 2;
    }
}

// 和
function draw($array)
{
    if ($array[0] === $array[4]) {
        return 1;
    }
    return 0;

}

// 一球大
function first_max($array)
{
    if ($array[0] > 4) {
        return 1;
    }
    return 0;
}

// 一球小
function first_min($array)
{
    if ($array[0] < 5) {
        return 1;
    }
    return 0;
}

// 一球奇
function first_odd($array)
{
    if (($array[0] % 2) != 0) {
        return 1;
    }
    return 0;
}

// 一球偶
function first_even($array)
{
    if (($array[0] % 2) == 0) {
        return 1;
    }
    return 0;
}

// 一球0
function first_0($array)
{

    if ($array[0] === 0) {
        return 1;
    }
    return 0;
}

// 一球1
function first_1($array)
{
    if ($array[0] === 1) {
        return 1;
    }
    return 0;
}

// 一球2
function first_2($array)
{
    if ($array[0] === 2) {
        return 1;
    }
    return 0;
}

// 一球3
function first_3($array)
{
    if ($array[0] === 3) {
        return 1;
    }
    return 0;
}

// 一球4
function first_4($array)
{
    if ($array[0] === 4) {
        return 1;
    }
    return 0;
}

// 一球5
function first_5($array)
{
    if ($array[0] === 5) {
        return 1;
    }
    return 0;
}

// 一球6
function first_6($array)
{
    if ($array[0] === 6) {
        return 1;
    }
    return 0;
}

// 一球7
function first_7($array)
{
    if ($array[0] === 7) {
        return 1;
    }
    return 0;
}

// 一球8
function first_8($array)
{
    if ($array[0] === 8) {
        return 1;
    }
    return 0;
}

// 一球9
function first_9($array)
{
    if ($array[0] === 9) {
        return 1;
    }
    return 0;
}

// 二球大
function second_max($array)
{
    if ($array[1] > 4) {
        return 1;
    }
    return 0;
}

// 二球小
function second_min($array)
{
    if ($array[1] < 5) {
        return 1;
    }
    return 0;
}

// 二球奇
function second_odd($array)
{
    if (($array[1] % 2) != 0) {
        return 1;
    }
    return 0;
}

// 二球偶
function second_even($array)
{
    if (($array[1] % 2) == 0) {
        return 1;
    }
    return 0;
}

// 二球0
function second_0($array)
{
    if ($array[1] === 0) {
        return 1;
    }
    return 0;
}

// 二球1
function second_1($array)
{
    if ($array[1] === 1) {
        return 1;
    }
    return 0;
}

// 二球2
function second_2($array)
{
    if ($array[1] === 2) {
        return 1;
    }
    return 0;
}

// 二球3
function second_3($array)
{
    if ($array[1] === 3) {
        return 1;
    }
    return 0;
}

// 二球4
function second_4($array)
{
    if ($array[1] === 4) {
        return 1;
    }
    return 0;
}

// 二球5
function second_5($array)
{
    if ($array[1] === 5) {
        return 1;
    }
    return 0;
}

// 二球6
function second_6($array)
{
    if ($array[1] === 6) {
        return 1;
    }
    return 0;
}

// 二球7
function second_7($array)
{
    if ($array[1] === 7) {
        return 1;
    }
    return 0;
}

// 二球8
function second_8($array)
{
    if ($array[1] === 8) {
        return 1;
    }
    return 0;
}

// 二球9
function second_9($array)
{
    if ($array[1] === 9) {
        return 1;
    }
    return 0;
}


// 三球大
function third_max($array)
{
    if ($array[2] > 4) {
        return 1;
    }
    return 0;
}

// 三球小
function third_min($array)
{
    if ($array[2] < 5) {
        return 1;
    }
    return 0;
}

// 三球奇
function third_odd($array)
{
    if (($array[2] % 2) != 0) {
        return 1;
    }
    return 0;
}

// 三球偶
function third_even($array)
{
    if (($array[2] % 2) == 0) {
        return 1;
    }
    return 0;
}

// 三球0
function third_0($array)
{
    if ($array[2] === 0) {
        return 1;
    }
    return 0;
}

// 三球1
function third_1($array)
{
    if ($array[2] === 1) {
        return 1;
    }
    return 0;
}

// 三球2
function third_2($array)
{
    if ($array[2] === 2) {
        return 1;
    }
    return 0;
}

// 三球3
function third_3($array)
{
    if ($array[2] === 3) {
        return 1;
    }
    return 0;
}

// 三球4
function third_4($array)
{
    if ($array[2] === 4) {
        return 1;
    }
    return 0;
}

// 三球5
function third_5($array)
{
    if ($array[2] === 5) {
        return 1;
    }
    return 0;
}

// 三球6
function third_6($array)
{
    if ($array[2] === 6) {
        return 1;
    }
    return 0;
}

// 三球7
function third_7($array)
{
    if ($array[2] === 7) {
        return 1;
    }
    return 0;
}

// 三球8
function third_8($array)
{
    if ($array[2] === 8) {
        return 1;
    }
    return 0;
}

// 三球9
function third_9($array)
{
    if ($array[2] === 9) {
        return 1;
    }
    return 0;
}


// 四球大
function fourth_max($array)
{
    if ($array[3] > 4) {
        return 1;
    }
    return 0;
}

// 四球小
function fourth_min($array)
{
    if ($array[3] < 5) {
        return 1;
    }
    return 0;
}

// 四球奇
function fourth_odd($array)
{
    if (($array[3] % 2) != 0) {
        return 1;
    }
    return 0;
}

// 四球偶
function fourth_even($array)
{
    if (($array[3] % 2) == 0) {
        return 1;
    }
    return 0;
}

// 四球0
function fourth_0($array)
{
    if ($array[3] === 0) {
        return 1;
    }
    return 0;
}

// 四球1
function fourth_1($array)
{
    if ($array[3] === 1) {
        return 1;
    }
    return 0;
}

// 四球2
function fourth_2($array)
{
    if ($array[3] === 2) {
        return 1;
    }
    return 0;
}

// 四球3
function fourth_3($array)
{
    if ($array[3] === 3) {
        return 1;
    }
    return 0;
}

// 四球4
function fourth_4($array)
{
    if ($array[3] === 4) {
        return 1;
    }
    return 0;
}

// 四球5
function fourth_5($array)
{
    if ($array[3] === 5) {
        return 1;
    }
    return 0;
}

// 四球6
function fourth_6($array)
{
    if ($array[3] === 6) {
        return 1;
    }
    return 0;
}

// 四球7
function fourth_7($array)
{
    if ($array[3] === 7) {
        return 1;
    }
    return 0;
}

// 四球8
function fourth_8($array)
{
    if ($array[3] === 8) {
        return 1;
    }
    return 0;
}

// 四球9
function fourth_9($array)
{
    if ($array[3] === 9) {
        return 1;
    }
    return 0;
}


// 五球大
function fifth_max($array)
{
    if ($array[4] > 4) {
        return 1;
    }
    return 0;
}

// 五球小
function fifth_min($array)
{
    if ($array[4] < 5) {
        return 1;
    }
    return 0;
}

// 五球奇
function fifth_odd($array)
{
    if (($array[4] % 2) != 0) {
        return 1;
    }
    return 0;
}

// 五球偶
function fifth_even($array)
{
    if (($array[4] % 2) == 0) {
        return 1;
    }
    return 0;
}

// 五球0
function fifth_0($array)
{
    if ($array[4] === 0) {
        return 1;
    }
    return 0;
}

// 五球1
function fifth_1($array)
{
    if ($array[4] === 1) {
        return 1;
    }
    return 0;
}

// 五球2
function fifth_2($array)
{
    if ($array[4] === 2) {
        return 1;
    }
    return 0;
}

// 五球3
function fifth_3($array)
{
    if ($array[4] === 3) {
        return 1;
    }
    return 0;
}

// 五球4
function fifth_4($array)
{
    if ($array[4] === 4) {
        return 1;
    }
    return 0;
}

// 五球5
function fifth_5($array)
{
    if ($array[4] === 5) {
        return 1;
    }
    return 0;
}

// 五球6
function fifth_6($array)
{
    if ($array[4] === 6) {
        return 1;
    }
    return 0;
}

// 五球7
function fifth_7($array)
{
    if ($array[4] === 7) {
        return 1;
    }
    return 0;
}

// 五球8
function fifth_8($array)
{
    if ($array[4] === 8) {
        return 1;
    }
    return 0;
}

// 五球9
function fifth_9($array)
{
    if ($array[4] === 9) {
        return 1;
    }
    return 0;
}


// 前三豹子
function before_three_leopard($array)
{
    if (($array[0] === $array[1]) && ($array[1] === $array[2])) {
        return 1;
    }
    return 0;
}

// 前三顺子
function before_three_straight($array)
{
    $is_straight_array = [$array[0], $array[1], $array[2]];
    sort($is_straight_array);
    if (($is_straight_array[1] - $is_straight_array[0] === 1) && ($is_straight_array[2] - $is_straight_array[1] === 1)) {
        return 1;
    }
    if ((($is_straight_array[0] === 0) && ($is_straight_array[1] === 1) && ($is_straight_array[2] === 9)) ||
        (($is_straight_array[0] === 0) && ($is_straight_array[1] === 8) && ($is_straight_array[2] === 9)) ||
        (($is_straight_array[0] === 8) && ($is_straight_array[1] === 9) && ($is_straight_array[2] === 0))) {
        return 1;
    }
    unset($is_straight_array);
    return 0;
}

// 前三对子
function before_three_two_pairs($array)
{
    if (($array[0] === $array[1]) || ($array[0] === $array[2]) || ($array[1] === $array[2])) {
        return 1;
    }
    return 0;
}


// 前三半顺
function before_three_half_straight($array)
{
    $is_straight_array = [$array[0], $array[1], $array[2]];
    sort($is_straight_array);
    if (($is_straight_array[1] - $is_straight_array[0] === 1) || ($is_straight_array[2] - $is_straight_array[1] === 1)) {
        return 1;
    }
    if (($is_straight_array[0] === 0) && ($is_straight_array[2] === 9)) {
        return 1;
    }
    unset($is_straight_array);
    return 0;
}

// 前三杂六
function before_three_discrete($array)
{
    $result = before_three_leopard($array);
    if ($result === 1) {
        return 0;
    }
    $result = before_three_straight($array);
    if ($result === 1) {
        return 0;
    }
    $result = before_three_two_pairs($array);
    if ($result === 1) {
        return 0;
    }
    $result = before_three_half_straight($array);
    if ($result === 1) {
        return 0;
    }
    return 1;

}


// 中三豹子
function middle_three_leopard($array)
{
    if (($array[1] === $array[2]) && ($array[2] === $array[3])) {
        return 1;
    }
    return 0;
}

// 中三顺子
function middle_three_straight($array)
{
    $is_straight_array = [$array[1], $array[2], $array[3]];
    sort($is_straight_array);
    if (($is_straight_array[1] - $is_straight_array[0] === 1) && ($is_straight_array[2] - $is_straight_array[1] === 1)) {
        return 1;
    }
    if ((($is_straight_array[0] === 0) && ($is_straight_array[1] === 1) && ($is_straight_array[2] === 9)) ||
        (($is_straight_array[0] === 0) && ($is_straight_array[1] === 8) && ($is_straight_array[2] === 9)) ||
        (($is_straight_array[0] === 8) && ($is_straight_array[1] === 9) && ($is_straight_array[2] === 0))) {
        return 1;
    }
    unset($is_straight_array);
    return 0;
}

// 中三对子
function middle_three_two_pairs($array)
{
    if (($array[1] === $array[2]) || ($array[1] === $array[3]) || ($array[2] === $array[3])) {
        return 1;
    }
    return 0;
}

// 中三半顺
function middle_three_half_straight($array)
{
    $is_straight_array = [$array[1], $array[2], $array[3]];
    sort($is_straight_array);
    if (($is_straight_array[1] - $is_straight_array[0] === 1) || ($is_straight_array[2] - $is_straight_array[1] === 1)) {
        return 1;
    }
    if (($is_straight_array[0] === 0) && ($is_straight_array[2] === 9)) {
        return 1;
    }
    unset($is_straight_array);
    return 0;
}

// 中三杂六
function middle_three_discrete($array)
{
    $result = middle_three_leopard($array);
    if ($result === 1) {
        return 0;
    }
    $result = middle_three_straight($array);
    if ($result === 1) {
        return 0;
    }
    $result = middle_three_two_pairs($array);
    if ($result === 1) {
        return 0;
    }
    $result = middle_three_half_straight($array);
    if ($result === 1) {
        return 0;
    }
    return 1;
}

// 后三豹子
function after_three_leopard($array)
{
    if (($array[2] === $array[3]) && ($array[3] === $array[4])) {
        return 1;
    }
    return 0;
}

// 后三顺子
function after_three_straight($array)
{
    $is_straight_array = [$array[2], $array[3], $array[4]];
    sort($is_straight_array);
    if (($is_straight_array[1] - $is_straight_array[0] === 1) && ($is_straight_array[2] - $is_straight_array[1] === 1)) {
        return 1;
    }
    if ((($is_straight_array[0] === 0) && ($is_straight_array[1] === 1) && ($is_straight_array[2] === 9)) ||
        (($is_straight_array[0] === 0) && ($is_straight_array[1] === 8) && ($is_straight_array[2] === 9)) ||
        (($is_straight_array[0] === 8) && ($is_straight_array[1] === 9) && ($is_straight_array[2] === 0))) {
        return 1;
    }
    unset($is_straight_array);
    return 0;

}

// 后三对子
function after_three_two_pairs($array)
{
    if (($array[2] === $array[3]) || ($array[2] === $array[4]) || ($array[3] === $array[4])) {
        return 1;
    }
    return 0;

}

// 后三半顺
function after_three_half_straight($array)
{

    $is_straight_array = [$array[2], $array[3], $array[4]];
    sort($is_straight_array);
    if (($is_straight_array[1] - $is_straight_array[0] === 1) || ($is_straight_array[2] - $is_straight_array[1] === 1)) {
        return 1;
    }
    if (($is_straight_array[0] === 0) && ($is_straight_array[2] === 9)) {
        return 1;
    }
    unset($is_straight_array);
    return 0;
}

// 后三杂六
function after_three_discrete($array)
{
    $result = after_three_leopard($array);
    if ($result === 1) {
        return 0;
    }
    $result = after_three_straight($array);
    if ($result === 1) {
        return 0;
    }
    $result = after_three_two_pairs($array);
    if ($result === 1) {
        return 0;
    }
    $result = after_three_half_straight($array);
    if ($result === 1) {
        return 0;
    }
    return 1;
}

//$firsts = range(0, 9);
//shuffle($firsts);
//$seconds = range(0, 9);
//shuffle($seconds);
//$thirds = range(0, 9);
//shuffle($thirds);
//$fourths = range(0, 9);
//shuffle($fourths);
//$fifths = range(0, 9);
//shuffle($fifths);
//$i = 0;
//foreach ($firsts as $first) {
//    foreach ($seconds as $second) {
//        foreach ($thirds as $third) {
//            foreach ($fourths as $fourth) {
//                foreach ($fifths as $fifth) {
//                    $data[$i]['ball'] = [$first, $second, $third, $fourth, $fifth];
//                    $data[$i]["money"] = rules($data[$i]['ball']);
//                    $i++;
//                }
//            }
//        }
//    }
//}

////$data = [["ball" => [1,2,3,4,6],"money" => 800],["ball" => [0,0,0,0,0],"money" => 900],["ball" => [2,2,3,4,5],"money" => 900],["ball" => [1,9,3,4,5],"money" => 900],["ball" => [1,9,3,4,9],"money" => 900]];
//$last_ages = array_column($data, 'money');
//array_multisort($last_ages, SORcomposer.jsonT_DESC, $data,SORT_NATURAL);
//var_dump($data[0]);
//exit;



