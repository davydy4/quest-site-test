@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center mb-4">
        <h1 class="mb-4">Квесты</h1>
    </div>
    <div class="row justify-content-center mb-3">
        @foreach($quests as $quest)
            <div class="col-lg-6">
                <a href="{{ route('quest', $quest['id']) }}">
                <h2>{{ $quest->name }}</h2>
                <div class="image">
                    <img class="img-fluid" src="{{ $quest->image }}" alt="{{ $quest->name }}">
                </div>
                </a>
            </div>
        @endforeach
    </div>
</div>
@endsection
