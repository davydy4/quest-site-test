<?php

namespace App\Http\Controllers;

use App\Models\Booking;
use App\Models\User;
use App\Repositiries\BookingRepository;
use Illuminate\Http\Request;

class BookingController extends Controller
{
    public function store(Request $request)
    {
        $post = $request->post('params');
        $bookingRepo = new BookingRepository();
        if (! $bookingRepo->validateBooking($post))
        {
            return false;
        }

        if (! $bookingRepo->validateTime($post))
        {
            return false;
        }

        $user = User::query()->where('email', $post['email'])->first();
        if (empty($user)) {
            $user = User::query()->create($post);
        }

        $dateTime = $bookingRepo->getDateTime($post);

        $booking = Booking::query()->create(array_merge($post, ['user_id' => $user->id, 'date_time' => $dateTime]));

        if (!empty($booking))
        {
            return true;
        }


        return false;
    }
}
