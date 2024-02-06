<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class bill extends Model
{
     protected $fillable = [
        'plate_number',
        'location',
        'car_image', // Add this line
    ];
    use HasFactory;
}
