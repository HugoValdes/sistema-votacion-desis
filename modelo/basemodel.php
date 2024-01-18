<?php
/**
 * Clase base para modelos 
 * 
 * @author Hugo Valdes
 * @version 1.0
 * 
 */

namespace Modelo;
use DB;

class BaseModel {

    private $conexion;
 
    /**
     * Metodo para obtener conexion a BD
     */
    function get_conexion() {
        $this->conexion = db\DB::open_conexion();
        return $this->conexion;
    }

}

?>