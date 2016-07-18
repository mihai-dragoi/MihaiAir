@extends('layouts.flights')

@section('main')

<h1>Create Flight</h1>

{{ Form::open(array('route' => 'flights.store')) }}
    <ul>

        <li>
            {{ Form::label('origin', 'Origin:') }}
            {{ Form::text('origin') }}
        </li>

        <li>
            {{ Form::label('destination', 'Destination:') }}
            {{ Form::text('destination') }}
        </li>

        <li>
            {{ Form::label('departure', 'Departure:') }}
            {{ Form::password('departure') }}
        </li>

        <li>
            {{ Form::label('arrival', 'Arrival:') }}
            {{ Form::password('arrival') }}
        </li>

        <li>
            {{ Form::label('airline', 'Airline:') }}
            {{ Form::text('airline') }}
        </li>

        <li>
            {{ Form::label('aircraft', 'Aircraft:') }}
            {{ Form::text('aircraft') }}
        </li>
        <li>
            {{ Form::label('flightNo', 'Flight Number:') }}
            {{ Form::text('flightNo') }}
        </li>

        <li>
            {{ Form::label('availability', 'Availability:') }}
            {{ Form::text('availability') }}
        </li>


        <li>
            {{ Form::submit('Submit', array('class' => 'btn')) }}
        </li>
    </ul>
{{ Form::close() }}

@if ($errors->any())
    <ul>
        {{ implode('', $errors->all('<li class="error">:message</li>')) }}
    </ul>
@endif

@stop
