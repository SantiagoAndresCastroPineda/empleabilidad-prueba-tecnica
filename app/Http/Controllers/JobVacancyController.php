<?php

namespace App\Http\Controllers;
use App\Models\JobVacancy;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Carbon\Carbon;

class JobVacancyController extends Controller
{
    function listVacancy(){
        $result = JobVacancy::paginate(10);
        return response()->json($result);
    }
    function creates(Request $request){
        $validator = Validator::make($request->all(), [
            'company_id' => 'required|exists:company,id',
            'titulo' => 'required|string|max:255',
            'descripcion'=> 'required|string|max:255',
            'salario' => 'required|numeric|min:1300000',
            'experiencia_minima_años' => 'required|numeric|min:1',
            'fecha_cierre' => 'required|date_format:Y-m-d|after:today',
            'ciudad' => 'required|string|max:100',
            'nivel_educativo_minimo' =>'required|string',
            'numero_vacantes' =>'required|numeric|min:1',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'message' => 'Error de validación',
                'errors' => $validator->errors()
            ], 404);
        }
        $jobVacancy = JobVacancy::create( [
        'company_id' => $request->company_id,
        'titulo' => $request->titulo,
        'descripcion' =>$request->descripcion,
        'salario' =>$request->salario,
        'experiencia_minima_años' => $request->experiencia_minima_años,
        'fecha_cierre' => $request->fecha_cierre,
        'ciudad' => $request->ciudad,
        'nivel_educativo_minimo'=> $request->nivel_educativo_minimo,
        'numero_vacantes' => $request->numero_vacantes

    ]);

        return response()->json([
            'message' => 'Vacante creada correctamente',
            'vacante' => $jobVacancy
        ], 200);
    }
    function findById($id){
        $vacancy = JobVacancy::find($id);
        if (!$vacancy) {
        return response()->json(['message' => 'Vacante no encontrada'], 404);
        }
    return response()->json($vacancy);
    }
    public function create()
{

}
}
