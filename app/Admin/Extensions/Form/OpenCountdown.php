<?php

namespace App\Admin\Extensions\Form;

use Encore\Admin\Form\Field;

class OpenCountdown extends Field
{
    public static $js = [
//        '/packages/ckeditor/ckeditor.js',
//        '/packages/ckeditor/adapters/jquery.js',
    ];

    protected $view = 'admin.open_countdown';

    public function render()
    {
        $this->script = <<<EOT
        function showText() {
        time = document.getElementById('end_time').innerHTML;
        document.getElementById('end_time').innerHTML =  time - 1;
        console.log(time);
    }

EOT;
//        $this->script = "$('textarea.{$this->getElementClassString()}').ckeditor();";
        $this->data = ["test"];
        return parent::render();
    }
}
