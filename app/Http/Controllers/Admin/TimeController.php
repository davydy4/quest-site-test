<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Quest;
use App\Models\Time;
use Illuminate\Http\Request;

class TimeController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $quests = Quest::orderBy('name', 'DESC')->get();

        return view('admin.time.index', [
            'quests' => $quests
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $quests = Quest::orderBy('name', 'DESC')->get();

        return view('admin.time.create', [
            'quests' => $quests
        ]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {

        if ($request->count > 0)
        {
            for($i=1; $i<= $request->count; $i++)
            {

                if(! empty($request->days[$i]))
                {
                    foreach ($request->days[$i] as $key => $day)
                    {
                        $time = new Time();
                        $time->day = $key;
                        $time->time = $request->hours[$i] . ':' . $request->minutes[$i];
                        $time->quest_id = $request->quest_id;
                        $time->price = $request->price[$i];
                        $time->save();
                    }
                }
            }
        }
        return redirect()->route('time.index')->withSuccess('Расписание успешно добавлено!');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Time  $time
     * @return \Illuminate\Http\Response
     */
    public function show(Time $time)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {

        $times = Time::where(['quest_id' => $id])->groupBy(['time', 'price'])->get();

        $quest = Quest::find($id);
        return view('admin.time.edit', [
            'quest' => $quest,
            'times' => $times
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        if ($request->count > 0)
        {
            $times = Time::where(['quest_id' => $id])->each(function (Time $time) {
                $time->delete();
            });

            for($i=1; $i<= $request->count; $i++)
            {

                if(! empty($request->days[$i]))
                {
                    foreach ($request->days[$i] as $key => $day)
                    {
                        $time = new Time();
                        $time->day = $key;
                        $time->time = $request->hours[$i] . ':' . $request->minutes[$i];
                        $time->quest_id = $id;
                        $time->price = $request->price[$i];
                        $time->save();
                    }
                }
            }
        }

        return redirect()->back()->withSuccess('Расписание успешно сохранено!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Time  $time
     * @return \Illuminate\Http\Response
     */
    public function destroy(Time $time)
    {
        //
    }
}
