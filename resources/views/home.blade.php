@extends('layouts.app')

@section('content')
<div class="container">

    {{--{{$posts->content}}--}}
    <div class="row justify-content-center">
        <div class="col-md-8">
            <create-new-post></create-new-post>
            <feed></feed>
        </div>
    </div>

    @foreach($posts as $post)
        <div class="card">
            <div class="card-body text-center">
                <h3>{{$post->user->name}}</h3>
                <p>{{$post->created_at}}</p>
                <div class="card-body">
                    <h5>{{$post->content}}</h5>
                </div>
            </div>
        </div>
    @endforeach

</div>
@endsection
