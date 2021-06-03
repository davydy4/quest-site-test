<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Quest;
use Illuminate\Http\Request;

class QuestController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $quests = Quest::orderBy('created_at', 'DESC')->get();

        return view('admin.quest.index', [
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
        return view('admin.quest.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        if (empty($request->name))
        {
            return redirect()->back()->withErrors('Ошибка! Не указано название!');
        }
        $quest = new Quest();
        $quest->name = $request->name;
        $quest->image = '/' . $request->image;
        $quest->save();

        return redirect()->back()->withSuccess('Квест успешно добавлен!');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Quest  $quest
     * @return \Illuminate\Http\Response
     */
    public function show(Quest $quest)
    {
       //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Quest  $quest
     * @return \Illuminate\Http\Response
     */
    public function edit(Quest $quest)
    {
        return view('admin.quest.edit', [
            'quest' => $quest,
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Quest  $quest
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Quest $quest)
    {
        if (empty($request->name))
        {
            return redirect()->back()->withErrors('Ошибка! Не указано название!');
        }

        $quest->name = $request->name;
        $quest->image = '/' . $request->image;
        $quest->save();

        return redirect()->back()->withSuccess('Квест успешно добавлен!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Quest  $quest
     * @return \Illuminate\Http\Response
     */
    public function destroy(Quest $quest)
    {
        $quest->delete();
        return redirect()->back()->withSuccess('Квест успешно удален!');
    }
}
