<?php
/**
 * Interface para Controller
 * 
 * @author Hugo Valdes
 * @version 1.0
 * 
 */


namespace Controlador;

interface iController {
    
    // Metodos HTTP usados por los Controllers
    public function get();
    public function post();
    
}

?>