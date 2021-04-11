<?php

namespace App\Http\Controllers;

use App\Models\Reservation;
use App\Models\Trip;
use App\Models\TripStation;
use Illuminate\Http\Request;

use App\Models\User;
use Hash;
use Illuminate\Support\Facades\DB;
use Validator;
use Auth;
class UserController extends Controller
{
    public function getTrips(Request $request)
    {

//        select distinct trip_id from trips_stations where station_id =1 and trip_id IN (select distinct trip_id from trips_stations where station_id =3);


        $validator = Validator::make($request->all(), [
            'startStation' => 'required|exists:stations,id',
            'endStation' => 'required|different:startStation|exists:stations,id',
        ]);
        if($validator->fails()){
            return response()->json(['error' => $validator->errors()->all()]);
        }
        $SourceStation=$request->startStation;
        $Destination=$request->endStation;
//        $trips=DB::select ('select distinct IDTrip from trip_stations where IDStation = '. $SourceStation . ' and IDTrip IN (select distinct IDTrip from trip_stations where IDStation = '.$Destination.') and StationOrder < (select distinct StationOrder from trip_stations where IDStation = '.$Destination.')');
        $TripIdList=[];
        $tripsContainSource=Trip::join('trip_stations','trip_stations.IDTrip','trips.id')
            ->where('trips.status','Preparation')
            ->where('trip_stations.IDStation',$SourceStation)
            ->select('trips.id','trip_stations.StationOrder','trips.startDateTime')
            ->get();

        foreach ($tripsContainSource as $trip){
            $tripsContainDestination=TripStation::where('IDTrip',$trip->id)
                ->where('IDStation',$Destination)
                ->where('StationOrder' ,'>',$trip->StationOrder)
                ->first();
            if ($tripsContainDestination){

                $availableSeats=[];
                for ($seatNumber = 1; $seatNumber <= 12; $seatNumber++) {

                    $seat=$this->checkSeat($seatNumber,$trip->id,$trip->StationOrder, $tripsContainDestination->StationOrder);
                    if ($seat == 'true'){
                        array_push($availableSeats,$seatNumber);

                    }
                }

                $tripData=[
                    'IDTrip' => $trip->id,
                    'tripStartTime' => $trip->startDateTime,
                    'SourceOrder' => $trip->StationOrder,
                    'Destination' => $tripsContainDestination->StationOrder,
                    'availableSeats' => $availableSeats
                ];
                array_push($TripIdList,$tripData);
            }

        }
        $success =  $TripIdList;

        return response()->json($success, 200);
    }

    public function booking(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'seatNumber' => 'required|numeric|min:1|max:12',
            'IDTrip' => 'required|exists:trips,id',
            'sourceStationID' => 'required|exists:stations,id',
            'destinationStationID' => 'required|different:sourceStationID|exists:stations,id',
        ]);
        if($validator->fails()){
            return response()->json(['error' => $validator->errors()->all()]);
        }
        $sourceOrder=TripStation::where('IDTrip',$request->IDTrip)->where('IDStation',$request->sourceStationID)->first();
        $destinationOrder=TripStation::where('IDTrip',$request->IDTrip)->where('IDStation',$request->destinationStationID)->first();
        $seat=$this->checkSeat($request->seatNumber,$request->IDTrip,$sourceOrder->StationOrder,$destinationOrder->StationOrder);
        if ($seat == 'true') {
            $reservation=new Reservation();
            $reservation->IDTrip=$request->IDTrip;
            $reservation->seatNumber=$request->seatNumber;
            $reservation->startStationOrder=$sourceOrder->StationOrder;
            $reservation->endStationOrder=$destinationOrder->StationOrder;
            $reservation->save();
            $success =  'Booking Done';

            return response()->json($success, 200);
        }else{
            return response()->json(['error' =>'This seat is not available']);
        }
    }

    public function checkSeat($seatNumber,$idTrip,$sourceOrder,$destination){
        $isAvailable='true';
        $TripReservation=Reservation::where('IDTrip',$idTrip)->where('seatNumber',$seatNumber)->get();
        if (count($TripReservation)>0){
            foreach ($TripReservation as $reservation){
                if ($isAvailable == 'false'){
                    break;
                }elseif ($sourceOrder == $reservation->startStationOrder || $destination == $reservation->endStationOrder){
                    $isAvailable='false';
                }elseif ($sourceOrder > $reservation->startStationOrder && $sourceOrder >= $reservation->endStationOrder){
                    $isAvailable='true';
                }elseif (($destination > $reservation->startStationOrder && $destination <= $reservation->endStationOrder)){
                    $isAvailable='false';
                }
            }
        }
        return $isAvailable;
    }

    public function userLogin(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email',
            'password' => 'required',
        ]);

        if($validator->fails()){
            return response()->json(['error' => $validator->errors()->all()]);
        }

        if(auth()->guard('user')->attempt(['email' => request('email'), 'password' => request('password')])){

            config(['auth.guards.api.provider' => 'user']);

            $user = User::select('users.*')->find(auth()->guard('user')->user()->id);
            $success =  $user;
            $success['token'] =  $user->createToken('MyApp',['user'])->accessToken;

            return response()->json($success, 200);
        }else{
            return response()->json(['error' => ['Email and Password are Wrong.']], 200);
        }
    }
}
