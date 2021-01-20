<?php

namespace App\Admin\Controllers\Ball;

use App\Admin\Actions\Bet\PrintBet;
use App\Models\OpenBall;
use App\Models\UserBet;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Illuminate\Support\MessageBag;

class BetController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'UserBet';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $_SESSION['test'] = "Test";
        $grid = new Grid(new UserBet());

        $grid->column('id', "ID");
        $grid->column('phase_number', "下注期数");
        $grid->column('order_number', "下注编号");
        $grid->column('is_open_lottery', "是否开奖")->using([0 => '未开奖', 1 => '已经开奖']);
        $grid->column('bet_sum', "下注总额");
        $grid->column('win_or_lose', "该注盈亏");
        $grid->column('created_at', "创建时间");
        $grid->column('updated_at', "更新时间");


        $grid->actions(function ($actions) {

            $actions->add(new PrintBet);

            // 去掉删除
            $actions->disableDelete();

            // 去掉编辑
//            $actions->disableEdit();

            // 去掉查看
            $actions->disableView();
        });

        return $grid;
    }


    /**
     * Make a show builder.
     *
     * @param mixed $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(UserBet::findOrFail($id));
//        $show->field(1 / 4, function ($form) {
//            $form->number('sum_max', "总和大")->default(0)->required()->setWidth(0, 3)->min(0);
//            $form->divider();
//        });
        $show->field('id', "ID")->setWidth(1);
        $show->field('phase_number', "下注期数")->setWidth(1);
        $show->field('order_number', "下注编号")->setWidth(1);
        $show->field('sum_max', "总和大")->setWidth(1);
        $show->field('sum_min', "总和小")->setWidth(1);
        $show->field('sum_odd', "总和奇")->setWidth(1);
        $show->field('sum_even', "总和偶")->setWidth(1);
        $show->field('dragon', "龙")->setWidth(1);
        $show->field('tiger', "虎")->setWidth(1);
        $show->field('draw', "和")->setWidth(1);
        $show->field('first_max', "一球大")->setWidth(1);
        $show->field('first_min', "一球小")->setWidth(1);
        $show->field('first_odd', "一球奇")->setWidth(1);
        $show->field('first_even', "一球偶")->setWidth(1);
        $show->field('first_0', "一球0")->setWidth(1);
        $show->field('first_1', "一球1")->setWidth(1);
        $show->field('first_2', "一球2")->setWidth(1);
        $show->field('first_3', "一球3")->setWidth(1);
        $show->field('first_4', "一球4")->setWidth(1);
        $show->field('first_5', "一球5")->setWidth(1);
        $show->field('first_6', "一球6")->setWidth(1);
        $show->field('first_7', "一球7")->setWidth(1);
        $show->field('first_8', "一球8")->setWidth(1);
        $show->field('first_9', "一球9")->setWidth(1);
        $show->field('second_max', "二球大")->setWidth(1);
        $show->field('second_min', "二球小")->setWidth(1);
        $show->field('second_odd', "二球奇")->setWidth(1);
        $show->field('second_even', "二球偶")->setWidth(1);
        $show->field('second_0', "二球0")->setWidth(1);
        $show->field('second_1', "二球1")->setWidth(1);
        $show->field('second_2', "二球2")->setWidth(1);
        $show->field('second_3', "二球3")->setWidth(1);
        $show->field('second_4', "二球4")->setWidth(1);
        $show->field('second_5', "二球5")->setWidth(1);
        $show->field('second_6', "二球6")->setWidth(1);
        $show->field('second_7', "二球7")->setWidth(1);
        $show->field('second_8', "二球8")->setWidth(1);
        $show->field('second_9', "二球9")->setWidth(1);

        $show->field('third_max', "三球大")->setWidth(1);
        $show->field('third_min', "三球小")->setWidth(1);
        $show->field('third_odd', "三球奇")->setWidth(1);
        $show->field('third_even', "三球偶")->setWidth(1);
        $show->field('third_0', "三球0")->setWidth(1);
        $show->field('third_1', "三球1")->setWidth(1);
        $show->field('third_2', "三球2")->setWidth(1);
        $show->field('third_3', "三球3")->setWidth(1);
        $show->field('third_4', "三球4")->setWidth(1);
        $show->field('third_5', "三球5")->setWidth(1);
        $show->field('third_6', "三球6")->setWidth(1);
        $show->field('third_7', "三球7")->setWidth(1);
        $show->field('third_8', "三球8")->setWidth(1);
        $show->field('third_9', "三球9")->setWidth(1);

        $show->field('fourth_max', "四球大")->setWidth(1);
        $show->field('fourth_min', "四球小")->setWidth(1);
        $show->field('fourth_odd', "四球奇")->setWidth(1);
        $show->field('fourth_even', "四球偶")->setWidth(1);
        $show->field('fourth_0', "四球0")->setWidth(1);
        $show->field('fourth_1', "四球1")->setWidth(1);
        $show->field('fourth_2', "四球2")->setWidth(1);
        $show->field('fourth_3', "四球3")->setWidth(1);
        $show->field('fourth_4', "四球4")->setWidth(1);
        $show->field('fourth_5', "四球5")->setWidth(1);
        $show->field('fourth_6', "四球6")->setWidth(1);
        $show->field('fourth_7', "四球7")->setWidth(1);
        $show->field('fourth_8', "四球8")->setWidth(1);
        $show->field('fourth_9', "四球9")->setWidth(1);

        $show->field('fifth_max', "五球大")->setWidth(1);
        $show->field('fifth_min', "五球小")->setWidth(1);
        $show->field('fifth_odd', "五球奇")->setWidth(1);
        $show->field('fifth_even', "五球偶")->setWidth(1);
        $show->field('fifth_0', "五球0")->setWidth(1);
        $show->field('fifth_1', "五球1")->setWidth(1);
        $show->field('fifth_2', "五球2")->setWidth(1);
        $show->field('fifth_3', "五球3")->setWidth(1);
        $show->field('fifth_4', "五球4")->setWidth(1);
        $show->field('fifth_5', "五球5")->setWidth(1);
        $show->field('fifth_6', "五球6")->setWidth(1);
        $show->field('fifth_7', "五球7")->setWidth(1);
        $show->field('fifth_8', "五球8")->setWidth(1);
        $show->field('fifth_9', "五球9")->setWidth(1);

        $show->field('before_three_leopard', "前三豹子")->setWidth(1);
        $show->field('before_three_straight', "前三顺子")->setWidth(1);
        $show->field('before_three_two_pairs', "前三对子")->setWidth(1);
        $show->field('before_three_half_straight', "前三半顺")->setWidth(1);
        $show->field('before_three_discrete', "前三杂六")->setWidth(1);

        $show->field('middle_three_leopard', "中三豹子")->setWidth(1);
        $show->field('middle_three_straight', "中三顺子")->setWidth(1);
        $show->field('middle_three_two_pairs', "中三对子")->setWidth(1);
        $show->field('middle_three_half_straight', "中三半顺")->setWidth(1);
        $show->field('middle_three_discrete', "中三杂六")->setWidth(1);

        $show->field('after_three_leopard', "后三豹子")->setWidth(1);
        $show->field('after_three_straight', "后三顺子")->setWidth(1);
        $show->field('after_three_two_pairs', "后三对子")->setWidth(1);
        $show->field('after_three_half_straight', "后三半顺")->setWidth(1);
        $show->field('after_three_discrete', "后三杂六")->setWidth(1);
        $show->field('after_three_discrete', "后三杂六")->setWidth(1);
        $show->field('after_three_discrete', "后三杂六")->setWidth(1);
        $show->field('bet_sum', "下注总额")->setWidth(1);
        $show->field('is_open_lottery', "是否开奖")->setWidth(1)->using([0 => "否", 1 => "是"]);

        $show->field('win_or_lose', "当注盈亏")->setWidth(1);
        $show->field('created_at', "创建时间")->setWidth(1);
        $show->field('updated_at', "更新时间")->setWidth(1);


        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new UserBet());
        $form->hidden('order_number');
        $form->hidden('bet_sum');
        $bet = OpenBall::query()->where('status', "!=", 2)->get()->first();

//保存前回调
        $form->saving(function (Form $form) use ($bet) {
            $betArray = [
                $form->sum_max, $form->sum_min, $form->sum_odd, $form->sum_even, $form->dragon, $form->tiger, $form->draw,
                $form->first_max, $form->first_min, $form->first_odd, $form->first_even, $form->first_0, $form->first_1, $form->first_2,
                $form->first_3, $form->first_4, $form->first_5, $form->first_6, $form->first_7, $form->first_8, $form->first_9,
                $form->second_max, $form->second_min, $form->second_odd, $form->second_even, $form->second_0, $form->second_1, $form->second_2,
                $form->second_3, $form->second_4, $form->second_5, $form->second_6, $form->second_7, $form->second_8, $form->second_9,
                $form->third_max, $form->third_min, $form->third_odd, $form->third_even, $form->third_0, $form->third_1, $form->third_2,
                $form->third_3, $form->third_4, $form->third_5, $form->third_6, $form->third_7, $form->third_8, $form->third_9,
                $form->fourth_max, $form->fourth_min, $form->fourth_odd, $form->fourth_even, $form->fourth_0, $form->fourth_1, $form->fourth_2,
                $form->fourth_3, $form->fourth_4, $form->fourth_5, $form->fourth_6, $form->fourth_7, $form->fourth_8, $form->fourth_9,
                $form->fifth_max, $form->fifth_min, $form->fifth_odd, $form->fifth_even, $form->fifth_0, $form->fifth_1, $form->fifth_2,
                $form->fifth_3, $form->fifth_4, $form->fifth_5, $form->fifth_6, $form->fifth_7, $form->fifth_8, $form->fifth_9,
            ];
            foreach ($betArray as $item) {
                if ($item < 0) {
                    $error = new MessageBag([
                        'title' => '下注失败',
                        'message' => '下注金额必须大于0',
                    ]);
                    return back()->with(compact('error'));
                }
            }
            $betSumPrice = array_sum($betArray);
            if ($betSumPrice <= 0) {
                $error = new MessageBag([
                    'title' => '下注失败',
                    'message' => '下注总额必须大于0',
                ]);
                return back()->with(compact('error'));
            }
            $time = time();
            if (($time >= ($bet->start_time + $bet->current_sealing_time)) || ($bet->status != 0)) {
                $error = new MessageBag([
                    'title' => '下注失败',
                    'message' => '该期已封盘或已结束',
                ]);
                return back()->with(compact('error'));
            }
            $form->bet_sum = $betSumPrice;
            $form->order_number = time();
        });

        $form->column(1 / 4, function ($form) use ($bet) {
            $end_time = $bet->start_time + $bet->current_open_ball_time - time();
            $form->bet_end_countdown($end_time);
        });

        $form->column(1 / 4, function ($form) use ($bet) {
            $sealing_time = $bet->start_time + $bet->current_sealing_time - time();
            $form->bet_sealing_countdown($sealing_time);
        });

        $form->column(1 / 4, function ($form) use ($bet) {
            $form->select('phase_number', "当前期数")->options([$bet->phase_number => $bet->phase_number])->default($bet->phase_number)->required()->readonly()->setWidth(4, 3);
//            $form->number('phase_number', "当前期数")->default($bet->phase_number)->required()->setWidth(3, 2);
            $form->divider();
        });

        $form->column(1 / 4, function ($form) use ($bet) {
            $form->select('play_type', "玩法彩种")->options([$bet->play_type => $bet->play_type])->default($bet->play_type)->required()->readonly()->setWidth(4, 3);
//            $form->number('phase_number', "当前期数")->default($bet->phase_number)->required()->setWidth(3, 2);
            $form->divider();
        });


        $form->column(1 / 4, function ($form) {
            $form->number('sum_max', "总和大")->default(0)->required()->setWidth(0, 3)->min(0);
            $form->divider();
        });
        $form->column(1 / 4, function ($form) {
            $form->number('sum_min', "总和小")->default(0)->required()->setWidth(0, 3)->min(0);
            $form->divider();
        });
        $form->column(1 / 4, function ($form) {
            $form->number('sum_odd', "总和单")->default(0)->required()->setWidth(0, 3)->min(0);
            $form->divider();

        });
        $form->column(1 / 4, function ($form) {
            $form->number('sum_even', "总和双")->default(0)->required()->setWidth(0, 3)->min(0);
            $form->divider();
        });
//


        $form->column(1 / 3, function ($form) {
            $form->number('dragon', "龙")->default(0)->required()->setWidth(0, 2)->min(0);
            $form->divider();
        });

        $form->column(1 / 3, function ($form) {
            $form->number('tiger', "虎")->default(0)->required()->setWidth(0, 3)->min(0);
            $form->divider();

        });
        $form->column(1 / 3, function ($form) {
            $form->number('draw', "和")->default(0)->required()->setWidth(0, 3)->min(0);
            $form->divider();

        });


        $form->column(1 / 3, function ($form) {
            $form->number('before_three_leopard', "前三豹子")->default(0)->required()->setWidth(0, 2)->min(0);
            $form->divider();
            $form->number('before_three_straight', "前三顺子")->default(0)->required()->setWidth(0, 2)->min(0);
            $form->divider();
            $form->number('before_three_two_pairs', "前三对子")->default(0)->required()->setWidth(0, 2)->min(0);
            $form->divider();
            $form->number('before_three_half_straight', "前三半顺")->default(0)->required()->setWidth(0, 2)->min(0);
            $form->divider();
            $form->number('before_three_discrete', "前三杂六")->default(0)->required()->setWidth(0, 2)->min(0);
            $form->divider();
        });

        $form->column(1 / 3, function ($form) {
            $form->number('middle_three_leopard', "中三豹子")->default(0)->required()->setWidth(0, 3)->min(0);
            $form->divider();
            $form->number('middle_three_straight', "中三顺子")->default(0)->required()->setWidth(0, 3)->min(0);
            $form->divider();
            $form->number('middle_three_two_pairs', "中三对子")->default(0)->required()->setWidth(0, 3)->min(0);
            $form->divider();
            $form->number('middle_three_half_straight', "中三半顺")->default(0)->required()->setWidth(0, 3)->min(0);
            $form->divider();
            $form->number('middle_three_discrete', "中三杂六")->default(0)->required()->setWidth(0, 3)->min(0);
            $form->divider();
        });

        $form->column(1 / 3, function ($form) {
            $form->number('after_three_leopard', "后三豹子")->default(0)->required()->setWidth(0, 3)->min(0);
            $form->divider();
            $form->number('after_three_straight', "后三顺子")->default(0)->required()->setWidth(0, 3)->min(0);
            $form->divider();
            $form->number('after_three_two_pairs', "后三对子")->default(0)->required()->setWidth(0, 3)->min(0);
            $form->divider();
            $form->number('after_three_half_straight', "后三半顺")->default(0)->required()->setWidth(0, 3)->min(0);
            $form->divider();
            $form->number('after_three_discrete', "后三杂六")->default(0)->required()->setWidth(0, 3)->min(0);
            $form->divider();
        });


        $form->column(1 / 6, function ($form) {

            $form->number('first_max', "一球大")->default(0)->required()->setWidth(0, 4)->min(0);
            $form->number('first_min', "一球小")->default(0)->required()->setWidth(0, 4)->min(0);
            $form->number('first_odd', "一球单")->default(0)->required()->setWidth(0, 4)->min(0);
            $form->number('first_even', "一球双")->default(0)->required()->setWidth(0, 4)->min(0);
            $form->number('first_0', "一球0")->default(0)->required()->setWidth(0, 4)->min(0);
            $form->number('first_1', "一球1")->default(0)->required()->setWidth(0, 4)->min(0);
            $form->number('first_2', "一球2")->default(0)->required()->setWidth(0, 4)->min(0);
            $form->number('first_3', "一球3")->default(0)->required()->setWidth(0, 4)->min(0);
            $form->number('first_4', "一球4")->default(0)->required()->setWidth(0, 4)->min(0);
            $form->number('first_5', "一球5")->default(0)->required()->setWidth(0, 4)->min(0);
            $form->number('first_6', "一球6")->default(0)->required()->setWidth(0, 4)->min(0);
            $form->number('first_6', "一球6")->default(0)->required()->setWidth(0, 4)->min(0);
            $form->number('first_8', "一球8")->default(0)->required()->setWidth(0, 4)->min(0);
            $form->number('first_9', "一球9")->default(0)->required()->setWidth(0, 4)->min(0);
        });
        $form->column(1 / 6, function ($form) {

            $form->number('second_max', "二球大")->default(0)->required()->setWidth(0, 4)->min(0);
            $form->number('second_min', "二球小")->default(0)->required()->setWidth(0, 4)->min(0);
            $form->number('second_odd', "二球单")->default(0)->required()->setWidth(0, 4)->min(0);
            $form->number('second_even', "二球双")->default(0)->required()->setWidth(0, 4)->min(0);
            $form->number('second_0', "二球0")->default(0)->required()->setWidth(0, 4)->min(0);
            $form->number('second_1', "二球1")->default(0)->required()->setWidth(0, 4)->min(0);
            $form->number('second_2', "二球2")->default(0)->required()->setWidth(0, 4)->min(0);
            $form->number('second_3', "二球3")->default(0)->required()->setWidth(0, 4)->min(0);
            $form->number('second_4', "二球4")->default(0)->required()->setWidth(0, 4)->min(0);
            $form->number('second_5', "二球5")->default(0)->required()->setWidth(0, 4)->min(0);
            $form->number('second_6', "二球6")->default(0)->required()->setWidth(0, 4)->min(0);
            $form->number('second_6', "二球6")->default(0)->required()->setWidth(0, 4)->min(0);
            $form->number('second_8', "二球8")->default(0)->required()->setWidth(0, 4)->min(0);
            $form->number('second_9', "二球9")->default(0)->required()->setWidth(0, 4)->min(0);
        });
        $form->column(1 / 6, function ($form) {
            $form->number('third_max', "三球大")->default(0)->required()->setWidth(0, 4)->min(0);
            $form->number('third_min', "三球小")->default(0)->required()->setWidth(0, 4)->min(0);
            $form->number('third_odd', "三球单")->default(0)->required()->setWidth(0, 4)->min(0);
            $form->number('third_even', "三球双")->default(0)->required()->setWidth(0, 4)->min(0);
            $form->number('third_0', "三球0")->default(0)->required()->setWidth(0, 4)->min(0);
            $form->number('third_1', "三球1")->default(0)->required()->setWidth(0, 4)->min(0);
            $form->number('third_2', "三球2")->default(0)->required()->setWidth(0, 4)->min(0);
            $form->number('third_3', "三球3")->default(0)->required()->setWidth(0, 4)->min(0);
            $form->number('third_4', "三球4")->default(0)->required()->setWidth(0, 4)->min(0);
            $form->number('third_5', "三球5")->default(0)->required()->setWidth(0, 4)->min(0);
            $form->number('third_6', "三球6")->default(0)->required()->setWidth(0, 4)->min(0);
            $form->number('third_6', "三球6")->default(0)->required()->setWidth(0, 4)->min(0);
            $form->number('third_8', "三球8")->default(0)->required()->setWidth(0, 4)->min(0);
            $form->number('third_9', "三球9")->default(0)->required()->setWidth(0, 4)->min(0);
        });
////
        $form->column(1 / 6, function ($form) {

            $form->number('fourth_max', "四球大")->default(0)->required()->setWidth(0, 4)->min(0);
            $form->number('fourth_min', "四球小")->default(0)->required()->setWidth(0, 4)->min(0);
            $form->number('fourth_odd', "四球单")->default(0)->required()->setWidth(0, 4)->min(0);
            $form->number('fourth_even', "四球双")->default(0)->required()->setWidth(0, 4)->min(0);
            $form->number('fourth_0', "四球0")->default(0)->required()->setWidth(0, 4)->min(0);
            $form->number('fourth_1', "四球1")->default(0)->required()->setWidth(0, 4)->min(0);
            $form->number('fourth_2', "四球2")->default(0)->required()->setWidth(0, 4)->min(0);
            $form->number('fourth_3', "四球3")->default(0)->required()->setWidth(0, 4)->min(0);
            $form->number('fourth_4', "四球4")->default(0)->required()->setWidth(0, 4)->min(0);
            $form->number('fourth_5', "四球5")->default(0)->required()->setWidth(0, 4)->min(0);
            $form->number('fourth_6', "四球6")->default(0)->required()->setWidth(0, 4)->min(0);
            $form->number('fourth_6', "四球6")->default(0)->required()->setWidth(0, 4)->min(0);
            $form->number('fourth_8', "四球8")->default(0)->required()->setWidth(0, 4)->min(0);
            $form->number('fourth_9', "四球9")->default(0)->required()->setWidth(0, 4)->min(0);
        });
//

        $form->column(1 / 6, function ($form) {
            $form->number('fifth_max', "五球大")->default(0)->required()->setWidth(0, 4)->min(0);
            $form->number('fifth_min', "五球小")->default(0)->required()->setWidth(0, 4)->min(0);
            $form->number('fifth_odd', "五球单")->default(0)->required()->setWidth(0, 4)->min(0);
            $form->number('fifth_even', "五球双")->default(0)->required()->setWidth(0, 4)->min(0);
            $form->number('fifth_0', "五球0")->default(0)->required()->setWidth(0, 4)->min(0);
            $form->number('fifth_1', "五球1")->default(0)->required()->setWidth(0, 4)->min(0);
            $form->number('fifth_2', "五球2")->default(0)->required()->setWidth(0, 4)->min(0);
            $form->number('fifth_3', "五球3")->default(0)->required()->setWidth(0, 4)->min(0);
            $form->number('fifth_4', "五球4")->default(0)->required()->setWidth(0, 4)->min(0);
            $form->number('fifth_5', "五球5")->default(0)->required()->setWidth(0, 4)->min(0);
            $form->number('fifth_6', "五球6")->default(0)->required()->setWidth(0, 4)->min(0);
            $form->number('fifth_6', "五球6")->default(0)->required()->setWidth(0, 4)->min(0);
            $form->number('fifth_8', "五球8")->default(0)->required()->setWidth(0, 4)->min(0);
            $form->number('fifth_9', "五球9")->default(0)->required()->setWidth(0, 4)->min(0);

        });


//        $form->number()->n
        $form->footer(function ($footer) {

            // 去掉`查看`checkbox
            $footer->disableViewCheck();

            // 去掉`继续编辑`checkbox
            $footer->disableEditingCheck();
            // 去掉`继续创建`checkbox
            $footer->disableCreatingCheck();

        });
        if ($form->isEditing()) {

            $form->tools(function (Form\Tools $tools) {


                // 去掉`删除`按钮
                $tools->disableDelete();

                // 去掉`查看`按钮
                $tools->disableView();

            });
            $form->footer(function ($footer) {
                // 去掉`重置`按钮
                $footer->disableReset();

                // 去掉`提交`按钮
                $footer->disableSubmit();

            });
        }

        return $form;
    }
}
