<?php


namespace App\Scope;

use App\Models\Booking;
use Illuminate\Database\Eloquent\{Builder, Model, Scope};

class BookingScope implements Scope
{
    public function apply(Builder $builder, Model $model): void
    {
        $builder->where('status', '!=',Booking::STATUS_CANCELED);
    }
}