@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-body text-center">
                    <h1>
                        {{$user->name}}
                    </h1>
                    <small>{{$user->email}}</small>
                    <hr>

                    <user-friend-toggle :user-id="{{$user->id}}"
                                        :is-friend="{{$user->isFriend() === null ? 'false' : 'true'}}"></user-friend-toggle>
                </div>
            </div>
            <list-all-posts :user-id="{{$user->id}}"></list-all-posts>
            {{--Afficher ses propres posts--}}
            {{--@foreach($posts as $post)--}}
                {{--<div class="card">--}}
                    {{--<div class="card-body text-center">--}}
                        {{--<h3>{{$post->user->name}}</h3>--}}
                        {{--<p>{{$post->created_at}}</p>--}}
                        {{--<div class="card-body">--}}
                            {{--<h5>{{$post->content}}</h5>--}}
                        {{--</div>--}}
                    {{--</div>--}}
                {{--</div>--}}
            {{--@endforeach--}}
        </div>
    </div>
</div>
@endsection
