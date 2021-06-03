@extends('layouts.admin_layout')

@section('title', 'Все бронирования')

@section('content')
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0">Все брони</h1>
                </div><!-- /.col -->
            </div><!-- /.row -->
            @if (session('success'))
                <div class="alert alert-success" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                    <h4><i class="icon fa fa-check"></i>{{ session('success') }}</h4>
                </div>
            @endif
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
        <div class="container-fluid">
            <div class="card">
                <div class="card-body p-0">
                    <table class="table table-striped projects">
                        <thead>
                        <tr>
                            <th style="width: 5%">
                                Дата игры
                            </th>
                            <th>
                                Стоимость
                            </th>
                            <th>
                                Название квеста
                            </th>
                            <th>
                                Статус
                            </th>
                            <th>
                                Имя
                            </th>
                            <th>
                                Телефон
                            </th>
                            <th style="width: 30%">
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach ($bookings as $booking)
                            <tr>
                                <td>
                                    {{ Carbon\Carbon::parse($booking['date_time'])->setTimezone('Europe/Moscow')->format('d/m/y H:i') }}
                                </td>
                                <td>
                                    {{ $booking->price }}
                                </td>
                                <td>
                                    {{ $booking->quest->name }}
                                </td>
                                <td>
                                    {{ \App\Models\Booking::$statusList[$booking->status] }}
                                </td>
                                <td>
                                    {{ $booking->user->name }}
                                </td>
                                <td>
                                    {{ $booking->user->phone  }}
                                </td>

                                <td class="project-actions text-right">
                                    <a class="btn btn-info btn-sm" href="{{ route('booking.edit', $booking['id']) }}">
                                        <i class="fas fa-pencil-alt">
                                        </i>
                                        Редактировать
                                    </a>
                                    <form action="{{ route('booking.destroy', $booking['id']) }}" method="POST"
                                          style="display: inline-block">
                                        @csrf
                                        @method('DELETE')
                                        <button type="submit" class="btn btn-danger btn-sm delete-btn">
                                            <i class="fas fa-trash">
                                            </i>
                                            Удалить
                                        </button>
                                    </form>
                                </td>
                            </tr>
                        @endforeach


                        </tbody>
                    </table>
                </div>
                <!-- /.card-body -->
            </div>
        </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
@endsection