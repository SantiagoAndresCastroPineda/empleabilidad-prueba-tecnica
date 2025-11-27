Instalación con XAMPP
Si prefieres una instalación rápida usando XAMPP (que incluye Apache y MySQL), sigue estos pasos:

1.Instalar XAMPP
Descarga e instala XAMPP desde su página oficial

1.1.Iniciar el servidor Apache: Abre el panel de control de XAMPP y haz clic en "Start" junto a Apache para iniciar el servidor web.

1.2.Iniciar el servidor MySQL: En el mismo panel de control de XAMPP, haz clic en "Start" junto a MySQL para iniciar la base de datos.

2.Conado Repositorio
Si prefieres clonar el repositorio y manejar las dependencias manualmente, sigue estos pasos:
2.1. Clonar el repositorio
Clona el proyecto desde el repositorio con el siguiente comando:

git clone https://github.com/SantiagoAndresCastroPineda/empleabilidad-prueba-tecnica.git

entramos a la carpeta por cmd y ejecutamos los siguientes comandos

1.git checkout main 

2.git pull origin main

2.2.Instalar dependencias con Composer

Para instalar las dependencias del proyecto, primero debes abrir el proyecto en Visual Studio Code y luego ejecutar el siguiente comando en la terminal integrada de Visual Studio Code:

composer install

Ejecutar las migraciones y sembrar los datos
Ejecuta las migraciones para crear las tablas en la base de datos y si tienes datos iniciales para poblarla, usa --seed:

php artisan migrate --seed

Iniciar el servidor de desarrollo
Finalmente, para ejecutar la aplicación en el servidor de desarrollo, utiliza el siguiente comando:

php artisan serve

Esto arrancará el servidor y te permitirá acceder a la aplicación desde tu navegador en http://localhost:8000

## Funcionalidades implementadas
- [x] CRUD de empresas
- [x] CRUD de participantes
- [x] CRUD de vacantes
- [x] Sistema de postulaciones (si no lo hiciste)
## Decisiones técnicas
Se intentó implementar la estructura de visualización, pero no se logró completar debido a limitaciones de tiempo. Para acceder al entorno web visual, puedes hacerlo a través de la siguiente URL: http://localhost:8000
Aunque se ha avanzado en la implementación de algunas secciones, aún tengo poca experiencia conectando librerías externas con Laravel, lo que dificultó la integración completa.
Se Entrega un archivo sql con los registros de la bd y un postman con las peticiones realizadas
Como parte de la entrega, se incluye un archivo SQL con los registros de la base de datos, así como un archivo de Postman con las peticiones realizadas, lo que permitirá probar y validar las funcionalidades implementadas hasta el momento.
## Tiempo invertido
- Aproximadamente 12 horas 