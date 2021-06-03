<?php


namespace App\Repositiries;


use App\Models\Booking;
use App\Models\Time;
use Carbon\Carbon;

class TimeRepository
{
    /**
     * Получаем массив дней для вывода в админке
     *
     * @return mixed
     */
    public static function getActiveDaysByTime(Time $time)
    {
        $days = Time::where('time', $time->time)->where('price', $time->price)->get()
            ->map(function (Time $t) {
                return $t->day;
            })
            ->toArray();

        return $days;
    }

    /**
     * Возвращаем массив расписания
     *
     * @param $questId
     * @return array
     */
    public function getTimes($questId)
    {
        $dateNow = Carbon::now();
        $times =[];
        for ($i=0; $i < 14; $i++)
        {
            $date = $dateNow;

            $times[] = Time::where('quest_id', $questId)
                ->where('day', $date->format('N'))
                ->get()
                ->map(function (Time $t) use ($date, $questId) {
                    return [
                        'date' => $date->format('Y-m-d'),
                        'time' => substr($t->time, 0,-3),
                        'price' => $t->price,
                        'is_free' => $this->checkTime($questId, $date->format('Y-m-d'), $t->time)
                    ];
                })
                ->toArray();
            $date->addDay();
        }

        return $times;

    }

    /**
     * Проверка на наличее броней и если время прошло
     *
     * @param $questId
     * @param $date
     * @param $time
     * @return bool
     */
    public function checkTime($questId, $date, $time)
    {
        $data = Carbon::parse($date . 'T' . $time)->timestamp;
        $booking = Booking::where('date_time', $data)
            ->where('quest_id', $questId)
            ->first();

        $isTimeOwer = Carbon::now()->timestamp > $data;

        if (empty($booking) && ! $isTimeOwer)
        {
            return true;
        }
        return false;
    }
}