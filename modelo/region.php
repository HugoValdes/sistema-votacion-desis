<?php
/**
 * Clase Model Regiones 
 * 
 * @author Hugo Valdes
 * @version 1.0
 * 
 */

namespace Modelo;
use Exception;

class Region extends BaseModel
{
    // Propiedades de la clase
    public $id_region;
    public $region;

    /**
     * Constructor para la clase Comuna
     * @param int $id_comuna - ID de la Comuna
     * @param Region $region - Objeto Region relacionado
     * @param string $comuna - Nombre de la comuna
     */
    public function __construct($id_region = 0, $region = "") {
        
        $this->id_region = $id_region;
        $this->region = $region;
    
    }

    /**
     * Metodo para consultar las Regiones
     */
    function get_regiones() {

        try {
            
            $arr_result = array();

            $consulta = "SELECT regiones.* FROM regiones";

            if ($stmt = $this->get_conexion()->prepare($consulta)) {

                // Ejecutar statement
                $stmt->execute();
            
                $result = $stmt->get_result();
                
                while ($data_region = $result->fetch_assoc())
                {
                    $arr_result[] = new Region($data_region["id_region"], $data_region["region"]);
                }

                
            }

            return $arr_result;

        } catch (Exception $e) {

            throw new Exception($e->getMessage());
        }
        finally {
            
            /* close statement */
            $this->get_conexion()->close();
            
        }

    }

} 

?>