<?php
/**
 * Clase Model Comuna 
 * 
 * @author Hugo Valdes
 * @version 1.0
 * 
 */

namespace Modelo;
use Exception;

class Comuna extends BaseModel
{
    // Propiedades de la clase
    public $id_comuna;
    public $comuna;

    /**
     * Constructor para la clase Comuna
     * @param int $id_comuna - ID de la Comuna
     * @param Region $region - Objeto Region relacionado
     * @param string $comuna - Nombre de la comuna
     */
    public function __construct($id_comuna = 0, $comuna = "") {
        
        $this->id_comuna = $id_comuna;
        $this->comuna = $comuna;
    
    }

    /**
     * Metodo para consultar las comunas segun filtros
     *  @param int $id_region - ID de la Region
     */
    function get_comunas($id_region = 0) {

        try {
            
            $arr_result = array();

            $consulta = "SELECT 
                            comunas.*
                        FROM 
                            comunas 
                        WHERE 
                            1=1 " .
                            ($id_region > 0 ? " AND comunas.id_region = ?" : "") .
                        " ORDER BY 
                            comunas.comuna ASC";

            if ($stmt = $this->get_conexion()->prepare($consulta)) {
              
                // Bind params opcionales
                if ($id_region > 0)
                    $stmt->bind_param("i", $id_region);
                
                // Ejecutar statement
                $stmt->execute();

                // Get y Fetch resultados
                $result = $stmt->get_result();

                while ($data_comuna = $result->fetch_assoc())
                {
                    $arr_result[] = new Comuna($data_comuna["id_comuna"], $data_comuna["comuna"]);
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