<?php

namespace App\Http\Controllers;
use App\Models\Company;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class CompanyController extends Controller
{
    function listCompany(){
        $result = Company::paginate(10);
        return response()->json($result);
    }
    function creates(Request $request){
        $validator = Validator::make($request->all(), [
            'nit' => 'required|string|max:50|unique:company,nit',
            'nombre_empresa' => 'required|string|max:255',
            'email' => 'nullable|email|max:255|unique:company,email',
            'telefono' => ['required','digits:10'],
            'ciudad' => 'nullable|string|max:100',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'message' => 'Error de validación',
                'errors' => $validator->errors()
            ], 404);
        }
        $company = Company::create($validator->validated());

        return response()->json([
            'message' => 'Empresa creada correctamente',
            'company' => $company
        ], 200);
    }
    function findById($id){
        $company = Company::find($id);
        if (!$company) {
        return response()->json(['message' => 'Empresa no encontrada'], 404);
        }
    return response()->json($company);
    }
    public function create()
{

}
}    

