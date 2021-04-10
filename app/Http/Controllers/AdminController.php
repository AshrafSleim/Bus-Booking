<?php

namespace App\Http\Controllers;

use App\Models\Bus;
use App\Models\Station;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Admin;
use Hash;
use Validator;
use Auth;
class AdminController extends Controller
{

    public function adminLogin(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email',
            'password' => 'required',
        ]);

        if($validator->fails()){
            return response()->json(['error' => $validator->errors()->all()]);
        }
        if(auth()->guard('admin')->attempt(['email' => request('email'), 'password' => request('password')])){

            config(['auth.guards.api.provider' => 'admin']);

            $admin = Admin::select('admins.*')->find(auth()->guard('admin')->user()->id);
            $success =  $admin;
            $success['token'] =  $admin->createToken('MyApp',['admin'])->accessToken;
            return response()->json($success, 200);
        }else{
            return response()->json(['error' => ['Email and Password are Wrong.']], 200);
        }
    }

    public function AddBus(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'BusNumber' => 'required | unique:buses',
        ]);
        if($validator->fails()){
            return response()->json(['error' => $validator->errors()->all()]);
        }
        $Bus=new Bus();
        $Bus->busNumber=$request->BusNumber;
        $Bus->save();
        $success =  $Bus;
        return response()->json($success, 200);
    }
    public function AddStation(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'StationName' => 'required | unique:stations',
        ]);
        if($validator->fails()){
            return response()->json(['error' => $validator->errors()->all()]);
        }
        $Station=new Station();
        $Station->StationName=$request->StationName;
        $Station->save();
        $success =  $Station;
        return response()->json($success, 200);
    }

}
