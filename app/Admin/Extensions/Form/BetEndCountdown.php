<?php

namespace App\Admin\Extensions\Form;

use Encore\Admin\Form\Field;

class BetEndCountdown extends Field
{
    public static $js = [
    ];

    protected $view = 'admin.bed_end_countdown';

    public function render()
    {

        return parent::render();
    }
}
