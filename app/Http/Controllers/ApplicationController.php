<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Application;
use Illuminate\Support\Facades\Validator;
use Carbon\Carbon;
use App\Models\Participant;
use App\Models\JobVacancy;


class ApplicationController extends Controller
{
       function listApplication(){
        $result = Application::paginate(10);
        return response()->json($result);
    }
    function creates(Request $request){
        $validator = Validator::make($request->all(), [
            'participant_id' => 'required|exists:participant,id',
            'job_vacancy_id' => 'required|exists:job_vacancy,id',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'message' => 'Error de validación',
                'errors' => $validator->errors()
            ], 404);
        }

         $existingApplication = Application::where('participant_id', $request->participant_id)
                                          ->where('job_vacancy_id', $request->job_vacancy_id)
                                          ->first();
          if ($existingApplication) {
            return response()->json([
                'message' => 'El participante ya ha postulado a esta vacante',
                'application' => $existingApplication
            ], 409); // 409 Conflict
        }
        $participant = Participant::find($request->participant_id);
        $jobVacancy = JobVacancy::find($request->job_vacancy_id);
        $puntaje = 0;
        // 40 puntos por nivel educativo
        if ($participant->nivel_educativo >= $jobVacancy->nivel_educativo_minimo) {
            $puntaje += 40;
        }
        // 40 puntos por experiencia
        if ($participant->años_experiencia >= $jobVacancy->experiencia_minima_años) {
            $puntaje += 40;
        }
        // 20 puntos por ubicación (ciudad)
        if ($participant->ciudad == $jobVacancy->ciudad) {
            $puntaje += 20;
        }
        // Asegurarse de que el puntaje no sea mayor a 100
        $puntaje = min($puntaje, 100);
        $Application = Application::create( [
             'participant_id' => $request->participant_id,
             'job_vacancy_id' => $request->job_vacancy_id,
             'puntaje' => $puntaje,
    ]);

        return response()->json([
            'message' => 'Aplication creada correctamente',
            'application' => $Application
        ], 200);
    }
    function findById($id){
        $Application = Application::find($id);
        if (!$Application) {
        return response()->json(['message' => 'Aplicacion no encontrada'], 404);
        }
    return response()->json($Application);
    }
    public function create()
{

}
}
