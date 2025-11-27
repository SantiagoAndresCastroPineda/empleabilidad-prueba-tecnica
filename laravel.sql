-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-11-2025 a las 02:58:49
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `laravel`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `application`
--

CREATE TABLE `application` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `participant_id` bigint(20) UNSIGNED NOT NULL,
  `job_vacancy_id` bigint(20) UNSIGNED NOT NULL,
  `estado` enum('postulado','rechazado','aceptado') NOT NULL DEFAULT 'postulado',
  `puntaje` int(11) NOT NULL DEFAULT 0,
  `fecha_postulacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `application`
--

INSERT INTO `application` (`id`, `participant_id`, `job_vacancy_id`, `estado`, `puntaje`, `fecha_postulacion`, `created_at`, `updated_at`) VALUES
(1, 1, 7, 'postulado', 40, '2025-11-27 01:53:48', '2025-11-27 06:53:48', '2025-11-27 06:53:48'),
(2, 1, 5, 'postulado', 40, '2025-11-27 01:54:02', '2025-11-27 06:54:02', '2025-11-27 06:54:02'),
(3, 1, 2, 'postulado', 40, '2025-11-27 01:54:07', '2025-11-27 06:54:07', '2025-11-27 06:54:07'),
(4, 1, 8, 'postulado', 40, '2025-11-27 01:54:14', '2025-11-27 06:54:14', '2025-11-27 06:54:14'),
(5, 1, 9, 'postulado', 80, '2025-11-27 01:54:17', '2025-11-27 06:54:17', '2025-11-27 06:54:17'),
(6, 1, 1, 'postulado', 80, '2025-11-27 01:54:45', '2025-11-27 06:54:45', '2025-11-27 06:54:45'),
(7, 1, 3, 'postulado', 40, '2025-11-27 01:55:09', '2025-11-27 06:55:09', '2025-11-27 06:55:09'),
(8, 1, 4, 'postulado', 40, '2025-11-27 01:55:24', '2025-11-27 06:55:24', '2025-11-27 06:55:24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `company`
--

CREATE TABLE `company` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nit` varchar(255) NOT NULL,
  `nombre_empresa` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telefono` varchar(255) NOT NULL,
  `ciudad` varchar(255) NOT NULL,
  `estado` enum('activa','inactiva') NOT NULL DEFAULT 'activa',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `company`
--

INSERT INTO `company` (`id`, `nit`, `nombre_empresa`, `email`, `telefono`, `ciudad`, `estado`, `created_at`, `updated_at`) VALUES
(1, '2309898898930-0', 'Santiago Castro', 'santiago8998988998@uptc.edu.co', '3173795354', 'Bogoota', 'activa', '2025-11-27 06:30:01', '2025-11-27 06:30:01'),
(2, '4567281938475-6', 'Soluciones Creativas Ltda.', 'contacto@solcreativas.com', '3129876543', 'Barranquilla', 'activa', '2025-11-27 06:31:11', '2025-11-27 06:31:11'),
(3, '2349876543210-3', 'AgroTech Innovators', 'info@agrotechinnovators.com', '3201234567', 'Santa Marta', 'activa', '2025-11-27 06:31:22', '2025-11-27 06:31:22'),
(4, '8901234567890-1', 'Consultoría Global S.A.', 'consultoria@global.com', '3112345678', 'Cartagena', 'activa', '2025-11-27 06:31:30', '2025-11-27 06:31:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `job_vacancy`
--

CREATE TABLE `job_vacancy` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descripcion` text NOT NULL,
  `salario` decimal(15,2) NOT NULL,
  `ciudad` varchar(255) NOT NULL,
  `nivel_educativo_minimo` enum('bachillerato','técnico','tecnólogo','profesional') NOT NULL,
  `experiencia_minima_años` tinyint(3) UNSIGNED NOT NULL,
  `numero_vacantes` smallint(5) UNSIGNED NOT NULL DEFAULT 1,
  `fecha_cierre` date NOT NULL,
  `estado` enum('publicada','cerrada') NOT NULL DEFAULT 'publicada',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `job_vacancy`
--

INSERT INTO `job_vacancy` (`id`, `company_id`, `titulo`, `descripcion`, `salario`, `ciudad`, `nivel_educativo_minimo`, `experiencia_minima_años`, `numero_vacantes`, `fecha_cierre`, `estado`, `created_at`, `updated_at`) VALUES
(1, 2, 'Desarrollador Frontend', 'Desarrollador con experiencia en React y Vue.js', 25000000.00, 'Bogotá', 'bachillerato', 2, 1, '2029-11-15', 'publicada', '2025-11-27 06:42:27', '2025-11-27 06:42:27'),
(2, 3, 'Ingeniero de Software', 'Desarrollo de aplicaciones empresariales utilizando Java y Spring Framework.', 35000000.00, 'Medellín', 'profesional', 4, 2, '2029-12-01', 'publicada', '2025-11-27 06:43:28', '2025-11-27 06:43:28'),
(3, 1, 'Técnico en Soporte IT', 'Atención y soporte a usuarios, instalación y mantenimiento de equipos informáticos.', 20000000.00, 'Cali', 'técnico', 1, 3, '2029-11-25', 'publicada', '2025-11-27 06:43:45', '2025-11-27 06:43:45'),
(4, 4, 'Diseñador Gráfico', 'Diseño de material gráfico para campañas publicitarias y redes sociales.', 18000000.00, 'Barranquilla', 'técnico', 2, 1, '2029-10-30', 'publicada', '2025-11-27 06:44:11', '2025-11-27 06:44:11'),
(5, 1, 'Analista de Datos', 'Análisis y visualización de datos, generación de informes estadísticos y dashboards.', 27000000.00, 'Pereira', 'profesional', 3, 2, '2029-11-10', 'publicada', '2025-11-27 06:44:50', '2025-11-27 06:44:50'),
(6, 3, 'Community Manager', 'Gestión de redes sociales y creación de contenido para estrategias de marketing digital.', 15000000.00, 'Bucaramanga', 'bachillerato', 1, 1, '2029-12-05', 'publicada', '2025-11-27 06:45:09', '2025-11-27 06:45:09'),
(7, 3, 'Gerente de Proyectos IT', 'Gestión de proyectos tecnológicos y coordinación de equipos multidisciplinarios.', 45000000.00, 'Cartagena', 'profesional', 5, 1, '2029-12-15', 'publicada', '2025-11-27 06:45:29', '2025-11-27 06:45:29'),
(8, 2, 'Contador Público', 'Revisión de informes financieros, gestión contable y cumplimiento fiscal.', 32000000.00, 'Cúcuta', 'profesional', 4, 1, '2029-11-20', 'publicada', '2025-11-27 06:45:48', '2025-11-27 06:45:48'),
(9, 3, 'Asistente Administrativo', 'Apoyo en la gestión de tareas administrativas y coordinación de documentación.', 16000000.00, 'Santa Marta', 'bachillerato', 1, 2, '2029-10-20', 'publicada', '2025-11-27 06:46:08', '2025-11-27 06:46:08'),
(10, 2, 'Especialista en Marketing Digital', 'Planificación y ejecución de campañas de marketing online, SEO y SEM.', 28000000.00, 'Pasto', 'tecnólogo', 3, 1, '2029-11-30', 'publicada', '2025-11-27 06:46:25', '2025-11-27 06:46:25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2025_11_26_144703_create_company_table', 1),
(6, '2025_11_26_150853_create_participant_table', 1),
(7, '2025_11_26_151833_create_job_vacancy_table', 1),
(8, '2025_11_26_173056_create_application_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `participant`
--

CREATE TABLE `participant` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `numero_documento` varchar(255) NOT NULL,
  `nombres` varchar(255) NOT NULL,
  `apellidos` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telefono` varchar(255) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `ciudad` varchar(255) NOT NULL,
  `nivel_educativo` enum('bachillerato','técnico','tecnólogo','profesional') NOT NULL,
  `años_experiencia` tinyint(3) UNSIGNED NOT NULL,
  `es_joven` tinyint(1) NOT NULL DEFAULT 0,
  `estado` enum('activo','colocado') NOT NULL DEFAULT 'activo',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `participant`
--

INSERT INTO `participant` (`id`, `numero_documento`, `nombres`, `apellidos`, `email`, `telefono`, `fecha_nacimiento`, `ciudad`, `nivel_educativo`, `años_experiencia`, `es_joven`, `estado`, `created_at`, `updated_at`) VALUES
(1, '10198801', 'Santiago Andres', 'Castro Pineda', 'santiago99@gmail.com', '3173795354', '1999-10-10', 'Sogamoso', 'bachillerato', 12, 1, 'activo', '2025-11-27 06:51:22', '2025-11-27 06:51:22'),
(2, '10234567', 'Laura Fernanda', 'Pérez Rodríguez', 'laura.perez@hotmail.com', '3145678901', '1993-05-21', 'Bogotá', 'bachillerato', 8, 0, 'activo', '2025-11-27 06:51:37', '2025-11-27 06:51:37'),
(3, '10387654', 'Carlos Alberto', 'Ramírez Gómez', 'carlos.ramirez@gmail.com', '3112345678', '1988-07-13', 'Medellín', 'bachillerato', 15, 0, 'activo', '2025-11-27 06:51:45', '2025-11-27 06:51:45'),
(4, '10456789', 'Ana María', 'García López', 'ana.garcia@outlook.com', '3001234567', '1990-11-05', 'Cali', 'bachillerato', 10, 0, 'activo', '2025-11-27 06:51:54', '2025-11-27 06:51:54'),
(5, '10543210', 'Javier Esteban', 'Martínez Torres', 'javier.martinez@correo.com', '3167894321', '1994-02-17', 'Barranquilla', 'bachillerato', 7, 0, 'activo', '2025-11-27 06:52:04', '2025-11-27 06:52:04'),
(6, '10654321', 'Camila Isabel', 'Sánchez Vélez', 'camila.sanchez@icloud.com', '3186549870', '1996-12-25', 'Pereira', 'bachillerato', 5, 1, 'activo', '2025-11-27 06:52:17', '2025-11-27 06:52:17'),
(7, '10765432', 'David Alejandro', 'López Ramírez', 'david.lopez@gmail.com', '3198765432', '1992-03-14', 'Bucaramanga', 'bachillerato', 9, 0, 'activo', '2025-11-27 06:52:30', '2025-11-27 06:52:30'),
(8, '10876543', 'Sandra Lucía', 'Hernández Díaz', 'sandra.hernandez@yahoo.com', '3123456789', '1995-08-22', 'Cartagena', 'bachillerato', 6, 0, 'activo', '2025-11-27 06:52:39', '2025-11-27 06:52:39'),
(9, '10987654', 'Luis Felipe', 'Torres Díaz', 'luis.torres@hotmail.com', '3154321098', '1990-09-30', 'Cúcuta', 'bachillerato', 13, 0, 'activo', '2025-11-27 06:52:46', '2025-11-27 06:52:46'),
(10, '11098765', 'Carolina María', 'Jiménez Peña', 'carolina.jimenez@gmail.com', '3119087365', '1992-06-15', 'Santa Marta', 'bachillerato', 11, 0, 'activo', '2025-11-27 06:52:54', '2025-11-27 06:52:54');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `application`
--
ALTER TABLE `application`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `application_participant_id_job_vacancy_id_unique` (`participant_id`,`job_vacancy_id`),
  ADD KEY `application_job_vacancy_id_foreign` (`job_vacancy_id`);

--
-- Indices de la tabla `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `company_nit_unique` (`nit`),
  ADD UNIQUE KEY `company_email_unique` (`email`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `job_vacancy`
--
ALTER TABLE `job_vacancy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_vacancy_company_id_foreign` (`company_id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `participant`
--
ALTER TABLE `participant`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `participant_numero_documento_unique` (`numero_documento`),
  ADD UNIQUE KEY `participant_email_unique` (`email`);

--
-- Indices de la tabla `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `application`
--
ALTER TABLE `application`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `company`
--
ALTER TABLE `company`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `job_vacancy`
--
ALTER TABLE `job_vacancy`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `participant`
--
ALTER TABLE `participant`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `application`
--
ALTER TABLE `application`
  ADD CONSTRAINT `application_job_vacancy_id_foreign` FOREIGN KEY (`job_vacancy_id`) REFERENCES `job_vacancy` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `application_participant_id_foreign` FOREIGN KEY (`participant_id`) REFERENCES `participant` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `job_vacancy`
--
ALTER TABLE `job_vacancy`
  ADD CONSTRAINT `job_vacancy_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
