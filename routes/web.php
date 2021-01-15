<?php

use App\Models\UserBet;
use App\Models\UserBetOdds;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::get('/bet/{number}', function ($number) {

    $result = \App\Models\UserBet::query()->find($number);
    $odds = UserBetOdds::query()->where("key", "azxy5")->get()->first()->toArray();
    if (!$result) return response()->json(["msg" => "数据不存在"]);
    $result = $result->toArray();
    $result = array_diff($result, [0]);
    $phaseNumber = $result['phase_number'];
    $orderNumber = $result['order_number'];
    unset($result['id']);
    unset($result['created_at']);
    unset($result['updated_at']);
    unset($result['win_or_lose']);
    unset($result['phase_number']);
    unset($result['order_number']);

    $data = [];
    $sumPrice = 0;
    foreach ($result as $key => $value) {
        $data[] = ["bet_price" => $value,"bet_odds" => $odds[$key],"name" => UserBet::NAMES[$key]];
        $sumPrice += $value;
    }

    return view('bet',["data" => $data,"phaseNumber" => $phaseNumber,"orderNumber" => $orderNumber,"sumPrice" => $sumPrice]);
});
