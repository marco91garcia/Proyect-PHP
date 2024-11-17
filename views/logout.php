<?php
require_once("../config/conexion.php");

// Verifica si hay una sesión activa antes de destruirla
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

// Destruye la sesión
session_destroy();

// Redirige al archivo index.php
header("Location:" . Conectar::ruta() . "index.php");
exit();
?>
