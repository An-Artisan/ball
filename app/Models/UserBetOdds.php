<?php

namespace App\Models;

use DateTimeInterface;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

/**
 * @method static findOrFail(mixed $id)
 */
class UserBetOdds extends Model
{
    use HasFactory;
    protected $table = 'user_bet_odds';
    protected $primaryKey = 'id';

    public function __construct(array $attributes = [])
    {
        parent::__construct($attributes);
        $this->timestamps = true;
    }

    protected function serializeDate(DateTimeInterface $date)
    {
        return $date->format('Y-m-d H:i:s');
    }


}
