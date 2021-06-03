<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Quest
 *
 * @property int        $id
 * @property string     $name
 * @property string     $image ссылка на изображение, только для тестового задания.
 *
 * @property-read Time  $times
 * @package App\Models
 */
class Quest extends Model
{
    use HasFactory;

    protected $table = 'quests';

    protected $fillable = [
        'name',
        'image'
    ];

    public function times()
    {
        return $this->hasMany(Time::class, 'quest_id', 'id');
    }

}
