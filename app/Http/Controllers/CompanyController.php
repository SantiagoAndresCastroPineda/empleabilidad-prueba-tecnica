<?php

namespace App\Http\Controllers;
use App\Models\Company;
use Illuminate\Http\Request;

class CompanyController extends Controller
{
    function index(){
    $result = Company::get();
    return $result;
    }
    function creates(){
        
    }
}

