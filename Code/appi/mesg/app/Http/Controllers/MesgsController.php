<?php

namespace App\Http\Controllers;

use App\Mesgs as Mesg;
use Illuminate\Http\Request;

class MesgsController extends Controller
{

    protected $mesg;
    public function __construct(Mesg $mesg)
    {
        $this->mesg = $mesg;
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
      $user = 'Mounir';
      $alert = false;
      $appi = 'Lyon';
      return view('mesgs.index', compact('user','alert','appi'));
    }

    /**
     * Display all the data for MESGS
     *
     * @return \App\MESGS
     */
    public function getData()
    {
        return Mesg::all();
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $title = 'Création d\'une MESG';
        $user = 'Mounir';

        return view('mesgs.create', compact('title','user'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $data = [
            $request->description,
            $request->numero,
            $request->programme,
            $request->pce,
            $request->nb_pce,
            $request->nb_sg,
            $request->batiment,
            $request->commune,
            $request->adresse,
            $request->gtc_id,
            $request->date_reception_mail,
            $request->date_reception_cm,
            $request->delai,
            $request->date_souhaite,
            // $request->Auth()->id
        ];

        dd($data);
        // Mesg::create($request->all());
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Mesgs  $mesgs
     * @return \Illuminate\Http\Response
     */
    public function show(Mesgs $mesgs)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Mesgs  $mesgs
     * @return \Illuminate\Http\Response
     */
    public function edit(Mesgs $mesgs)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Mesgs  $mesgs
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Mesgs $mesgs)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Mesgs  $mesgs
     * @return \Illuminate\Http\Response
     */
    public function destroy(Mesgs $mesgs)
    {
        //
    }
}
