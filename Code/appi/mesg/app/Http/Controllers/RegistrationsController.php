<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;

class RegistrationsController extends Controller
{
    public function create(){
        return view('register.create');
    }

    public function store(){
        // Validate the form
        $this->validate(request(), [
            'nom' =>  'required',
            'prenom' =>  'required',
            'nni' =>  'required',
            'gaia' =>  'required',
            'email' =>  'required|email',
            'password' =>  'required'
        ]);

        User::create(request()->all());
        return redirect()->route('dashboard');
    }
}
