<?php

namespace App\Http\Controllers;
use App\Models\detail;

use Illuminate\Http\Request;

class bmi_controller extends Controller
{
    //
    public function my_bmi(){
        return ['output'=>'running from bmi controller'];
    }


    //function for culculating the BMI when user provides their data
    public function calculate_bmi(Request $req) {
        $mass = $req->weight;
        $height = $req->height;

        $siunit= '  kg/m²';
        if (!$mass || !$height) {
            return ['remark' => 'Please enter your body data'];
        }
         else {
            $bmi = $mass / ($height * $height);

            if ($bmi < 18.5) {
                return [
                    'remark' => 'Underweight ',
                'bmi'=>number_format($bmi, 2).$siunit
                ];
            }
            elseif ($bmi >= 18.5 && $bmi <= 24.9) {
                return [
                    'remark' => 'Healthly Weight',
                    'bmi'=>number_format($bmi, 2).$siunit
            ];
            }
            elseif ($bmi >= 25 && $bmi <= 29.9 ) {
                return [
                    'remark' => 'OverWeight',
                    'bmi'=>number_format($bmi, 2).$siunit
                 ];
            }
            elseif ($bmi >= 30 && $bmi <= 34.9) {
                return [
                    'remark' => 'Obese',
                    'bmi'=>number_format($bmi, 2) .$siunit
            ];
            }
            elseif ($bmi >= 35 && $bmi <= 39.9) {
                return [
                    'remark' => 'Severely Obese',
                    'bmi'=>number_format($bmi, 2) .$siunit
            ];
            }
            elseif($bmi >= 40) {
                return [
                    'remark' => 'MOrbidlyweight',
                    'bmi'=>number_format($bmi, 2) .$siunit
            ];
            }

        }
    }
}
