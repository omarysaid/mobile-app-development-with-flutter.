<?php

// use App\Http\Controllers\APIV1\YourController;

use App\Http\Controllers\packing_bill;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;


/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/


Route::group(['prefix' => 'parking_bill'], function () {
    Route::post('create', [packing_bill::class, 'create_packing_bill']);
    Route::get('show', [packing_bill::class, 'show']);
});


Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
