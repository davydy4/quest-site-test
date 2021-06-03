<?php


namespace App\Repositiries;


use App\Models\Booking;
use Carbon\Carbon;

class BookingRepository
{
    /**
     * Проверка наличия входных параметров
     *
     * @param $params
     * @return bool
     */
    public function validateBooking($params)
    {
        if (empty($params['name']) || empty($params['phone']) || empty($params['email']))
        {
            return false;
        }

        if (empty($params['date']) || empty($params['time']) || empty($params['price']))
        {
            return false;
        }

        return true;
    }

    /**
     * Получение даты игры в timestamp
     *
     * @param $post
     * @return float|int|string
     */
    public function getDateTime($post)
    {
        $date = $post['date'];
        $time = $post['time'];

        return Carbon::parse($date . ' ' . $time)->timestamp;
    }

    /**
     * Проверка на свободность времени
     *
     * @param $params
     * @return bool
     */
    public function validateTime($params)
    {
        $booking = Booking::query()->where('date_time', $this->getDateTime($params))->where('quest_id', $params['quest_id'])->first();

        if (!empty($booking))
        {
            return false;
        }

        return true;

    }
}