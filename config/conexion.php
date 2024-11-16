<?php
session_start(); // Correctamente iniciamos la sesión.

class Conectar {
    private $server = "localhost";
    private $user = "root";
    private $pass = "";
    private $db = "tutorial";
    protected $conexion;

    // Método para establecer la conexión a la base de datos.
    public function Conexion() {
        $this->conexion = new mysqli($this->server, $this->user, $this->pass, $this->db);

        if ($this->conexion->connect_errno) {
            die("Conexión Fallida: " . $this->conexion->connect_error);
        }

        return $this->conexion;
    }

    // Método para establecer el conjunto de caracteres.
    public function set_names() {
        return $this->conexion->query("SET NAMES 'utf8'");
    }
}

// Ejemplo para probar la conexión.
$conectar = new Conectar();
$conectar->Conexion();
echo "Conectado correctamente";
?>
