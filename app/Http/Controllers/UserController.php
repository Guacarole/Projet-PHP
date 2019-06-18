<?php

namespace App\Http\Controllers;
use App\User;
use Illuminate\Http\Request;

class UserController extends Controller
{
    public function viewProfile(User $user)
    {
        return view('user.profile', [
            'user'=>$user,
        ]);
    }

    public function addFriend(User $user)
    {
        $friend = auth()->user()->addFriend($user);

        if($friend === null)
            return response()->json(['message' => 'Already a friend'], 500);

        return response()->json($friend);
    }

    public function removeFriend(User $user)
    {
        $friend = $user->isFriend();

        if($friend === null){
            return response()->json(['message' => 'You are not friends'], 500);
        }
        $friend->delete();

        return response()->json(['message' => 'Successfully removed friend']);
    }

}
