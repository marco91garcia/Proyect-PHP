<?php
require_once("../config/conexion.php");

class Usuario extends Conectar {
    public function login() {
        $conectar = parent::Conexion(); // Establece la conexión
        parent::set_names(); // Configura UTF-8

        if (isset($_POST["enviar"])) {
            $correo = $_POST["correo"];
            $password = $_POST["passwd"];

            // Verifica si los campos están vacíos
            if (empty($correo) || empty($password)) {
                // Redirige con un mensaje de error
                header("Location:" . Conectar::ruta() . "views/login.php?m=2");
                exit();
            } else {
                // Consulta SQL con marcadores de posición para evitar inyección
                $sql = "SELECT * FROM Usuarios WHERE usu_correo = ? AND usu_pass = ? AND est = 1";
                $stmt = $conectar->prepare($sql);

                if ($stmt) {
                    // Vincula los parámetros a los marcadores de posición
                    $stmt->bind_param("ss", $correo, $password);

                    // Ejecuta la consulta
                    $stmt->execute();

                    // Obtén el resultado de la consulta
                    $resultado = $stmt->get_result()->fetch_assoc();

                    // Verifica si se encontró un usuario
                    if (is_array($resultado) && count($resultado) > 0) {
                        // Inicia la sesión si aún no está iniciada
                        if (session_status() == PHP_SESSION_NONE) {
                            session_start();
                        }

                        // Guarda los datos del usuario en la sesión
                        $_SESSION["usu_id"] = $resultado["usu_id"];
                        $_SESSION["nombre"] = $resultado["usu_nom"];
                        $_SESSION["ape_paterno"] = $resultado["usu_apep"];
                        $_SESSION["correo"] = $resultado["usu_correo"];

                        // Redirige a la vista de inicio
                        header("Location:" . Conectar::ruta() . "views/inicio.php");
                        exit();
                    } else {
                        // Redirige al login con mensaje de error si las credenciales son incorrectas
                        header("Location:" . Conectar::ruta() . "views/404.php");
                        exit();
                    }
                } else {
                    // Si falla la preparación de la consulta, muestra un error
                    die("Error en la preparación de la consulta SQL: " . $conectar->error);
                }
            }
        }
    }
}
?>
