<?php

use App\Post;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();

Route::group(['middleware' => ['auth']], function(){
    Route::get('/home', 'PostController@list')->name('home');
    Route::get('user/{user}', 'PostController@listProfile')->name('profile');
    Route::get('user/{user}', 'UserController@viewProfile');
});

