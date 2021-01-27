<?php

namespace App\Admin\Controllers\Ball;

use App\Models\OpenBall;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class OpenBallController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'OpenBall';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new OpenBall());
        $grid->column('end_countdown',"结束倒计时")->view('admin.end_countdown');
        $grid->column('sealing_countdown',"封盘倒计时")->view('admin.sealing_countdown');

        $grid->column('id', "ID");
        $grid->column('phase_number', "本期期号");
        $grid->column('current_phase',"当前期数");
        $grid->column('play_type', "当前彩种");
        $grid->column('sum_bet_price', "下注总额");
        $grid->column('win_or_lose', "该期盈亏");
        $grid->column('first_ball', "第一球")->editable('select',OpenBall::ALL_BALL);
        $grid->column('second_ball', "第二球")->editable('select', OpenBall::ALL_BALL);
        $grid->column('third_ball', "第三球")->editable('select', OpenBall::ALL_BALL);
        $grid->column('fourth_ball', "第四球")->editable('select',OpenBall::ALL_BALL);
        $grid->column('fifth_ball', "第五球")->editable('select',OpenBall::ALL_BALL);
        $grid->column('open_method', "开奖方式")->editable('select', OpenBall::OPEN_METHOD);
        $grid->column('current_open_ball_time', "本期开奖周期（单位：秒）");
        $grid->column('current_sealing_time', "本期封盘时间（单位：秒）");
        $grid->column('next_open_ball_time', "下期开奖周期（单位：秒）")->editable();
        $grid->column('next_sealing_time', "下期封盘时间（单位：秒）")->editable();
        $grid->column('status', "状态")->using([0 => "下注中", 1 => "已封盘", 2 => "已结束"]);
        $grid->column('start_time', "开盘时间")->display(function ($value) {
           return date("Y-m-d H:i:s",$value);
        });
        $grid->column('updated_at', "修改时间");
        $grid->disableCreateButton();
        $grid->disableActions();
        $grid->actions(function ($actions) {
            // 去掉删除
            $actions->disableDelete();
            // 去掉编辑
            $actions->disableEdit();
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
        $show = new Show(OpenBall::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('phase_number', __('Phase number'));
        $show->field('first_ball', __('First ball'));
        $show->field('second_ball', __('Second ball'));
        $show->field('third_ball', __('Third ball'));
        $show->field('fourth_ball', __('Fourth ball'));
        $show->field('fifth_ball', __('Fifth ball'));
        $show->field('open_method', __('Open method'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new OpenBall());
        $form->number('first_ball', "第一球");
        $form->number('second_ball', "第二球");
        $form->number('third_ball', "第三球");
        $form->number('fourth_ball', "第四球");
        $form->number('fifth_ball', "第五球");
        $form->number('open_method', "开奖方式");
        $form->number('open_method', "开奖方式");
        $form->number('status', "状态");
        $form->number('next_sealing_time', "下期封盘时间");
        $form->saving(function (Form $form) {
            $status = $form->model()->getAttribute("status");
            if ($status == 2) {
                // 返回一个简单response
                return response()->json([
                    'status' => false,
                    'message' => '已经结束的盘口不能修改',
                ]);
            }
        });
        return $form;
    }
}
