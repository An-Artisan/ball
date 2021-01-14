<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UserBet extends Model
{
    use HasFactory;

    protected $table = 'user_bet';
    protected $primaryKey = 'id';
    protected $dateFormat = 'U';


}
