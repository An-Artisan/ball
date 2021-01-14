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

        $grid->column('id', __('Id'));
        $grid->column('phase_number', __('Phase number'));
        $grid->column('order_number', __('Order number'));
        $grid->column('sum_max', __('Sum max'));
        $grid->column('sum_min', __('Sum min'));
        $grid->column('sum_odd', __('Sum odd'));
        $grid->column('sum_even', __('Sum even'));
        $grid->column('dragon', __('Dragon'));
        $grid->column('tiger', __('Tiger'));
        $grid->column('draw', __('Draw'));
        $grid->column('first_max', __('First max'));
        $grid->column('first_min', __('First min'));
        $grid->column('first_odd', __('First odd'));
        $grid->column('first_even', __('First even'));
        $grid->column('first_0', __('First 0'));
        $grid->column('first_1', __('First 1'));
        $grid->column('first_2', __('First 2'));
        $grid->column('first_3', __('First 3'));
        $grid->column('first_4', __('First 4'));
        $grid->column('first_5', __('First 5'));
        $grid->column('first_6', __('First 6'));
        $grid->column('first_7', __('First 7'));
        $grid->column('first_8', __('First 8'));
        $grid->column('first_9', __('First 9'));
        $grid->column('second_max', __('Second max'));
        $grid->column('second_min', __('Second min'));
        $grid->column('second_odd', __('Second odd'));
        $grid->column('second_even', __('Second even'));
        $grid->column('second_0', __('Second 0'));
        $grid->column('second_1', __('Second 1'));
        $grid->column('second_2', __('Second 2'));
        $grid->column('second_3', __('Second 3'));
        $grid->column('second_4', __('Second 4'));
        $grid->column('second_5', __('Second 5'));
        $grid->column('second_6', __('Second 6'));
        $grid->column('second_7', __('Second 7'));
        $grid->column('second_8', __('Second 8'));
        $grid->column('second_9', __('Second 9'));
        $grid->column('third_max', __('Third max'));
        $grid->column('third_min', __('Third min'));
        $grid->column('third_odd', __('Third odd'));
        $grid->column('third_even', __('Third even'));
        $grid->column('third_0', __('Third 0'));
        $grid->column('third_1', __('Third 1'));
        $grid->column('third_2', __('Third 2'));
        $grid->column('third_3', __('Third 3'));
        $grid->column('third_4', __('Third 4'));
        $grid->column('third_5', __('Third 5'));
        $grid->column('third_6', __('Third 6'));
        $grid->column('third_7', __('Third 7'));
        $grid->column('third_8', __('Third 8'));
        $grid->column('third_9', __('Third 9'));
        $grid->column('fourth_max', __('Fourth max'));
        $grid->column('fourth_min', __('Fourth min'));
        $grid->column('fourth_odd', __('Fourth odd'));
        $grid->column('fourth_even', __('Fourth even'));
        $grid->column('fourth_0', __('Fourth 0'));
        $grid->column('fourth_1', __('Fourth 1'));
        $grid->column('fourth_2', __('Fourth 2'));
        $grid->column('fourth_3', __('Fourth 3'));
        $grid->column('fourth_4', __('Fourth 4'));
        $grid->column('fourth_5', __('Fourth 5'));
        $grid->column('fourth_6', __('Fourth 6'));
        $grid->column('fourth_7', __('Fourth 7'));
        $grid->column('fourth_8', __('Fourth 8'));
        $grid->column('fourth_9', __('Fourth 9'));
        $grid->column('fifth_max', __('Fifth max'));
        $grid->column('fifth_min', __('Fifth min'));
        $grid->column('fifth_odd', __('Fifth odd'));
        $grid->column('fifth_even', __('Fifth even'));
        $grid->column('fifth_0', __('Fifth 0'));
        $grid->column('fifth_1', __('Fifth 1'));
        $grid->column('fifth_2', __('Fifth 2'));
        $grid->column('fifth_3', __('Fifth 3'));
        $grid->column('fifth_4', __('Fifth 4'));
        $grid->column('fifth_5', __('Fifth 5'));
        $grid->column('fifth_6', __('Fifth 6'));
        $grid->column('fifth_7', __('Fifth 7'));
        $grid->column('fifth_8', __('Fifth 8'));
        $grid->column('fifth_9', __('Fifth 9'));
        $grid->column('before_three_leopard', __('Before three leopard'));
        $grid->column('before_three_straight', __('Before three straight'));
        $grid->column('before_three_two_pairs', __('Before three two pairs'));
        $grid->column('before_three_half_straight', __('Before three half straight'));
        $grid->column('before_three_discrete', __('Before three discrete'));
        $grid->column('middle_three_leopard', __('Middle three leopard'));
        $grid->column('middle_three_straight', __('Middle three straight'));
        $grid->column('middle_three_two_pairs', __('Middle three two pairs'));
        $grid->column('middle_three_half_straight', __('Middle three half straight'));
        $grid->column('middle_three_discrete', __('Middle three discrete'));
        $grid->column('after_three_leopard', __('After three leopard'));
        $grid->column('after_three_straight', __('After three straight'));
        $grid->column('after_three_two_pairs', __('After three two pairs'));
        $grid->column('after_three_half_straight', __('After three half straight'));
        $grid->column('after_three_discrete', __('After three discrete'));
        $grid->column('created_at', __('Created at'));
        $grid->column('updated_at', __('Updated at'));

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

        $show->field('id', __('Id'));
        $show->field('phase_number', __('Phase number'));
        $show->field('order_number', __('Order number'));
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
        $form = new Form(new UserBet());

        $form->number('phase_number', __('Phase number'));
        $form->text('order_number', __('Order number'));
        $form->number('sum_max', __('Sum max'));
        $form->number('sum_min', __('Sum min'));
        $form->number('sum_odd', __('Sum odd'));
        $form->number('sum_even', __('Sum even'));
        $form->number('dragon', __('Dragon'));
        $form->number('tiger', __('Tiger'));
        $form->number('draw', __('Draw'));
        $form->number('first_max', __('First max'));
        $form->number('first_min', __('First min'));
        $form->number('first_odd', __('First odd'));
        $form->number('first_even', __('First even'));
        $form->number('first_0', __('First 0'));
        $form->number('first_1', __('First 1'));
        $form->number('first_2', __('First 2'));
        $form->number('first_3', __('First 3'));
        $form->number('first_4', __('First 4'));
        $form->number('first_5', __('First 5'));
        $form->number('first_6', __('First 6'));
        $form->number('first_7', __('First 7'));
        $form->number('first_8', __('First 8'));
        $form->number('first_9', __('First 9'));
        $form->number('second_max', __('Second max'));
        $form->number('second_min', __('Second min'));
        $form->number('second_odd', __('Second odd'));
        $form->number('second_even', __('Second even'));
        $form->number('second_0', __('Second 0'));
        $form->number('second_1', __('Second 1'));
        $form->number('second_2', __('Second 2'));
        $form->number('second_3', __('Second 3'));
        $form->number('second_4', __('Second 4'));
        $form->number('second_5', __('Second 5'));
        $form->number('second_6', __('Second 6'));
        $form->number('second_7', __('Second 7'));
        $form->number('second_8', __('Second 8'));
        $form->number('second_9', __('Second 9'));
        $form->number('third_max', __('Third max'));
        $form->number('third_min', __('Third min'));
        $form->number('third_odd', __('Third odd'));
        $form->number('third_even', __('Third even'));
        $form->number('third_0', __('Third 0'));
        $form->number('third_1', __('Third 1'));
        $form->number('third_2', __('Third 2'));
        $form->number('third_3', __('Third 3'));
        $form->number('third_4', __('Third 4'));
        $form->number('third_5', __('Third 5'));
        $form->number('third_6', __('Third 6'));
        $form->number('third_7', __('Third 7'));
        $form->number('third_8', __('Third 8'));
        $form->number('third_9', __('Third 9'));
        $form->number('fourth_max', __('Fourth max'));
        $form->number('fourth_min', __('Fourth min'));
        $form->number('fourth_odd', __('Fourth odd'));
        $form->number('fourth_even', __('Fourth even'));
        $form->number('fourth_0', __('Fourth 0'));
        $form->number('fourth_1', __('Fourth 1'));
        $form->number('fourth_2', __('Fourth 2'));
        $form->number('fourth_3', __('Fourth 3'));
        $form->number('fourth_4', __('Fourth 4'));
        $form->number('fourth_5', __('Fourth 5'));
        $form->number('fourth_6', __('Fourth 6'));
        $form->number('fourth_7', __('Fourth 7'));
        $form->number('fourth_8', __('Fourth 8'));
        $form->number('fourth_9', __('Fourth 9'));
        $form->number('fifth_max', __('Fifth max'));
        $form->number('fifth_min', __('Fifth min'));
        $form->number('fifth_odd', __('Fifth odd'));
        $form->number('fifth_even', __('Fifth even'));
        $form->number('fifth_0', __('Fifth 0'));
        $form->number('fifth_1', __('Fifth 1'));
        $form->number('fifth_2', __('Fifth 2'));
        $form->number('fifth_3', __('Fifth 3'));
        $form->number('fifth_4', __('Fifth 4'));
        $form->number('fifth_5', __('Fifth 5'));
        $form->number('fifth_6', __('Fifth 6'));
        $form->number('fifth_7', __('Fifth 7'));
        $form->number('fifth_8', __('Fifth 8'));
        $form->number('fifth_9', __('Fifth 9'));
        $form->number('before_three_leopard', __('Before three leopard'));
        $form->number('before_three_straight', __('Before three straight'));
        $form->number('before_three_two_pairs', __('Before three two pairs'));
        $form->number('before_three_half_straight', __('Before three half straight'));
        $form->number('before_three_discrete', __('Before three discrete'));
        $form->number('middle_three_leopard', __('Middle three leopard'));
        $form->number('middle_three_straight', __('Middle three straight'));
        $form->number('middle_three_two_pairs', __('Middle three two pairs'));
        $form->number('middle_three_half_straight', __('Middle three half straight'));
        $form->number('middle_three_discrete', __('Middle three discrete'));
        $form->number('after_three_leopard', __('After three leopard'));
        $form->number('after_three_straight', __('After three straight'));
        $form->number('after_three_two_pairs', __('After three two pairs'));
        $form->number('after_three_half_straight', __('After three half straight'));
        $form->number('after_three_discrete', __('After three discrete'));

        return $form;
    }
}
