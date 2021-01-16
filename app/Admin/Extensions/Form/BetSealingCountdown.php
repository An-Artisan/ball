<?php

namespace App\Admin\Extensions\Form;

use Encore\Admin\Form\Field;

class BetSealingCountdown extends Field
{
    public static $js = [
    ];

    protected $view = 'admin.bed_sealing_countdown';

    public function render()
    {

        return parent::render();
    }
}
