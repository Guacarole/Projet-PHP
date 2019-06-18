<?php

namespace App\Http\Controllers;

use App\Http\Resources\PostResource;
use App\Post;
use App\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;

class PostController extends Controller
{

    //Retourne tous les posts de l'utilisateur
    public function list()
    {
        //$id = Auth::id();
//        $posts = Post::orderBy('created_at', 'desc')->get();

        $search = request('search');
        $id = Auth::id();
        $posts = Post::whereIn('user_id', function($query) use($id)
        {
            $query->select('friend_id')
                ->from('friends')
                ->where('user_id', $id)->latest();
        })->orWhere('user_id', $id)->latest()->get();


        return view('home', compact('posts'));

    }

    public function listProfile()
    {
        //$id = Auth::id();
//        $posts = Post::orderBy('created_at', 'desc')->get();

        $search = request('search');
        $id = Auth::id();



        $posts = Post::whereIn('user_id', function($query) use($id)
        {
            $query->select('id')
                ->from('users')
                ->where('user_id', $id)->latest();
        })->orWhere('user_id', $id)->latest()->get();

        var_dump($posts);
        die();

        return view('profile')->withPosts($posts);

    }

    //Creer un nouveau post
    public function create()
    {

        $this->validate(\request(),[
            'content' => 'required',
            'image' => 'image',
        ]);

        $attachment = null;

        if (\request()->hasFile('image')){

            $path = request()->file('image')->store('post', 'public');

            $attachment = [
                'path' => $path,
                'type' => 'image',
            ];
        }

        $post = new Post([
            'content'=> \request('content'),
            'attachment' => $attachment

        ]);

        auth()->user()->posts()->save($post);

        $post->load('user');

        return new PostResource($post);
    }

    /**
     * return posts of users who we follow
     *
     * @return \Illuminate\Http\Resources\Json\AnonymousResourceCollection
     *
     */
    public function feed()
    {
        $user = Auth::user();

        $feed = Post::with('user')
            ->whereHas('user', function($query) use($user){
                $query->whereHas('followers', function($q) use($user){
                    $q->where('user_id', $user->id);
                });
            })
            ->orWhere( 'user_id', $user->id)
            ->orderBy('created_at', 'DESC')
            ->paginate(20);

        return PostResource::collection($feed);
    }
}
