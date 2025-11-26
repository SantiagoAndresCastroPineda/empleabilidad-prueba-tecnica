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
        Schema::create('company', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->string('nit')->unique();
            $table->string('nombre_empresa');
            $table->string('email')->unique();
            $table->string('telefono');
            $table->string('ciudad');
            $table->enum('estado', ['activa', 'inactiva'])->default('activa');

        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('company');
    }
};
