<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\Admin\HomeController as AdminHomeController;
use App\Http\Controllers\Admin\QuestController as AdminQuestController;
use App\Http\Controllers\Admin\BookingController;
use App\Http\Controllers\Admin\TimeController;
use App\Http\Controllers\QuestController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', [HomeController::class, 'index'])->name('home');

Auth::routes();

Route::middleware(['role:admin'])->prefix('admin')->group(function () {

    Route::get('/', [AdminHomeController::class, 'index'])->name('indexAdmin');

    Route::resource('quest', AdminQuestController::class);

    Route::resource('booking', BookingController::class);

    Route::resource('time', TimeController::class);
});

Route::get('/v1/json-times/{id}', [\App\Http\Controllers\TimeController::class, 'getJsonTimes']);

Route::post('/v1/create-booking', [\App\Http\Controllers\BookingController::class, 'store']);

// в ТЗ не задано требование по наличию slug, так что самый простой вариант
Route::get('/{id}', [\App\Http\Controllers\QuestController::class, 'index'])->whereNumber('id')->name('quest');



