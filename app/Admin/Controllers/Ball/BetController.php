<?php

namespace App\Admin\Controllers\Ball;

use App\Models\UserBet;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

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
        $grid = new Grid(new UserBet());

        $grid->column('id', "ID");
        $grid->column('phase_number', "下注期数");
        $grid->column('order_number', "下注编号");
        $grid->column('sum_max', "总和大");
        $grid->column('sum_min', "总和小");
        $grid->column('sum_odd', "总和奇");
        $grid->column('sum_even', "总和偶");
        $grid->column('dragon', "龙");
        $grid->column('tiger', "虎");
        $grid->column('draw', "和");
        $grid->column('first_max', "一球大");
        $grid->column('first_min', "一球小");
        $grid->column('first_odd', "一球单");
        $grid->column('first_even', "一球双");
        $grid->column('first_0', "一球0");
        $grid->column('first_1', "一球1");
        $grid->column('first_2', "一球2");
        $grid->column('first_3', "一球3");
        $grid->column('first_4', "一球4");
        $grid->column('first_5', "一球5");
        $grid->column('first_6', "一球6");
        $grid->column('first_7', "一球7");
        $grid->column('first_8', "一球8");
        $grid->column('first_9', "一球9");

        $grid->column('second_max', "二球大");
        $grid->column('second_min', "二球小");
        $grid->column('second_odd', "二球单");
        $grid->column('second_even', "二球双");
        $grid->column('second_0', "二球0");
        $grid->column('second_1', "二球1");
        $grid->column('second_2', "二球2");
        $grid->column('second_3', "二球3");
        $grid->column('second_4', "二球4");
        $grid->column('second_5', "二球5");
        $grid->column('second_6', "二球6");
        $grid->column('second_7', "二球7");
        $grid->column('second_8', "二球8");
        $grid->column('second_9', "二球9");

        $grid->column('third_max', "三球大");
        $grid->column('third_min', "三球小");
        $grid->column('third_odd', "三球单");
        $grid->column('third_even', "三球双");
        $grid->column('third_0', "三球0");
        $grid->column('third_1', "三球1");
        $grid->column('third_2', "三球2");
        $grid->column('third_3', "三球3");
        $grid->column('third_4', "三球4");
        $grid->column('third_5', "三球5");
        $grid->column('third_6', "三球6");
        $grid->column('third_7', "三球7");
        $grid->column('third_8', "三球8");
        $grid->column('third_9', "三球9");

        $grid->column('fourth_max', "四球大");
        $grid->column('fourth_min', "四球小");
        $grid->column('fourth_odd', "四球单");
        $grid->column('fourth_even', "四球双");
        $grid->column('fourth_0', "四球0");
        $grid->column('fourth_1', "四球1");
        $grid->column('fourth_2', "四球2");
        $grid->column('fourth_3', "四球3");
        $grid->column('fourth_4', "四球4");
        $grid->column('fourth_5', "四球5");
        $grid->column('fourth_6', "四球6");
        $grid->column('fourth_7', "四球7");
        $grid->column('fourth_8', "四球8");
        $grid->column('fourth_9', "四球9");

        $grid->column('fifth_max', "五球大");
        $grid->column('fifth_min', "五球小");
        $grid->column('fifth_odd', "五球单");
        $grid->column('fifth_even', "五球双");
        $grid->column('fifth_0', "五球0");
        $grid->column('fifth_1', "五球1");
        $grid->column('fifth_2', "五球2");
        $grid->column('fifth_3', "五球3");
        $grid->column('fifth_4', "五球4");
        $grid->column('fifth_5', "五球5");
        $grid->column('fifth_6', "五球6");
        $grid->column('fifth_7', "五球7");
        $grid->column('fifth_8', "五球8");
        $grid->column('fifth_9', "五球9");

        $grid->column('before_three_leopard', "前三豹子");
        $grid->column('before_three_straight', "前三顺子");
        $grid->column('before_three_two_pairs', "前三对子");
        $grid->column('before_three_half_straight', "前三半顺");
        $grid->column('before_three_discrete', "前三杂六");

        $grid->column('middle_three_leopard', "中三豹子");
        $grid->column('middle_three_straight', "中三顺子");
        $grid->column('middle_three_two_pairs', "中三对子");
        $grid->column('middle_three_half_straight', "中三半顺");
        $grid->column('middle_three_discrete', "中三杂六");


        $grid->column('after_three_leopard', "后三豹子");
        $grid->column('after_three_straight', "后三顺子");
        $grid->column('after_three_two_pairs', "后三对子");
        $grid->column('after_three_half_straight', "后三半顺");
        $grid->column('after_three_discrete', "后三杂六");

        $grid->column('created_at', "创建时间");
        $grid->column('updated_at', "更新时间");

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

//        $form->number('phase_number', "");
//        $form->text('order_number', __('Order number'));

        $form->fieldset('总和', function (Form $form) {
            $form->number('sum_max', "总和大")->setWidth(5, 2);
            $form->number('sum_min', "总和小")->setWidth(5, 2);
            $form->number('sum_odd', "总和单")->setWidth(5, 2);
            $form->number('sum_even', "总和双")->setWidth(5, 2);
        });

        $form->column(1/3, function ($form) {
            $form->number('sum_max', "总和大")->setWidth(5, 2);
            $form->number('sum_min', "总和小")->setWidth(5, 2);
            $form->number('sum_odd', "总和单")->setWidth(5, 2);
            $form->number('sum_even', "总和双")->setWidth(5, 2);
            $form->number('dragon', "龙")->setWidth(5, 2);
            $form->number('tiger', "虎")->setWidth(5, 2);
            $form->number('draw', "和")->setWidth(5, 2);
        });
        $form->column(1/2, function ($form) {

            $form->number('first_max', "一球大")->setWidth(5, 2);
            $form->number('first_min', "一球小")->setWidth(5, 2);
            $form->number('first_odd', "一球单");
            $form->number('first_even', "一球双");
            $form->number('first_0', "一球0");
            $form->number('first_1', "一球1");
            $form->number('first_2', "一球2");
            $form->number('first_3', "一球3");
            $form->number('first_4', "一球4");
            $form->number('first_5', "一球5");
            $form->number('first_6', "一球6");
            $form->number('first_7', "一球7");
            $form->number('first_8', "一球8");
            $form->number('first_9', "一球9");
        });

        $form->number('second_max', "二球大");
        $form->number('second_min', "二球小");
        $form->number('second_odd', "二球单");
        $form->number('second_even', "二球双");
        $form->number('second_0', "二球0");
        $form->number('second_1', "二球1");
        $form->number('second_2', "二球2");
        $form->number('second_3', "二球3");
        $form->number('second_4', "二球4");
        $form->number('second_5', "二球5");
        $form->number('second_6', "二球6");
        $form->number('second_7', "二球7");
        $form->number('second_8', "二球8");
        $form->number('second_9', "二球9");

        $form->number('third_max', "三球大");
        $form->number('third_min', "三球小");
        $form->number('third_odd', "三球单");
        $form->number('third_even', "三球双");
        $form->number('third_0', "三球0");
        $form->number('third_1', "三球1");
        $form->number('third_2', "三球2");
        $form->number('third_3', "三球3");
        $form->number('third_4', "三球4");
        $form->number('third_5', "三球5");
        $form->number('third_6', "三球6");
        $form->number('third_7', "三球7");
        $form->number('third_8', "三球8");
        $form->number('third_9', "三球9");

        $form->number('fourth_max', "四球大");
        $form->number('fourth_min', "四球小");
        $form->number('fourth_odd', "四球单");
        $form->number('fourth_even', "四球双");
        $form->number('fourth_0', "四球0");
        $form->number('fourth_1', "四球1");
        $form->number('fourth_2', "四球2");
        $form->number('fourth_3', "四球3");
        $form->number('fourth_4', "四球4");
        $form->number('fourth_5', "四球5");
        $form->number('fourth_6', "四球6");
        $form->number('fourth_7', "四球7");
        $form->number('fourth_8', "四球8");
        $form->number('fourth_9', "四球9");

        $form->number('fifth_max', "五球大");
        $form->number('fifth_min', "五球小");
        $form->number('fifth_odd', "五球单");
        $form->number('fifth_even', "五球双");
        $form->number('fifth_0', "五球0");
        $form->number('fifth_1', "五球1");
        $form->number('fifth_2', "五球2");
        $form->number('fifth_3', "五球3");
        $form->number('fifth_4', "五球4");
        $form->number('fifth_5', "五球5");
        $form->number('fifth_6', "五球6");
        $form->number('fifth_7', "五球7");
        $form->number('fifth_8', "五球8");
        $form->number('fifth_9', "五球9");


        $form->number('before_three_leopard', "前三豹子");
        $form->number('before_three_straight', "前三顺子");
        $form->number('before_three_two_pairs', "前三对子");
        $form->number('before_three_half_straight', "前三半顺");
        $form->number('before_three_discrete',"前三杂六");

        $form->number('middle_three_leopard', "中三豹子");
        $form->number('middle_three_straight', "中三顺子");
        $form->number('middle_three_two_pairs', "中三对子");
        $form->number('middle_three_half_straight', "中三半顺");
        $form->number('middle_three_discrete',"中三杂六");

        $form->number('after_three_leopard', "后三豹子");
        $form->number('after_three_straight', "后三顺子");
        $form->number('after_three_two_pairs', "后三对子");
        $form->number('after_three_half_straight', "后三半顺");
        $form->number('after_three_discrete',"后三杂六");

        return $form;
    }
}
