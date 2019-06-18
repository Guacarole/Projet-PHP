<?php

use Illuminate\Http\Request;
use App\Post;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::group(['middleware' => 'auth:api'], function(){

    Route::get('feed', 'PostController@feed');


    Route::group(['prefix'=>'post'], function(){
        Route::get('', 'PostController@list');
        Route::post('', 'PostController@create');
    });

    Route::group(['prefix'=>'user'], function(){
        Route::post('{user}/add_friend', 'UserController@addFriend');
        Route::post('{user}/remove_friend', 'UserController@removeFriend');
    });

});
