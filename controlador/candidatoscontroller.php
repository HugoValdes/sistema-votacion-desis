<?php
/**
 * Clase Controller para Votaciones
 * 
 * @author Hugo Valdes
 * @version 1.0
 * 
 */

namespace Controlador;
use Modelo\Candidato;

class CandidatosController implements iController {

    /**
     * Metodo para llamadas GET
     */
    public function get() {

        $candidato = new Candidato();

        http_response_code(200); 
        echo json_encode($candidato->get_candidatos());

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