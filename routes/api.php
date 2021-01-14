<?php

use App\Http\Controllers\Ball\IndexController;
use Illuminate\Http\Request;
use Illuminate\Routing\Router;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/
use App\Http\Controllers\Ball;

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get('/getSysTime', [IndexController::class,"getSysTime"]);

Route::post('/lotteryMsgApi/lot-single-award', [IndexController::class,"lotSingleAward"]);
Route::post('/lotteryMsgApi/lot-index-list', [IndexController::class,"lotIndexList"]);

