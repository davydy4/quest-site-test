@extends('layouts.admin_layout')

@section('title', 'Редактировать расписание')

@section('content')
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0">Редактировать расписание квета {{ $quest->name }}</h1>
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
            <!-- Small boxes (Stat box) -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="card card-primary">
                        <!-- form start -->
                        <form action="{{ route('time.update', $quest['id']) }}" method="POST">
                            @csrf
                            @method('PUT')
                            <div class="card-body">
                                <div class="form-group">
                                    @foreach($times as $key => $time)
                                        <?php $i = $key+1 ;
                                        $timeQuest = explode(':', $time->time);
                                        $timeDays = \App\Repositiries\TimeRepository::getActiveDaysByTime($time);
                                        ?>

                                        <div class="row mb-3">
                                            <div class="col-lg-3">
                                                <div class="row">
                                                    <div class="col-lg-6">
                                                        <label>Часы</label>
                                                        <input type="number" name="hours[{{ $i }}]" max="24" class="form-control" value="{{ $timeQuest[0] }}">
                                                    </div>
                                                    <div class="col-lg-6">
                                                        <label>Минуты</label>
                                                        <input type="number" name="minutes[{{ $i }}]" max="60" class="form-control" value="{{ $timeQuest[1] }}">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-3">
                                                <label>Цена</label>
                                                <input type="text" name="price[{{ $i }}]" class="form-control" value="{{ $time['price']}}">
                                            </div>
                                            <div class="col-lg-6">
                                                <label>Дни недели</label>
                                                <div class="row">
                                                    @foreach(\App\Models\Time::DAYS as $key => $day)
                                                        <div class="col-lg">
                                                            <div class="form-check">
                                                                <input class="form-check-input" name="days[{{ $i }}][{{ $key }}]" type="checkbox" {{ in_array($key, $timeDays) ? 'checked' : '' }}>
                                                                <label class="form-check-label" >{{ $day }}</label>
                                                            </div>
                                                        </div>
                                                    @endforeach
                                                </div>

                                            </div>
                                        </div>
                                    @endforeach
                                </div>
                                <div class="form-group js-elements-data-add-block-clone" style="display:none;">
                                    <div class="row mb-3">
                                        <div class="col-lg-3">
                                            <div class="row">
                                                <div class="col-lg-6">
                                                    <label>Часы</label>
                                                    <input type="number" name="hours[keyClone]" max="24" class="form-control">
                                                </div>
                                                <div class="col-lg-6">
                                                    <label>Минуты</label>
                                                    <input type="number" name="minutes[keyClone]" max="60" class="form-control">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-3">
                                            <label>Цена</label>
                                            <input type="text" name="price[keyClone]" class="form-control">
                                        </div>
                                        <div class="col-lg-6">
                                            <label>Дни недели</label>
                                            <div class="row">
                                            @foreach(\App\Models\Time::DAYS as $key => $day)
                                              <div class="col-lg">
                                                <div class="form-check">
                                                    <input class="form-check-input" name="days[keyClone][{{ $key }}]" type="checkbox">
                                                    <label class="form-check-label" >{{ $day }}</label>
                                                </div>
                                              </div>
                                            @endforeach
                                            </div>

                                        </div>
                                    </div>
                                </div>
                                <div class="js-elements-data-add-block"></div>
                                <div class="form-group">
                                    <input type="hidden" class="js-element-data-count" name="count" value="{{ $times->count() }}">
                                    <button type="button" class="btn btn-success js-element-data-add">+</button>
                                </div>
                            </div>
                            <!-- /.card-body -->

                            <div class="card-footer">
                                <button type="submit" class="btn btn-primary">Добавить</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!-- /.row -->

        </div><!-- /.container-fluid -->
    </section>

    <!-- /.content -->
@endsection