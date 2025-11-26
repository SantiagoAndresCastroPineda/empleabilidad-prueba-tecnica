<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Company;


class JobVacancy extends Model
{
    use HasFactory;
    
    protected $table = 'job_vacancy';
    protected $fillable = [
        'company_id',
        'titulo',
        'descripcion',
        'salario',
        'ciudad',
        'nivel_educativo_minimo',
        'experiencia_minima_años',
        'numero_vacantes',
        'fecha_cierre',
        'estado',
    ];

     public function company()
    {
        return $this->belongsTo(Company::class);
    }
}
