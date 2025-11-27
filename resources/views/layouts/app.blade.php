<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Test</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
</head>
<body>
    <div class="container">
        <h1>Bienvenido a la página principal</h1>
        <a href="javascript:void(0);" class="btn btn-primary" id="participanteBtn">Participante</a>
        <a href="javascript:void(0);" class="btn btn-primary" id="vacantesBtn">Vacantes</a>
        <a href="javascript:void(0);" class="btn btn-primary" id="empresaBtn">Empresas</a>
         <div id="participantePanel" class="panel">
            <h3>Información de Participante</h3>
            <a class="btn btn-primary" class="btn btn-primary" >Buscar Participante</a>
            <a class="btn btn-primary" class="btn btn-primary" >Listar Participantes</a>
            <a class="btn btn-primary" class="btn btn-primary" >Crear Participante</a>
        </div>
        <div id="vacantesPanel" class="panel">
            <h3>Información de Vacantes</h3>
            <a class="btn btn-primary" class="btn btn-primary" >Buscar Vacante</a>
            <a class="btn btn-primary" class="btn btn-primary" >Listar Vacantes</a>
            <a class="btn btn-primary" class="btn btn-primary" >Crear Vacante</a>
        </div>

        <div id="empresaPanel" class="panel">
            <h3>Información de Empresas</h3>
            <a class="btn btn-primary" class="btn btn-primary" >Buscar Empresa</a>
            <a class="btn btn-primary" class="btn btn-primary" >Listar Empresas</a>
            <a class="btn btn-primary" class="btn btn-primary" >Crear Empresa</a>
        </div>
    </div>

       <script>
        document.getElementById("participanteBtn").onclick = function() {
            togglePanel("participantePanel");
        };
        document.getElementById("vacantesBtn").onclick = function() {
            togglePanel("vacantesPanel");
        };
        document.getElementById("empresaBtn").onclick = function() {
            togglePanel("empresaPanel");
        };
        window.onload = function() {
            const storedPanel = localStorage.getItem('selectedPanel') || 'participantePanel';
            togglePanel(storedPanel);
        };


        function togglePanel(panelId) {
            const panels = document.querySelectorAll(".panel");
            panels.forEach(panel => panel.style.display = "none");
            const selectedPanel = document.getElementById(panelId);
            selectedPanel.style.display = selectedPanel.style.display === "none" ? "block" : "none";
        }
    </script>
    
</body>
</html>