<?php

namespace App\Admin\Actions\Bet;

use Encore\Admin\Actions\RowAction;
use Illuminate\Database\Eloquent\Model;

class PrintBet extends RowAction
{
    public $name = '打印';

    public function href()
    {
//        dd($this->getKey(),$this->getResource());
        $url = env('APP_URL');
        $url .= ("/bet/" . $this->getKey());
        return $url;
    }

}
