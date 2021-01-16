<?php

use Encore\Admin\Facades\Admin;
use Illuminate\Routing\Router;
use Illuminate\Support\Facades\Route;

Admin::routes();

Route::group([
    'prefix'        => config('admin.route.prefix'),
    'namespace'     => config('admin.route.namespace'),
    'middleware'    => config('admin.route.middleware'),
    'as'            => config('admin.route.prefix') . '.',
], function (Router $router) {

    $router->get('/', 'HomeController@index')->name('home');

    /**
     * 下注管理
     */
    $router->resource('user-bets', 'Ball\BetController');
    /**
     * 赔率管理
     */
    $router->resource('user-bet-odds', 'Ball\BetOddsController');
    /**
     * 开奖管理
     */
    $router->resource('open-balls', 'Ball\OpenBallController');

});


