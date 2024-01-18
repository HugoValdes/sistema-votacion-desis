<?php
/**
 * Clase Model Candidato 
 * 
 * @author Hugo Valdes
 * @version 1.0
 * 
 */

namespace Modelo;
use Exception;

class Candidato extends BaseModel
{
    // Propiedades de la clase
    public $id_candidato;
    public $candidato;

    /**
     * Constructor para la clase Comuna
     * @param int $id - ID del Candidato
     * @param string $comuna - Nombre del Candidato
     */
    public function __construct($id_candidato = 0, $candidato = "") {

        $this->id_candidato = $id_candidato;
        $this->candidato = $candidato;
    
    }

    /**
     * Metodo para consultar los Candidatos
     */
    function get_candidatos() {

        try {

            $stmt = null;
            
            $arr_result = array();

            $consulta = "SELECT 
                                    candidatos.* 
                                FROM 
                                    candidatos
                                WHERE 
                                    1=1
                                ORDER BY
                                    candidatos.candidato ASC";

            if ($stmt = $this->get_conexion()->prepare($consulta)) {

                // /* bind parameters for markers */
            
                // Ejecutar statement
                $stmt->execute();
            
                $result = $stmt->get_result();

                while ($data_candidato = $result->fetch_assoc())
                {
                    $arr_result[] = new Candidato($data_candidato["id_candidato"], $data_candidato["candidato"]);
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