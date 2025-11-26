<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\CompanyController;
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
Route::get('/empresas/crear', [CompanyController::class, 'create']);
Route::post('/empresas',[CompanyController::class,'creates']);
Route::get('/empresas/{id}',[CompanyController::class,'findById']);

