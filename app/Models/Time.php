<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Time
 *
 * @property int    $quest_id
 * @property int    $day
 * @property string $time
 * @property float  $price
 *
 * @package App\Models
 */
class Time extends Model
{
    use HasFactory;

    const DAYS = array( 1 => 'Пн' , 'Вт' , 'Ср' , 'Чт' , 'Пт' , 'Сб' , 'Вс' );

    protected $table = 'times';

    protected $fillable = [
        'quest_id',
        'day',
        'time',
        'price'
    ];


}
