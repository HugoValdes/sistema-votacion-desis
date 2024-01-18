<?php
/**
 * Clase Controller para Regiones
 * 
 * @author Hugo Valdes
 * @version 1.0
 * 
 */

namespace Controlador;
use Modelo\Region;
use Exception;

class RegionesController implements iController{

    /**
     * Metodo para llamadas GET
     */
    public function get() {

        $region = new Region();

        http_response_code(200);
        echo json_encode($region->get_regiones());

    } 

    /**
     * Metodo para llamadas POST
     */
    public function post() {

        // Establece el codigo de estado HTTP 405 (Method not allowed)
        http_response_code(405); 
        echo 'Metodo no permitido';
    }

}

?>