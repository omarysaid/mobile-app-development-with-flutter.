<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\bill;

class web_bill_controller extends Controller
{
    public function show_web_bill(){
        $mybil = bill::paginate(3);


        return view('admin/parking_bill', [
            'parking_bill'=>$mybil,
        ]);

    //
}

public function delete_bill($id){
    bill::where('id', $id)->delete();
    return redirect('show_bill')->with('bill_delete_success', 'bill deleted succefull');
}
}
