<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Application extends Model
{
    use HasFactory;
      protected $fillable = [
        'participant_id',
        'job_vacancy_id',
        'fecha_postulacion',
        'estado',
        'puntaje'
      ];
}
