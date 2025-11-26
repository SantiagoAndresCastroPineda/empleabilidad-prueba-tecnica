<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Participant;
use Illuminate\Support\Facades\Validator;
use Carbon\Carbon;


class ParticipantController extends Controller
{
        function listParticipant(){
        $result = Participant::paginate(10);
        return response()->json($result);
    }
    function creates(Request $request){
        $validator = Validator::make($request->all(), [
            'numero_documento' => 'required',
            'nombres' => 'required|string|max:255',
            'apellidos'=> 'required|string|max:255',
            'telefono' => ['required','digits:10'],
            'email' => 'nullable|email',
            'ciudad' => 'required|string|max:100',
            'fecha_nacimiento' => 'required|date_format:Y-m-d|before:18 years ago',
            'años_experiencia' => 'required|string',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'message' => 'Error de validación',
                'errors' => $validator->errors()
            ], 404);
        }
        $participant = Participant::create( [
        'numero_documento' => $request->numero_documento,
        'nombres' => $request->nombres,
        'apellidos' =>$request->apellidos,
        'telefono' =>$request->telefono,
        'email' => $request->email,
        'ciudad' => $request->ciudad,
        'fecha_nacimiento' => $request->fecha_nacimiento,
        'años_experiencia' => $request->años_experiencia,
    ]);

        return response()->json([
            'message' => 'Participante creada correctamente',
            'participante' => $participant
        ], 200);
    }
    function findById($id){
        $participant = Participant::find($id);
        if (!$participant) {
        return response()->json(['message' => 'Participante no encontrada'], 404);
        }
    return response()->json($participant);
    }
    public function create()
{

}
}
