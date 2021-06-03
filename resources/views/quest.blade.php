@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center mb-4">
        <h1 class="mb-4">Квест {{ $quest->name }}</h1>
    </div>
    <div class="row justify-content-center mb-3">
        <div class="col-lg-10">
            <div class="image">
                <img class="img-fluid" src="{{ $quest->image }}" alt="{{ $quest->name }}">
            </div>
        </div>
    </div>
    <div class="row justify-content-center mt-6 mb-4">
        <v-time :quest-id="{{ $quest->id }}"></v-time>
    </div>

</div>
@endsection
