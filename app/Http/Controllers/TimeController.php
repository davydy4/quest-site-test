<?php

namespace App\Http\Controllers;

use App\Models\Time;
use App\Repositiries\TimeRepository;
use Carbon\Carbon;
use Illuminate\Http\Request;

class TimeController extends Controller
{
    protected $timeRepo;

    public function __construct()
    {
        $this->timeRepo = new TimeRepository();
    }

    public function getJsonTimes($id)
    {
        return $this->timeRepo->getTimes($id);
    }
}
