<?php
class Usuario extends Conectar {
    public function login() {
        $conectar = parent::Conexion();
        parent::set_names();
        if (isset($_POST["enviar"])) {
            $correo = $_POST["correo"];
            $password = $_POST["passwd"];
            if (empty($correo) or empty($password)) {
                header("Location: ../views/login.php?m=2");
                exit();
            } else {
                $sql = "SELECT * FROM usuarios WHERE usu_correo = ? AND usu_pass = ? AND est = 1";
                $stmt = $conectar->prepare($sql);
                $stmt->bind_param("ss", $correo, $password);
                $stmt->execute();
                $resultado = $stmt->get_result()->fetch_assoc();
                if ($resultado) {
                    $_SESSION["usu_id"] = $resultado["usu_id"];
                    $_SESSION["nombre"] = $resultado["usu_nom"];
                    header("Location: ../views/inicio.php");
                } else {
                    header("Location: ../views/login.php?m=1");
                    exit();
                }
            }
        }
    }
}
?>
