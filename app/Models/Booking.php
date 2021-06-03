<?php

namespace App\Models;

use App\Scope\BookingScope;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Booking
 *
 * @property int    $user_id
 * @property int    $quest_id
 * @property int    $status
 * @property string $date_time
 * @property float  $price
 *
 * @property-read User          $user
 * @property-read Quest         $quest
 *
 * @package App\Models
 */
class Booking extends Model
{
    use HasFactory;

    const STATUS_NEW = 1;
    const STATUS_CONFIRMED = 2;
    const STATUS_CANCELED = 3;
    public static $statusList = [
        self::STATUS_NEW        => 'Новый',
        self::STATUS_CONFIRMED  => 'Подтвержден',
        self::STATUS_CANCELED   => 'Отменен'
    ];

    protected $table = 'bookings';

    protected $fillable = [
        'user_id',
        'quest_id',
        'status',
        'date_time',
        'price'
    ];

    protected static function boot()
    {
        parent::boot();
        static::addGlobalScope(new BookingScope());
    }


    public function user()
    {
        return $this->belongsTo(User::class, 'user_id', 'id');
    }

    public function quest()
    {
        return $this->belongsTo(Quest::class, 'quest_id', 'id');
    }
}
