<?php

namespace App\Admin\Controllers\Ball;

use App\Models\UserBetOdds;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class BetOddsController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'UserBetOdds';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new UserBetOdds());

        $grid->column('id', "ID");
        $grid->column('key', "彩种名称");

        $grid->column('created_at', "创建时间");
        $grid->column('updated_at', "更新时间");
        $grid->actions(function ($actions) {

            // 去掉删除
            $actions->disableDelete();



            // 去掉查看
            $actions->disableView();
        });
        $grid->disableCreateButton();
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
        $show = new Show(UserBetOdds::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('key', __('Key'));
        $show->field('sum_max', __('Sum max'));
        $show->field('sum_min', __('Sum min'));
        $show->field('sum_odd', __('Sum odd'));
        $show->field('sum_even', __('Sum even'));
        $show->field('dragon', __('Dragon'));
        $show->field('tiger', __('Tiger'));
        $show->field('draw', __('Draw'));
        $show->field('first_max', __('First max'));
        $show->field('first_min', __('First min'));
        $show->field('first_odd', __('First odd'));
        $show->field('first_even', __('First even'));
        $show->field('first_0', __('First 0'));
        $show->field('first_1', __('First 1'));
        $show->field('first_2', __('First 2'));
        $show->field('first_3', __('First 3'));
        $show->field('first_4', __('First 4'));
        $show->field('first_5', __('First 5'));
        $show->field('first_6', __('First 6'));
        $show->field('first_7', __('First 7'));
        $show->field('first_8', __('First 8'));
        $show->field('first_9', __('First 9'));
        $show->field('second_max', __('Second max'));
        $show->field('second_min', __('Second min'));
        $show->field('second_odd', __('Second odd'));
        $show->field('second_even', __('Second even'));
        $show->field('second_0', __('Second 0'));
        $show->field('second_1', __('Second 1'));
        $show->field('second_2', __('Second 2'));
        $show->field('second_3', __('Second 3'));
        $show->field('second_4', __('Second 4'));
        $show->field('second_5', __('Second 5'));
        $show->field('second_6', __('Second 6'));
        $show->field('second_7', __('Second 7'));
        $show->field('second_8', __('Second 8'));
        $show->field('second_9', __('Second 9'));
        $show->field('third_max', __('Third max'));
        $show->field('third_min', __('Third min'));
        $show->field('third_odd', __('Third odd'));
        $show->field('third_even', __('Third even'));
        $show->field('third_0', __('Third 0'));
        $show->field('third_1', __('Third 1'));
        $show->field('third_2', __('Third 2'));
        $show->field('third_3', __('Third 3'));
        $show->field('third_4', __('Third 4'));
        $show->field('third_5', __('Third 5'));
        $show->field('third_6', __('Third 6'));
        $show->field('third_7', __('Third 7'));
        $show->field('third_8', __('Third 8'));
        $show->field('third_9', __('Third 9'));
        $show->field('fourth_max', __('Fourth max'));
        $show->field('fourth_min', __('Fourth min'));
        $show->field('fourth_odd', __('Fourth odd'));
        $show->field('fourth_even', __('Fourth even'));
        $show->field('fourth_0', __('Fourth 0'));
        $show->field('fourth_1', __('Fourth 1'));
        $show->field('fourth_2', __('Fourth 2'));
        $show->field('fourth_3', __('Fourth 3'));
        $show->field('fourth_4', __('Fourth 4'));
        $show->field('fourth_5', __('Fourth 5'));
        $show->field('fourth_6', __('Fourth 6'));
        $show->field('fourth_7', __('Fourth 7'));
        $show->field('fourth_8', __('Fourth 8'));
        $show->field('fourth_9', __('Fourth 9'));
        $show->field('fifth_max', __('Fifth max'));
        $show->field('fifth_min', __('Fifth min'));
        $show->field('fifth_odd', __('Fifth odd'));
        $show->field('fifth_even', __('Fifth even'));
        $show->field('fifth_0', __('Fifth 0'));
        $show->field('fifth_1', __('Fifth 1'));
        $show->field('fifth_2', __('Fifth 2'));
        $show->field('fifth_3', __('Fifth 3'));
        $show->field('fifth_4', __('Fifth 4'));
        $show->field('fifth_5', __('Fifth 5'));
        $show->field('fifth_6', __('Fifth 6'));
        $show->field('fifth_7', __('Fifth 7'));
        $show->field('fifth_8', __('Fifth 8'));
        $show->field('fifth_9', __('Fifth 9'));
        $show->field('before_three_leopard', __('Before three leopard'));
        $show->field('before_three_straight', __('Before three straight'));
        $show->field('before_three_two_pairs', __('Before three two pairs'));
        $show->field('before_three_half_straight', __('Before three half straight'));
        $show->field('before_three_discrete', __('Before three discrete'));
        $show->field('middle_three_leopard', __('Middle three leopard'));
        $show->field('middle_three_straight', __('Middle three straight'));
        $show->field('middle_three_two_pairs', __('Middle three two pairs'));
        $show->field('middle_three_half_straight', __('Middle three half straight'));
        $show->field('middle_three_discrete', __('Middle three discrete'));
        $show->field('after_three_leopard', __('After three leopard'));
        $show->field('after_three_straight', __('After three straight'));
        $show->field('after_three_two_pairs', __('After three two pairs'));
        $show->field('after_three_half_straight', __('After three half straight'));
        $show->field('after_three_discrete', __('After three discrete'));
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
        $form = new Form(new UserBetOdds());

//


        $form->column(1 / 4, function ($form) {
            $form->decimal('sum_max', "总和大")->default(1)->required()->setWidth(0, 3);
            $form->divider();
        });
        $form->column(1 / 4, function ($form) {
            $form->decimal('sum_min', "总和小")->default(1)->required()->setWidth(0, 3);
            $form->divider();
        });
        $form->column(1 / 4, function ($form) {
            $form->decimal('sum_odd', "总和单")->default(1)->required()->setWidth(0, 3);
            $form->divider();

        });
        $form->column(1 / 4, function ($form) {
            $form->decimal('sum_even', "总和双")->default(1)->required()->setWidth(0, 3);
            $form->divider();
        });
        $form->column(1 / 3, function ($form) {
            $form->decimal('dragon', "龙")->default(1)->required()->setWidth(0, 2);
            $form->divider();
        });
        $form->column(1 / 3, function ($form) {
            $form->decimal('tiger', "虎")->default(1)->required()->setWidth(0, 3);
            $form->divider();

        });
        $form->column(1 / 3, function ($form) {
            $form->decimal('draw', "和")->default(1)->required()->setWidth(0, 3);
            $form->divider();

        });
        $form->column(1 / 3, function ($form) {
            $form->decimal('before_three_leopard', "前三豹子")->default(1)->required()->setWidth(0, 2);
            $form->divider();
            $form->decimal('before_three_straight', "前三顺子")->default(1)->required()->setWidth(0, 2);
            $form->divider();
            $form->decimal('before_three_two_pairs', "前三对子")->default(1)->required()->setWidth(0, 2);
            $form->divider();
            $form->decimal('before_three_half_straight', "前三半顺")->default(1)->required()->setWidth(0, 2);
            $form->divider();
            $form->decimal('before_three_discrete', "前三杂六")->default(1)->required()->setWidth(0, 2);
            $form->divider();
        });
        $form->column(1 / 3, function ($form) {
            $form->decimal('middle_three_leopard', "中三豹子")->default(1)->required()->setWidth(0, 3);
            $form->divider();
            $form->decimal('middle_three_straight', "中三顺子")->default(1)->required()->setWidth(0, 3);
            $form->divider();
            $form->decimal('middle_three_two_pairs', "中三对子")->default(1)->required()->setWidth(0, 3);
            $form->divider();
            $form->decimal('middle_three_half_straight', "中三半顺")->default(1)->required()->setWidth(0, 3);
            $form->divider();
            $form->decimal('middle_three_discrete', "中三杂六")->default(1)->required()->setWidth(0, 3);
            $form->divider();
        });
        $form->column(1 / 3, function ($form) {
            $form->decimal('after_three_leopard', "后三豹子")->default(1)->required()->setWidth(0, 3);
            $form->divider();
            $form->decimal('after_three_straight', "后三顺子")->default(1)->required()->setWidth(0, 3);
            $form->divider();
            $form->decimal('after_three_two_pairs', "后三对子")->default(1)->required()->setWidth(0, 3);
            $form->divider();
            $form->decimal('after_three_half_straight', "后三半顺")->default(1)->required()->setWidth(0, 3);
            $form->divider();
            $form->decimal('after_three_discrete', "后三杂六")->default(1)->required()->setWidth(0, 3);
            $form->divider();
        });
        $form->column(1 / 6, function ($form) {

            $form->decimal('first_max', "一球大")->default(1)->required()->setWidth(0, 4);
            $form->decimal('first_min', "一球小")->default(1)->required()->setWidth(0, 4);
            $form->decimal('first_odd', "一球单")->default(1)->required()->setWidth(0, 4);
            $form->decimal('first_even', "一球双")->default(1)->required()->setWidth(0, 4);
            $form->decimal('first_0', "一球0")->default(1)->required()->setWidth(0, 4);
            $form->decimal('first_1', "一球1")->default(1)->required()->setWidth(0, 4);
            $form->decimal('first_2', "一球2")->default(1)->required()->setWidth(0, 4);
            $form->decimal('first_3', "一球3")->default(1)->required()->setWidth(0, 4);
            $form->decimal('first_4', "一球4")->default(1)->required()->setWidth(0, 4);
            $form->decimal('first_5', "一球5")->default(1)->required()->setWidth(0, 4);
            $form->decimal('first_6', "一球6")->default(1)->required()->setWidth(0, 4);
            $form->decimal('first_6', "一球6")->default(1)->required()->setWidth(0, 4);
            $form->decimal('first_8', "一球8")->default(1)->required()->setWidth(0, 4);
            $form->decimal('first_9', "一球9")->default(1)->required()->setWidth(0, 4);
        });
        $form->column(1 / 6, function ($form) {

            $form->decimal('second_max', "二球大")->default(1)->required()->setWidth(0, 4);
            $form->decimal('second_min', "二球小")->default(1)->required()->setWidth(0, 4);
            $form->decimal('second_odd', "二球单")->default(1)->required()->setWidth(0, 4);
            $form->decimal('second_even', "二球双")->default(1)->required()->setWidth(0, 4);
            $form->decimal('second_0', "二球0")->default(1)->required()->setWidth(0, 4);
            $form->decimal('second_1', "二球1")->default(1)->required()->setWidth(0, 4);
            $form->decimal('second_2', "二球2")->default(1)->required()->setWidth(0, 4);
            $form->decimal('second_3', "二球3")->default(1)->required()->setWidth(0, 4);
            $form->decimal('second_4', "二球4")->default(1)->required()->setWidth(0, 4);
            $form->decimal('second_5', "二球5")->default(1)->required()->setWidth(0, 4);
            $form->decimal('second_6', "二球6")->default(1)->required()->setWidth(0, 4);
            $form->decimal('second_6', "二球6")->default(1)->required()->setWidth(0, 4);
            $form->decimal('second_8', "二球8")->default(1)->required()->setWidth(0, 4);
            $form->decimal('second_9', "二球9")->default(1)->required()->setWidth(0, 4);
        });
        $form->column(1 / 6, function ($form) {
            $form->decimal('third_max', "三球大")->default(1)->required()->setWidth(0, 4);
            $form->decimal('third_min', "三球小")->default(1)->required()->setWidth(0, 4);
            $form->decimal('third_odd', "三球单")->default(1)->required()->setWidth(0, 4);
            $form->decimal('third_even', "三球双")->default(1)->required()->setWidth(0, 4);
            $form->decimal('third_0', "三球0")->default(1)->required()->setWidth(0, 4);
            $form->decimal('third_1', "三球1")->default(1)->required()->setWidth(0, 4);
            $form->decimal('third_2', "三球2")->default(1)->required()->setWidth(0, 4);
            $form->decimal('third_3', "三球3")->default(1)->required()->setWidth(0, 4);
            $form->decimal('third_4', "三球4")->default(1)->required()->setWidth(0, 4);
            $form->decimal('third_5', "三球5")->default(1)->required()->setWidth(0, 4);
            $form->decimal('third_6', "三球6")->default(1)->required()->setWidth(0, 4);
            $form->decimal('third_6', "三球6")->default(1)->required()->setWidth(0, 4);
            $form->decimal('third_8', "三球8")->default(1)->required()->setWidth(0, 4);
            $form->decimal('third_9', "三球9")->default(1)->required()->setWidth(0, 4);
        });
        $form->column(1 / 6, function ($form) {

            $form->decimal('fourth_max', "四球大")->default(1)->required()->setWidth(0, 4);
            $form->decimal('fourth_min', "四球小")->default(1)->required()->setWidth(0, 4);
            $form->decimal('fourth_odd', "四球单")->default(1)->required()->setWidth(0, 4);
            $form->decimal('fourth_even', "四球双")->default(1)->required()->setWidth(0, 4);
            $form->decimal('fourth_0', "四球0")->default(1)->required()->setWidth(0, 4);
            $form->decimal('fourth_1', "四球1")->default(1)->required()->setWidth(0, 4);
            $form->decimal('fourth_2', "四球2")->default(1)->required()->setWidth(0, 4);
            $form->decimal('fourth_3', "四球3")->default(1)->required()->setWidth(0, 4);
            $form->decimal('fourth_4', "四球4")->default(1)->required()->setWidth(0, 4);
            $form->decimal('fourth_5', "四球5")->default(1)->required()->setWidth(0, 4);
            $form->decimal('fourth_6', "四球6")->default(1)->required()->setWidth(0, 4);
            $form->decimal('fourth_6', "四球6")->default(1)->required()->setWidth(0, 4);
            $form->decimal('fourth_8', "四球8")->default(1)->required()->setWidth(0, 4);
            $form->decimal('fourth_9', "四球9")->default(1)->required()->setWidth(0, 4);
        });
        $form->column(1 / 6, function ($form) {
            $form->decimal('fifth_max', "五球大")->default(1)->required()->setWidth(0, 4);
            $form->decimal('fifth_min', "五球小")->default(1)->required()->setWidth(0, 4);
            $form->decimal('fifth_odd', "五球单")->default(1)->required()->setWidth(0, 4);
            $form->decimal('fifth_even', "五球双")->default(1)->required()->setWidth(0, 4);
            $form->decimal('fifth_0', "五球0")->default(1)->required()->setWidth(0, 4);
            $form->decimal('fifth_1', "五球1")->default(1)->required()->setWidth(0, 4);
            $form->decimal('fifth_2', "五球2")->default(1)->required()->setWidth(0, 4);
            $form->decimal('fifth_3', "五球3")->default(1)->required()->setWidth(0, 4);
            $form->decimal('fifth_4', "五球4")->default(1)->required()->setWidth(0, 4);
            $form->decimal('fifth_5', "五球5")->default(1)->required()->setWidth(0, 4);
            $form->decimal('fifth_6', "五球6")->default(1)->required()->setWidth(0, 4);
            $form->decimal('fifth_6', "五球6")->default(1)->required()->setWidth(0, 4);
            $form->decimal('fifth_8', "五球8")->default(1)->required()->setWidth(0, 4);
            $form->decimal('fifth_9', "五球9")->default(1)->required()->setWidth(0, 4);

        });

        $form->footer(function ($footer) {

            // 去掉`查看`checkbox
            $footer->disableViewCheck();

//            // 去掉`继续编辑`checkbox
//            $footer->disableEditingCheck();
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

        }


        return $form;
    }
}
