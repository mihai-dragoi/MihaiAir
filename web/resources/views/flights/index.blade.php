@section('main')

<h1>All Flights</h1>

<p>{{ link_to_route('flights.create', 'Add new flight') }}</p>

@if ($flights->count())
    <table class="table table-striped table-bordered">
        <thead>
            <tr>
                <th>Origin</th>
                <th>Destination</th>
                <th>Departure</th>
                <th>Arrival</th>
                <th>Airline</th>
                <th>Aircraft</th>
                <th>Flight No.</th>
                <th>Availability</th>
                <th>Price</th>
            </tr>
        </thead>

        <tbody>
            @foreach ($flights as $fligh)
                <tr>
                    <td>{{ $fligh->origin }}</td>
                    <td>{{ $fligh->destination }}</td>
                    <td>{{ $fligh->departure }}</td>
                    <td>{{ $fligh->arrival }}</td>
                    <td>{{ $fligh->airline }}</td>
                    <td>{{ $fligh->aircraft }}</td>
                    <td>{{ $fligh->flightNo }}</td>
                    <td>{{ $fligh->availability }}</td>
                    <td>{{ link_to_route('flights.edit', 'Edit', array($flight->id), array('class' => 'btn btn-info')) }}</td>
                    <td>
          {{ Form::open(array('method'
=> 'DELETE', 'route' => array('flights.destroy', $flight->id))) }}
                            {{ Form::submit('Delete', array('class' => 'btn btn-danger')) }}
                        {{ Form::close() }}
                    </td>
                </tr>
            @endforeach

        </tbody>

    </table>
@else
    There are no flights
@endif

@stop
