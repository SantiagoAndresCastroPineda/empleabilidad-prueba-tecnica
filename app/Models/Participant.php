<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;

class Participant extends Model
{
    use HasFactory;
    
         protected $fillable = [
        'numero_documento',
        'nombres',
        'apellidos',
        'email',
        'telefono',
        'fecha_nacimiento',
        'ciudad',
        'nivel_educativo',
        'años_experiencia',
        'estado',
         ];

           protected static function booted()
            {
                static::creating(function ($participant) {
                    $edad = \Carbon\Carbon::parse($participant->fecha_nacimiento)->age;

                    // joven si < 29 años
                    $persona->es_joven = $edad < 29;
                });
    }

}
