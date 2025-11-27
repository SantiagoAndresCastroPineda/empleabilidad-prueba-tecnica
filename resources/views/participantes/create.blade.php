    <div class="container">
        <h2>Formulario para Crear Participante</h2>
        <!-- Formulario para crear un nuevo participante -->
        <form action="{{ route('participantes.store') }}" method="POST">
            @csrf
            <div class="mb-3">
                <label for="nombre_completo" class="form-label">Nombre Completo</label>
                <input type="text" class="form-control" id="nombre_completo" name="nombre_completo" required>
            </div>
            <div class="mb-3">
                <label for="email" class="form-label">Correo Electrónico</label>
                <input type="email" class="form-control" id="email" name="email" required>
            </div>
            <button type="submit" class="btn btn-primary">Guardar Participante</button>
        </form>
    </div>

