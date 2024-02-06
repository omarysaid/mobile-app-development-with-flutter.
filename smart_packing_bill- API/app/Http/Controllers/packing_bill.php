<?php

namespace App\Http\Controllers;
use illuminate\support\facade\Auth;
use Illuminate\Support\Facades\Storage;
use App\Traits\FileTrait;

use Illuminate\Http\Request;
use App\Models\bill;

class packing_bill extends Controller
{
    use FileTrait;
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create_packing_bill(REQUEST $request)
    {
       // dd($request['location']);

        //request
// return response()->json([$request->description]);
        //Validate the data from request
        $packing = $request->validate([
            'plate_number' => 'string',
            'location' => 'string',
            'car_image' => 'string'
        ]);

        //Get the file string from request
        $image_string = $request->input('car_image');
        //Decoding the image string and storing it to the storage
        $car_image_url = $this->storeBase64File($image_string, 'posts/car_image');

        //Modifying post attributes
        //$post['user_id'] = Auth::user()->id;
        $bill = new Bill([
            'plate_number' => $request->input('plate_number'),
            'location' => $request->input('location'),
            'car_image' => $car_image_url,
        ]);

      $done =  $bill->save();

if ($done) {
    return response()->json(['message' => 'bill Created Successfully'],201);
}
return response()->json(['message' => 'something went wrong'], 401);

    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show()
    {
        $packing_bills= bill::all();

        // return response()->json([
        //     'image'=>$packing_bills['car_image'],
        //     'location'=>$packing_bills['location'],
        //     'plate_mumber'=>$packing_bills['plate_number']
        // ]);
        //
        return response()->json(['response'=>$packing_bills]);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
