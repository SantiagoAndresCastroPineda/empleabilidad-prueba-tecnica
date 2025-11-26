<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('application', function (Blueprint $table) {
            $table->id();
            $table->foreignId('participant_id')->constrained('participant')->onDelete('cascade');
            $table->foreignId('job_vacancy_id')->constrained('job_vacancy')->onDelete('cascade');
            $table->enum('estado', ['postulado', 'rechazado', 'aceptado'])->default('postulado');
            $table->integer('puntaje')->default(0); 
            $table->unique(['participant_id', 'job_vacancy_id']);
            $table->timestamp('fecha_postulacion')->useCurrent();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('application');
    }
};
