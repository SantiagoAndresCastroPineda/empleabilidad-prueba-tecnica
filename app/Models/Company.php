<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\JobVacancy;

class Company extends Model
{
    use HasFactory;
    
    protected $table = 'company';
    protected $fillable = [
        'nit',
        'nombre_empresa',
        'email',
        'telefono',
        'ciudad',
        'estado',
    ];

    public function jobVacancies()
    {
        return $this->hasMany(JobVacancy::class);
    }
}
