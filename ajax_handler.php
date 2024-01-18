<?php
/**
 * Handler para llamadas AJAX
 * @author Hugo Valdes
 * @version 1.0
 */

use Controlador\CandidatosController;
use Controlador\ComunasController;
use Controlador\RegionesController;
use Controlador\VotacionesController;

require_once("autoload.php");

$headers = apache_request_headers();

// Obtener la acción y el método de la solicitud AJAX
$action = isset($_POST['action']) ? $_POST['action'] : 'index';
$method = isset($_SERVER['REQUEST_METHOD']) ? strtolower($_SERVER['REQUEST_METHOD']) : 'get';
$controller = isset($headers['controller']) ? ucfirst(strtolower($headers['controller'])) : '';

if (!empty($controller)) {

    $instance = null;

    switch (strtolower($controller)) {
        case 'regiones':
            $instance = new RegionesController();
            break;
        case 'comunas':
            $instance = new ComunasController();
            break;
        case 'candidatos':
            $instance = new CandidatosController();
            break;
        case 'votaciones':
            $instance = new VotacionesController();
            break; 
        default:
            http_response_code(404); 
            echo 'Recurso no encontrado';
            break;
    }
    
    if ($instance != null) {
        
        call_user_func(array($instance, $method));
 
    }
    else {
        
        http_response_code(404); 
        echo 'Recurso no encontrado';
    }

}

?>