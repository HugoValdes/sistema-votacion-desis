<?php
/**
 * Clase Controller para Votaciones
 * 
 * @author Hugo Valdes
 * @version 1.0
 * 
 */

namespace Controlador;

use Modelo\Votacion;
use Modelo\Votaciones;

class VotacionesController implements iController {

    /**
     * Metodo para llamadas GET
     */
    public function get() {

        // Establece el codigo de estado HTTP 405 (Method not allowed)
        http_response_code(405); 
        echo 'Metodo no permitido';

    } 

    /**
     * Metodo para llamadas POST
     */
    public function post() {

        $arrParamVotacion = array(
            "id_votacion" => 0,
            "nombre_apellido" => isset($_POST["txtNombreApellido"]) ? $_POST["txtNombreApellido"] : "",
            "alias" =>  isset($_POST["txtAlias"]) ? $_POST["txtAlias"] : "",
            "rut" =>  isset($_POST["txtRut"]) ? $_POST["txtRut"] : "",
            "email" =>  isset($_POST["txtEmail"]) ? $_POST["txtEmail"] : "", 
            "id_region" =>  isset($_POST["cboRegion"]) ? (int)$_POST["cboRegion"] : 0, 
            "id_comuna" => isset($_POST["cboComuna"]) ? (int)$_POST["cboComuna"] : 0, 
            "id_candidato" =>  isset($_POST["cboCandidato"]) ? (int)$_POST["cboCandidato"] : 0, 
            "entero_web" =>  isset($_POST["chkEntero_Web"]) ? 1 : 0,
            "entero_tv" => isset($_POST["chkEntero_TV"]) ? 1 : 0,
            "entero_redes_sociales" => isset($_POST["chkEntero_RedesSociales"]) ? 1 : 0,
            "entero_amigo" => isset($_POST["chkEntero_Amigo"]) ? 1 : 0

        );

        $votacion = new Votacion($arrParamVotacion);
        $result = $votacion->saveVotacion();

        http_response_code(200);
        
        echo json_encode($result);

    }

}
