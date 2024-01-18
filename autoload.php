<?php
/**
 * Autoloader de clases para el sistema
 * @author Hugo Valdes
 * @version 1.0
 */

require_once("../sistema-votacion-desis/config/config.php");

/**
 * Registro de Autoload para las clases del sistema
 */
spl_autoload_register(function ($className) {

    // Reemplaza los separadores de namespace (\) con el separador de directorios (/)
    $class = str_replace('\\', DIRECTORY_SEPARATOR, $className);
    
    // Intenta cargar la clase desde el directorio 'controllers' o 'models'
    $file = __DIR__ . DIRECTORY_SEPARATOR . $class . '.php';
    
    if (file_exists($file)) {
        require_once $file;
    }

}, true, true);
