<?php
/**
 * Clase Controller para Comunas
 * 
 * @author Hugo Valdes
 * @version 1.0
 * 
 */

namespace Controlador;
use Modelo\Comuna;

class ComunasController implements iController {

    /**
     * Metodo para llamadas GET
     */
    public function get() {
 
        $id_region_param = (isset($_GET["id_region"]) ? (int)$_GET["id_region"] : 0);
  
        $comuna = new Comuna();

        http_response_code(200);
        echo json_encode($comuna->get_comunas($id_region_param));

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