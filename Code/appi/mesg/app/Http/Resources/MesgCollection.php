<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\ResourceCollection;

class MesgCollection extends ResourceCollection
{
    /**
     * Transform the resource collection into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'description' => $this->description,
            'num' => $this->num,
            'programme' => $this->programme,
            'pce' => $this->pce,
            'nb_pce' => $this->nb_pce,
            'adresse' => $this->adresse,
            'batiment' => $this->batiment
        ];
    }
}
