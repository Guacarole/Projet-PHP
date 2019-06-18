<?php

namespace App;
use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Laravel\Passport\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function posts()
    {
        return $this->hasMany(Post::class);
    }

    public function friends() {

        return $this->hasMany(Friend::class);
    }

    public function followers() {

        return $this->hasMany(Friend::class, 'friend_id');
    }

    public function addFriend(User $user)
    {
        if($this->friends()->where('friend_id', $user->id)->first()){
            return null;
        }

        return $this->friends()->save(
           new Friend([
                'friend_id' => $user->id,
           ])
        );
    }

    public function isFriend()
    {
        return Friend::where('user_id', auth()->id())->where('friend_id', $this->id)->first();
    }
}
