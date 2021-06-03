<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Booking;
use Carbon\Carbon;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    public function index()
    {
        //подсчет количества новых бронирований
        $countNewOrders = Booking::where('status', Booking::STATUS_NEW)->get()->count();

        //подсчет предстоящих игр на текущий день (до 23:59)
        $countOrdersToday = Booking::whereBetween('date_time', [Carbon::parse(date('Y-m-d H:i:s'))->timestamp, Carbon::parse(date('Y-m-d 23:59:59'))->timestamp])->get()->count();

        return view('admin.home.index', [
            'countNewOrders' => $countNewOrders,
            'countOrdersToday' => $countOrdersToday
        ]);
    }
}
