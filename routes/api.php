<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\CompanyController;
use App\Http\Controllers\ParticipantController;
use App\Http\Controllers\JobVacancyController;
use App\Http\Controllers\ApplicationController;

use App\Models\Company;
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get('/empresas', [CompanyController::class, 'listCompany']);
Route::put('/empresas', [CompanyController::class, 'update']);
Route::post('/empresas',[CompanyController::class,'creates']);
Route::get('/empresas/{id}',[CompanyController::class,'findById']);

Route::get('/participantes',[ParticipantController::class,'listParticipant']);
Route::get('/participantes/crear',[ParticipantController::class,'']);
Route::post('/participantes',[ParticipantController::class,'creates']);
Route::get('/participantes/{id}',[ParticipantController::class,'findById']);


Route::get('/vacantes',[JobVacancyController::class,'listVacancy']);
Route::get('/vacantes/crear',[JobVacancyController::class,'']);
Route::post('/vacantes',[JobVacancyController::class,'creates']);
Route::get('/vacantes/{id}',[JobVacancyController::class,'findById']);


Route::get('/aplication',[ApplicationController::class,'listAplication']);
Route::put('/aplication',[ApplicationController::class,'update']);
Route::post('/aplication',[ApplicationController::class,'creates']);
Route::get('/aplication/{id}',[ApplicationController::class,'findById']);