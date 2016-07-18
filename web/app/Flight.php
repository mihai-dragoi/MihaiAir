<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Flight extends Model {
  public static $rules = array(
    'origin' => 'required',
    'destination' => 'required',
    'departure' => 'required',
    'arrival' => 'required',
    'airline' => '',
    'aircraft' => '',
    'flightNo' => 'required',
    'availability' => 'required',
    'price' => 'required'
  );
}
