<?php

namespace App\Http\Controllers;

use App\Flight;
use App\Http\Requests;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class FlightController extends Controller {
  public function index() {
    $flights = Flight::paginate(5);

    //return View::make('flights.index', compact('flights'));
    return view('flights.index',compact('flights'));
  }

  public function create(){
      return View::make('flights.create');
  }

  public function store() {
      $input = Input::all();
      $validation = Validator::make($input, Flight::$rules);

      if ($validation->passes())
      {
          Flight::create($input);

          return Redirect::route('flights.index');
      }

      return Redirect::route('flights.create')
          ->withInput()
          ->withErrors($validation)
          ->with('message', 'There were validation errors.');
  }

  public function show($id) {
    //
  }

  public function edit($id) {
      $flight = Flight::find($id);
      if (is_null($flight))
      {
          return Redirect::route('flights.index');
      }
      return View::make('flights.edit', compact('flight'));
  }

  public function update($id) {
      $input = Input::all();
      $validation = Validator::make($input, Flight::$rules);
      if ($validation->passes())
      {
          $flight = Flight::find($id);
          $flight->update($input);
          return Redirect::route('flights.show', $id);
      }
      return Redirect::route('flights.edit', $id)
          ->withInput()
          ->withErrors($validation)
          ->with('message', 'There were validation errors.');
  }

  public function destroy($id) {
      Flight::find($id)->delete();
      return Redirect::route('flights.index');
  }
}
