<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Booking;
use App\Scope\BookingScope;
use Carbon\Carbon;
use Illuminate\Http\Request;

class BookingController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $query = Booking::withoutGlobalScope(BookingScope::class);

        // ToDo сделать фильтр через BookingFilter
        // фильтр новых бронирований
        if ($request->get('new')){
            $query->where(['status' => Booking::STATUS_NEW]);
        }

        // фильтр бронирований на текущие сутки
        if ($request->get('today')){
            $query->whereBetween('date_time', [Carbon::parse(date('Y-m-d H:i:s'))->timestamp, Carbon::parse(date('Y-m-d 23:59:59'))->timestamp]);
        }

        $bookings = $query
            ->orderBy('date_time', 'ASC')
            ->get();

        return view('admin.booking.index', [
            'bookings' => $bookings
        ]);
    }



    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Booking  $booking
     * @return \Illuminate\Http\Response
     */
    public function show(Booking $booking)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Booking  $booking
     * @return \Illuminate\Http\Response
     */
    public function edit(Booking $booking)
    {
        return view('admin.booking.edit', [
            'booking' => $booking,
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Booking  $booking
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Booking $booking)
    {
        $booking->status = $request->status;
        $booking->save();

        return redirect()->route('booking.index')->withSuccess('Статус успешно изменен!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Booking  $booking
     * @return \Illuminate\Http\Response
     */
    public function destroy(Booking $booking)
    {
        $booking->delete();
        return redirect()->route('booking.index')->withSuccess('Запись удалена!');
    }
}
