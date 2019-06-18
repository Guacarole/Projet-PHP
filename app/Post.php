<?php

namespace App;
use Illuminate\Database\Eloquent\Model;

class Post extends Model
{
    protected $guarded = ['id'];
    protected $casts = ['attachment' => 'array'];

    public function user()
    {
        return $this->belongsTo(User::class);
    }


}
