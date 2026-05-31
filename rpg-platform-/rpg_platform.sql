-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-06-2026 a las 01:08:15
-- Versión del servidor: 10.6.25-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `rpg_platform`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `accion_combate`
--

CREATE TABLE `accion_combate` (
  `id_accion` int(11) NOT NULL,
  `tipo_accion` varchar(80) NOT NULL,
  `dano` int(11) DEFAULT 0,
  `descripcion` text DEFAULT NULL,
  `id_turno` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `accion_combate`
--

INSERT INTO `accion_combate` (`id_accion`, `tipo_accion`, `dano`, `descripcion`, `id_turno`) VALUES
(5, 'Ataque Cuerpo a Cuerpo', 0, 'Gandalf (Mago) ataque cuerpo a cuerpo - FALLÓ', 5),
(6, 'Ataque Cuerpo a Cuerpo', 11, 'Gandalf (Mago) ataque cuerpo a cuerpo - GOLPE CERTERO: 11 daño', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 3, 'add_permission'),
(6, 'Can change permission', 3, 'change_permission'),
(7, 'Can delete permission', 3, 'delete_permission'),
(8, 'Can view permission', 3, 'view_permission'),
(9, 'Can add group', 2, 'add_group'),
(10, 'Can change group', 2, 'change_group'),
(11, 'Can delete group', 2, 'delete_group'),
(12, 'Can view group', 2, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add campania', 7, 'add_campania'),
(26, 'Can change campania', 7, 'change_campania'),
(27, 'Can delete campania', 7, 'delete_campania'),
(28, 'Can view campania', 7, 'view_campania'),
(29, 'Can add combate', 8, 'add_combate'),
(30, 'Can change combate', 8, 'change_combate'),
(31, 'Can delete combate', 8, 'delete_combate'),
(32, 'Can view combate', 8, 'view_combate'),
(33, 'Can add tirada dado', 9, 'add_tiradadado'),
(34, 'Can change tirada dado', 9, 'change_tiradadado'),
(35, 'Can delete tirada dado', 9, 'delete_tiradadado'),
(36, 'Can view tirada dado', 9, 'view_tiradadado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$1200000$Imd4UIsD3PcjsPlIAx2xF8$JzPuDkETc+tDu/KQKlsLldvCF2UhDfftEXJoelseq8Y=', '2026-05-04 16:32:17.468335', 0, 'sistema', '', '', 'sistema@rpg.local', 0, 1, '2026-05-04 16:31:32.132267'),
(2, 'pbkdf2_sha256$1200000$6JdND24SDkyeee8dSB9T2W$2xNhA6JapPtdYkNdbms0UF4/a1yxDAujSa1flZBLg6M=', '2026-05-17 17:52:07.335476', 1, 'admin', '', '', 'admin@admin123.com', 1, 1, '2026-05-17 17:50:37.197717'),
(3, 'pbkdf2_sha256$1200000$W3BPe7EswvdTQFVoeBK4va$RWwPvoE9SSlDlkm2zzGr9oJ3DQVLoQAYKikErMCaIO8=', '2026-05-31 19:20:08.649456', 1, 'vargas', '', '', 'admin@admin.com', 1, 1, '2026-05-31 19:19:16.286062');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `campania`
--

CREATE TABLE `campania` (
  `id_campania` int(11) NOT NULL,
  `nombre` varchar(120) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `estado` varchar(50) DEFAULT 'Activa',
  `narrador_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `campania`
--

INSERT INTO `campania` (`id_campania`, `nombre`, `descripcion`, `fecha_inicio`, `estado`, `narrador_id`) VALUES
(1, 'Campaña Principal', 'Campaña principal del sistema RPG', NULL, 'Activa', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `campania_jugador`
--

CREATE TABLE `campania_jugador` (
  `id_campania` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `celda`
--

CREATE TABLE `celda` (
  `id_celda` int(11) NOT NULL,
  `fila_pos` int(11) NOT NULL,
  `columna_pos` int(11) NOT NULL,
  `tipo_terreno` varchar(50) DEFAULT NULL,
  `bloqueada` tinyint(1) DEFAULT 0,
  `id_mapa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clase`
--

CREATE TABLE `clase` (
  `id_clase` int(11) NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `dado_vida` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `clase`
--

INSERT INTO `clase` (`id_clase`, `nombre`, `descripcion`, `dado_vida`) VALUES
(1, 'Guerrero', NULL, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `combate`
--

CREATE TABLE `combate` (
  `id_combate` int(11) NOT NULL,
  `fecha_inicio` datetime DEFAULT current_timestamp(),
  `estado` varchar(50) DEFAULT 'Activo',
  `id_campania` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `combate`
--

INSERT INTO `combate` (`id_combate`, `fecha_inicio`, `estado`, `id_campania`) VALUES
(8, '2026-05-04 19:04:58', 'Activo', 1),
(9, '2026-05-31 19:20:34', 'Activo', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(2, 'auth', 'group'),
(3, 'auth', 'permission'),
(4, 'auth', 'user'),
(7, 'combate', 'campania'),
(8, 'combate', 'combate'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(9, 'tirada', 'tiradadado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2026-05-02 18:04:40.751797'),
(2, 'auth', '0001_initial', '2026-05-02 18:04:41.324411'),
(3, 'admin', '0001_initial', '2026-05-02 18:04:41.499772'),
(4, 'admin', '0002_logentry_remove_auto_add', '2026-05-02 18:04:41.506066'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2026-05-02 18:04:41.512624'),
(6, 'contenttypes', '0002_remove_content_type_name', '2026-05-02 18:04:41.599129'),
(7, 'auth', '0002_alter_permission_name_max_length', '2026-05-02 18:04:41.643116'),
(8, 'auth', '0003_alter_user_email_max_length', '2026-05-02 18:04:41.673005'),
(9, 'auth', '0004_alter_user_username_opts', '2026-05-02 18:04:41.679115'),
(10, 'auth', '0005_alter_user_last_login_null', '2026-05-02 18:04:41.721355'),
(11, 'auth', '0006_require_contenttypes_0002', '2026-05-02 18:04:41.723885'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2026-05-02 18:04:41.729733'),
(13, 'auth', '0008_alter_user_username_max_length', '2026-05-02 18:04:41.760077'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2026-05-02 18:04:41.789967'),
(15, 'auth', '0010_alter_group_name_max_length', '2026-05-02 18:04:41.825047'),
(16, 'auth', '0011_update_proxy_permissions', '2026-05-02 18:04:41.832280'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2026-05-02 18:04:41.861369'),
(18, 'sessions', '0001_initial', '2026-05-02 18:04:41.905581'),
(19, 'combate', '0001_initial', '2026-05-17 17:43:31.099673'),
(20, 'tirada', '0001_initial', '2026-05-17 17:43:31.104706');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('i6jpzir39yqphooqydrc7101emudvobw', '.eJxVjDsOwyAQBe9CHSFYQEDK9DkD2uUTnEQgGbuycvfYkouknZn3NhZwXWpYR57DlNiVAbv8MsL4yu0Q6Ynt0XnsbZkn4kfCTzv4vaf8vp3t30HFUfe1I0koQFMu4ErxxTunvLfWJtA7xSQcGtCeojQRUFHUokhyyQChAvb5AvABOC8:1wOfep:Rxo1YJ8cIJ44RnsgRwcSj3tyH33IsAJC7sBxKa59ZmQ', '2026-05-31 17:52:07.343544'),
('k1esq3wlakn2hqdlj83yhxpv87yzg0mf', '.eJxVjEEOwiAQRe_C2hCGIRhcuvcMZJgBqRpISrtqvLs26UK3_733NxVpXWpcR57jJOqiUJ1-t0T8zG0H8qB275p7W-Yp6V3RBx361iW_rof7d1Bp1G_tivcMyBAKIgFYCMaSuLOIOFMYEUuSAskAEDBax1nYJ3AExaWg3h_gFDgw:1wTlhg:tqL7Y1us2EbZQXJwh97xC0nKoA37FwSJeGD6-zeb_0Y', '2026-06-14 19:20:08.657474'),
('nmw0ogdjpcr9pweyenjxugmvg2ekz5y4', '.eJxVjDsOwjAUBO_iGlmJ_fyBkj5nsJ7tDQkgW4qTCnF3iJQC2p2ZfYnA2zqFrWEJcxYX0YvT7xY5PVB2kO9cblWmWtZljnJX5EGbHGrG83q4fwcTt-lbK08GSTNl6NEbQHs4M3bZsAbIJQvXg87UqT6mrDrjEEevbGJLipR4fwDzyjgG:1wJwDR:8HiHG5cgMEuiePfTNfhQBG8nUxTDH2oZ7tPIJYarhlw', '2026-05-18 16:32:17.478753');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habilidad`
--

CREATE TABLE `habilidad` (
  `id_habilidad` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historia`
--

CREATE TABLE `historia` (
  `id_historia` int(11) NOT NULL,
  `titulo` varchar(120) DEFAULT NULL,
  `contenido` text DEFAULT NULL,
  `id_campania` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mapa`
--

CREATE TABLE `mapa` (
  `id_mapa` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `filas` int(11) NOT NULL,
  `columnas` int(11) NOT NULL,
  `imagen_fondo` varchar(255) DEFAULT NULL,
  `id_campania` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mision`
--

CREATE TABLE `mision` (
  `id_mision` int(11) NOT NULL,
  `titulo` varchar(120) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `estado` varchar(50) DEFAULT 'Pendiente',
  `recompensa` varchar(255) DEFAULT NULL,
  `id_campania` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `npc`
--

CREATE TABLE `npc` (
  `id_npc` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `nivel` int(11) DEFAULT 1,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personaje`
--

CREATE TABLE `personaje` (
  `id_personaje` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `nivel` int(11) DEFAULT 1,
  `experiencia` int(11) DEFAULT 0,
  `vida_actual` int(11) DEFAULT 10,
  `vida_maxima` int(11) DEFAULT 10,
  `fuerza` int(11) DEFAULT 10,
  `destreza` int(11) DEFAULT 10,
  `constitucion` int(11) DEFAULT 10,
  `inteligencia` int(11) DEFAULT 10,
  `sabiduria` int(11) DEFAULT 10,
  `carisma` int(11) DEFAULT 10,
  `user_id` int(11) NOT NULL,
  `id_raza` int(11) NOT NULL,
  `id_clase` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `personaje`
--

INSERT INTO `personaje` (`id_personaje`, `nombre`, `nivel`, `experiencia`, `vida_actual`, `vida_maxima`, `fuerza`, `destreza`, `constitucion`, `inteligencia`, `sabiduria`, `carisma`, `user_id`, `id_raza`, `id_clase`) VALUES
(1, 'Guerrero Valiente', 5, 0, 50, 50, 16, 12, 14, 10, 11, 12, 1, 1, 1),
(2, 'Mago Oscuro', 4, 0, 30, 30, 10, 14, 12, 16, 13, 11, 1, 1, 1),
(3, 'Guerrero Valiente', 5, 0, 50, 50, 16, 12, 14, 10, 11, 12, 1, 1, 1),
(4, 'Mago Oscuro', 4, 0, 30, 30, 10, 14, 12, 16, 13, 11, 1, 1, 1),
(5, 'Thorin (Guerrero)', 5, 0, 39, 50, 16, 12, 14, 10, 11, 12, 1, 1, 1),
(6, 'Gandalf (Mago)', 4, 0, 30, 30, 10, 14, 12, 16, 13, 11, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personaje_habilidad`
--

CREATE TABLE `personaje_habilidad` (
  `id_personaje` int(11) NOT NULL,
  `id_habilidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `raza`
--

CREATE TABLE `raza` (
  `id_raza` int(11) NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `bono_fuerza` int(11) DEFAULT 0,
  `bono_destreza` int(11) DEFAULT 0,
  `bono_constitucion` int(11) DEFAULT 0,
  `bono_inteligencia` int(11) DEFAULT 0,
  `bono_sabiduria` int(11) DEFAULT 0,
  `bono_carisma` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `raza`
--

INSERT INTO `raza` (`id_raza`, `nombre`, `descripcion`, `bono_fuerza`, `bono_destreza`, `bono_constitucion`, `bono_inteligencia`, `bono_sabiduria`, `bono_carisma`) VALUES
(1, 'Humano', NULL, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id_rol` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id_rol`, `nombre`) VALUES
(1, 'Administrador'),
(2, 'Jugador'),
(3, 'Narrador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sesion`
--

CREATE TABLE `sesion` (
  `id_sesion` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `resumen` text DEFAULT NULL,
  `id_campania` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tirada_combate`
--

CREATE TABLE `tirada_combate` (
  `id_tirada_combate` int(11) NOT NULL,
  `id_combate` int(11) NOT NULL,
  `id_tirada` int(11) NOT NULL,
  `tipo_accion` varchar(50) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tirada_combate`
--

INSERT INTO `tirada_combate` (`id_tirada_combate`, `id_combate`, `id_tirada`, `tipo_accion`, `descripcion`, `fecha`) VALUES
(1, 8, 15, 'esquivar', '', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tirada_dado`
--

CREATE TABLE `tirada_dado` (
  `id_tirada` int(11) NOT NULL,
  `tipo_dado` varchar(10) NOT NULL,
  `resultado` int(11) NOT NULL,
  `fecha` datetime DEFAULT current_timestamp(),
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tirada_dado`
--

INSERT INTO `tirada_dado` (`id_tirada`, `tipo_dado`, `resultado`, `fecha`, `user_id`) VALUES
(1, 'd10', 5, '2026-05-04 16:31:53', 1),
(3, 'd8', 8, '2026-05-04 18:46:03', 1),
(4, 'd6', 4, '2026-05-04 20:16:56', 1),
(5, 'd6', 5, '2026-05-04 20:22:15', 1),
(6, 'd12', 7, '2026-05-17 17:52:16', 2),
(7, 'd12', 8, '2026-05-17 17:52:16', 2),
(8, 'd10', 10, '2026-05-31 19:20:17', 3),
(9, 'd6', 2, '2026-05-31 19:20:56', 3),
(10, 'd6', 4, '2026-05-31 19:20:57', 3),
(11, 'd20', 17, '2026-05-31 22:47:35', 3),
(12, 'd20', 1, '2026-05-31 22:47:36', 3),
(13, 'd10', 10, '2026-05-31 23:01:37', 3),
(14, 'd10', 7, '2026-05-31 23:01:37', 3),
(15, 'd10', 8, '2026-05-31 23:02:29', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `token_mapa`
--

CREATE TABLE `token_mapa` (
  `id_token` int(11) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `referencia_id` int(11) DEFAULT NULL,
  `pos_x` int(11) NOT NULL,
  `pos_y` int(11) NOT NULL,
  `id_mapa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `turno`
--

CREATE TABLE `turno` (
  `id_turno` int(11) NOT NULL,
  `orden_turno` int(11) NOT NULL,
  `id_combate` int(11) NOT NULL,
  `id_personaje` int(11) DEFAULT NULL,
  `id_npc` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `turno`
--

INSERT INTO `turno` (`id_turno`, `orden_turno`, `id_combate`, `id_personaje`, `id_npc`) VALUES
(5, 1, 8, 6, NULL),
(6, 2, 8, 5, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_rol`
--

CREATE TABLE `usuario_rol` (
  `id_usuario_rol` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `id_rol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `accion_combate`
--
ALTER TABLE `accion_combate`
  ADD PRIMARY KEY (`id_accion`),
  ADD KEY `fk_accion_turno` (`id_turno`);

--
-- Indices de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indices de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indices de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `campania`
--
ALTER TABLE `campania`
  ADD PRIMARY KEY (`id_campania`),
  ADD KEY `fk_campania_narrador` (`narrador_id`);

--
-- Indices de la tabla `campania_jugador`
--
ALTER TABLE `campania_jugador`
  ADD PRIMARY KEY (`id_campania`,`user_id`),
  ADD KEY `fk_cj_user` (`user_id`);

--
-- Indices de la tabla `celda`
--
ALTER TABLE `celda`
  ADD PRIMARY KEY (`id_celda`),
  ADD KEY `fk_celda_mapa` (`id_mapa`);

--
-- Indices de la tabla `clase`
--
ALTER TABLE `clase`
  ADD PRIMARY KEY (`id_clase`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `combate`
--
ALTER TABLE `combate`
  ADD PRIMARY KEY (`id_combate`),
  ADD KEY `fk_combate_campania` (`id_campania`);

--
-- Indices de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indices de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indices de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indices de la tabla `habilidad`
--
ALTER TABLE `habilidad`
  ADD PRIMARY KEY (`id_habilidad`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `historia`
--
ALTER TABLE `historia`
  ADD PRIMARY KEY (`id_historia`),
  ADD KEY `fk_historia_campania` (`id_campania`);

--
-- Indices de la tabla `mapa`
--
ALTER TABLE `mapa`
  ADD PRIMARY KEY (`id_mapa`),
  ADD KEY `fk_mapa_campania` (`id_campania`);

--
-- Indices de la tabla `mision`
--
ALTER TABLE `mision`
  ADD PRIMARY KEY (`id_mision`),
  ADD KEY `fk_mision_campania` (`id_campania`);

--
-- Indices de la tabla `npc`
--
ALTER TABLE `npc`
  ADD PRIMARY KEY (`id_npc`);

--
-- Indices de la tabla `personaje`
--
ALTER TABLE `personaje`
  ADD PRIMARY KEY (`id_personaje`),
  ADD KEY `fk_personaje_user` (`user_id`),
  ADD KEY `fk_personaje_raza` (`id_raza`),
  ADD KEY `fk_personaje_clase` (`id_clase`);

--
-- Indices de la tabla `personaje_habilidad`
--
ALTER TABLE `personaje_habilidad`
  ADD PRIMARY KEY (`id_personaje`,`id_habilidad`),
  ADD KEY `fk_ph_habilidad` (`id_habilidad`);

--
-- Indices de la tabla `raza`
--
ALTER TABLE `raza`
  ADD PRIMARY KEY (`id_raza`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id_rol`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `sesion`
--
ALTER TABLE `sesion`
  ADD PRIMARY KEY (`id_sesion`),
  ADD KEY `fk_sesion_campania` (`id_campania`);

--
-- Indices de la tabla `tirada_combate`
--
ALTER TABLE `tirada_combate`
  ADD PRIMARY KEY (`id_tirada_combate`),
  ADD KEY `id_combate` (`id_combate`),
  ADD KEY `id_tirada` (`id_tirada`);

--
-- Indices de la tabla `tirada_dado`
--
ALTER TABLE `tirada_dado`
  ADD PRIMARY KEY (`id_tirada`),
  ADD KEY `fk_tirada_user` (`user_id`);

--
-- Indices de la tabla `token_mapa`
--
ALTER TABLE `token_mapa`
  ADD PRIMARY KEY (`id_token`),
  ADD KEY `fk_token_mapa` (`id_mapa`);

--
-- Indices de la tabla `turno`
--
ALTER TABLE `turno`
  ADD PRIMARY KEY (`id_turno`),
  ADD KEY `fk_turno_combate` (`id_combate`),
  ADD KEY `fk_turno_personaje` (`id_personaje`),
  ADD KEY `fk_turno_npc` (`id_npc`);

--
-- Indices de la tabla `usuario_rol`
--
ALTER TABLE `usuario_rol`
  ADD PRIMARY KEY (`id_usuario_rol`),
  ADD UNIQUE KEY `user_id` (`user_id`,`id_rol`),
  ADD KEY `fk_usuario_rol_rol` (`id_rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `accion_combate`
--
ALTER TABLE `accion_combate`
  MODIFY `id_accion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `campania`
--
ALTER TABLE `campania`
  MODIFY `id_campania` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `celda`
--
ALTER TABLE `celda`
  MODIFY `id_celda` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `clase`
--
ALTER TABLE `clase`
  MODIFY `id_clase` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `combate`
--
ALTER TABLE `combate`
  MODIFY `id_combate` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `habilidad`
--
ALTER TABLE `habilidad`
  MODIFY `id_habilidad` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `historia`
--
ALTER TABLE `historia`
  MODIFY `id_historia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mapa`
--
ALTER TABLE `mapa`
  MODIFY `id_mapa` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mision`
--
ALTER TABLE `mision`
  MODIFY `id_mision` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `npc`
--
ALTER TABLE `npc`
  MODIFY `id_npc` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `personaje`
--
ALTER TABLE `personaje`
  MODIFY `id_personaje` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `raza`
--
ALTER TABLE `raza`
  MODIFY `id_raza` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `sesion`
--
ALTER TABLE `sesion`
  MODIFY `id_sesion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tirada_combate`
--
ALTER TABLE `tirada_combate`
  MODIFY `id_tirada_combate` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tirada_dado`
--
ALTER TABLE `tirada_dado`
  MODIFY `id_tirada` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `token_mapa`
--
ALTER TABLE `token_mapa`
  MODIFY `id_token` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `turno`
--
ALTER TABLE `turno`
  MODIFY `id_turno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `usuario_rol`
--
ALTER TABLE `usuario_rol`
  MODIFY `id_usuario_rol` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `accion_combate`
--
ALTER TABLE `accion_combate`
  ADD CONSTRAINT `fk_accion_turno` FOREIGN KEY (`id_turno`) REFERENCES `turno` (`id_turno`) ON DELETE CASCADE;

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `campania`
--
ALTER TABLE `campania`
  ADD CONSTRAINT `fk_campania_narrador` FOREIGN KEY (`narrador_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `campania_jugador`
--
ALTER TABLE `campania_jugador`
  ADD CONSTRAINT `fk_cj_campania` FOREIGN KEY (`id_campania`) REFERENCES `campania` (`id_campania`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_cj_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `celda`
--
ALTER TABLE `celda`
  ADD CONSTRAINT `fk_celda_mapa` FOREIGN KEY (`id_mapa`) REFERENCES `mapa` (`id_mapa`) ON DELETE CASCADE;

--
-- Filtros para la tabla `combate`
--
ALTER TABLE `combate`
  ADD CONSTRAINT `fk_combate_campania` FOREIGN KEY (`id_campania`) REFERENCES `campania` (`id_campania`) ON DELETE CASCADE;

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `historia`
--
ALTER TABLE `historia`
  ADD CONSTRAINT `fk_historia_campania` FOREIGN KEY (`id_campania`) REFERENCES `campania` (`id_campania`) ON DELETE CASCADE;

--
-- Filtros para la tabla `mapa`
--
ALTER TABLE `mapa`
  ADD CONSTRAINT `fk_mapa_campania` FOREIGN KEY (`id_campania`) REFERENCES `campania` (`id_campania`) ON DELETE CASCADE;

--
-- Filtros para la tabla `mision`
--
ALTER TABLE `mision`
  ADD CONSTRAINT `fk_mision_campania` FOREIGN KEY (`id_campania`) REFERENCES `campania` (`id_campania`) ON DELETE CASCADE;

--
-- Filtros para la tabla `personaje`
--
ALTER TABLE `personaje`
  ADD CONSTRAINT `fk_personaje_clase` FOREIGN KEY (`id_clase`) REFERENCES `clase` (`id_clase`),
  ADD CONSTRAINT `fk_personaje_raza` FOREIGN KEY (`id_raza`) REFERENCES `raza` (`id_raza`),
  ADD CONSTRAINT `fk_personaje_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `personaje_habilidad`
--
ALTER TABLE `personaje_habilidad`
  ADD CONSTRAINT `fk_ph_habilidad` FOREIGN KEY (`id_habilidad`) REFERENCES `habilidad` (`id_habilidad`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_ph_personaje` FOREIGN KEY (`id_personaje`) REFERENCES `personaje` (`id_personaje`) ON DELETE CASCADE;

--
-- Filtros para la tabla `sesion`
--
ALTER TABLE `sesion`
  ADD CONSTRAINT `fk_sesion_campania` FOREIGN KEY (`id_campania`) REFERENCES `campania` (`id_campania`) ON DELETE CASCADE;

--
-- Filtros para la tabla `tirada_combate`
--
ALTER TABLE `tirada_combate`
  ADD CONSTRAINT `tirada_combate_ibfk_1` FOREIGN KEY (`id_combate`) REFERENCES `combate` (`id_combate`) ON DELETE CASCADE,
  ADD CONSTRAINT `tirada_combate_ibfk_2` FOREIGN KEY (`id_tirada`) REFERENCES `tirada_dado` (`id_tirada`) ON DELETE CASCADE;

--
-- Filtros para la tabla `tirada_dado`
--
ALTER TABLE `tirada_dado`
  ADD CONSTRAINT `fk_tirada_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `token_mapa`
--
ALTER TABLE `token_mapa`
  ADD CONSTRAINT `fk_token_mapa` FOREIGN KEY (`id_mapa`) REFERENCES `mapa` (`id_mapa`) ON DELETE CASCADE;

--
-- Filtros para la tabla `turno`
--
ALTER TABLE `turno`
  ADD CONSTRAINT `fk_turno_combate` FOREIGN KEY (`id_combate`) REFERENCES `combate` (`id_combate`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_turno_npc` FOREIGN KEY (`id_npc`) REFERENCES `npc` (`id_npc`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_turno_personaje` FOREIGN KEY (`id_personaje`) REFERENCES `personaje` (`id_personaje`) ON DELETE CASCADE;

--
-- Filtros para la tabla `usuario_rol`
--
ALTER TABLE `usuario_rol`
  ADD CONSTRAINT `fk_usuario_rol_rol` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_usuario_rol_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
