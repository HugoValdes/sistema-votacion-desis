<?php
/**
 * Clase BD - MySQL - mysqli
 * 
 * @author Hugo Valdes
 * @version 1.0
 * 
 */

namespace DB;
use mysqli;

class DB {

    /**
     * Metodo que conecta a base de datos
     * @return mysqli connection
     */
    public static function open_conexion() {
        
        $host = constant('DB_HOST');
		$db = constant('DB');
		$user = constant('DB_USER');
		$pass = constant('DB_PASS');

        $conexion = new mysqli($host, $user, $pass, $db);

        /* comprobar la conexión */
        if ($conexion->connect_errno) {
            printf("Falló la conexión: %s\n", $conexion->connect_error);
            exit();
        }

        return $conexion;
    
    }

    /**
     * Metodo que cierra la conexion con Mysqli
     * @param mysqli $conexion - Conexion abierta
     */
    public static function close_conexion($conexion) {

        $conexion->close();
    
    }

}