<?php

use App\Http\Controllers\web_bill_controller;
use Illuminate\Support\Facades\Route;


/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

// Route::get('admin_home', function(){
// return view('admin/parking_bill');
// });

Route::get('show_bill', [web_bill_controller::class, 'show_web_bill']);
Route::get('deleteItem/{id}', [web_bill_controller::class, 'delete_bill']);


