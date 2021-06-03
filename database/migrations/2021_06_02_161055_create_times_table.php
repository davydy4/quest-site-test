<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTimesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('times', function (Blueprint $table) {
            $table->id();
            $table->foreignId('quest_id')->constrained()->onDelete('cascade');;
            $table->smallInteger('day');
            $table->time('time');
            $table->float('price')->nullable();
            $table->timestamps();
        });

        // Для целей тестового задания создаю несколько записей
        \App\Models\Time::create([
            'quest_id'  => 1,
            'day'       => 1,
            'time'      => '11:00',
            'price'     => '3000'
        ]);
        \App\Models\Time::create([
            'quest_id'  => 1,
            'day'       => 1,
            'time'      => '13:30',
            'price'     => '3000'
        ]);
        \App\Models\Time::create([
            'quest_id'  => 1,
            'day'       => 1,
            'time'      => '15:00',
            'price'     => '3000'
        ]);
        \App\Models\Time::create([
            'quest_id'  => 1,
            'day'       => 1,
            'time'      => '17:00',
            'price'     => '3000'
        ]);
        \App\Models\Time::create([
            'quest_id'  => 1,
            'day'       => 1,
            'time'      => '19:00',
            'price'     => '3000'
        ]);
        \App\Models\Time::create([
            'quest_id'  => 1,
            'day'       => 2,
            'time'      => '11:00',
            'price'     => '3000'
        ]);
        \App\Models\Time::create([
            'quest_id'  => 1,
            'day'       => 2,
            'time'      => '13:30',
            'price'     => '3000'
        ]);
        \App\Models\Time::create([
            'quest_id'  => 1,
            'day'       => 2,
            'time'      => '15:00',
            'price'     => '3000'
        ]);
        \App\Models\Time::create([
            'quest_id'  => 1,
            'day'       => 2,
            'time'      => '17:00',
            'price'     => '3000'
        ]);
        \App\Models\Time::create([
            'quest_id'  => 1,
            'day'       => 2,
            'time'      => '19:00',
            'price'     => '3000'
        ]);
        \App\Models\Time::create([
            'quest_id'  => 1,
            'day'       => 3,
            'time'      => '11:00',
            'price'     => '3000'
        ]);
        \App\Models\Time::create([
            'quest_id'  => 1,
            'day'       => 3,
            'time'      => '13:30',
            'price'     => '3000'
        ]);
        \App\Models\Time::create([
            'quest_id'  => 1,
            'day'       => 3,
            'time'      => '15:00',
            'price'     => '3000'
        ]);
        \App\Models\Time::create([
            'quest_id'  => 1,
            'day'       => 3,
            'time'      => '17:00',
            'price'     => '3000'
        ]);
        \App\Models\Time::create([
            'quest_id'  => 1,
            'day'       => 3,
            'time'      => '19:00',
            'price'     => '3000'
        ]);
    
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('times');
    }
}
