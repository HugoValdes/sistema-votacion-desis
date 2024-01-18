<?php
/**
 * Clase Model Votaciones 
 * 
 * @author Hugo Valdes
 * @version 1.0
 * 
 */

namespace Modelo;
use Exception;

class Votacion extends BaseModel {

    const ESTADO_GRABADO = 1;
    const ESTADO_RUT_REPETIDO = 2;
    const ESTADO_ERROR = 3;

    // Propiedades de la clase
    public $id_votacion; 	
	public $nombre_apellido;
	public $alias;	
	public $rut;
	public $email;	
	public $id_comuna;	
	public $id_candidato;	
	public $entero_web;	
	public $entero_tv;
	public $entero_redes_sociales;	
	public $entero_amigo;

    public function __construct($arrParams) {
        
        $this->id_votacion = $arrParams["id_votacion"]; 	
        $this->nombre_apellido = $arrParams["nombre_apellido"];
        $this->alias = $arrParams["alias"];	
        $this->rut = $arrParams["rut"];
        $this->email = $arrParams["email"];	
        $this->id_comuna = $arrParams["id_comuna"];	
        $this->id_candidato = $arrParams["id_candidato"];	
        $this->entero_web = $arrParams["entero_web"];	
        $this->entero_tv = $arrParams["entero_tv"];
        $this->entero_redes_sociales = $arrParams["entero_redes_sociales"];	
        $this->entero_amigo = $arrParams["entero_amigo"];

    }

     /**
     * Metodo para consultar las regiones segun filtros
     * @param string $num_rut - RUT del votante
     * @return array Array de objetos Votacion
    */
    function get_votacion($num_rut = "") {

        try {
            
            $arr_result = array();

            $consulta = "SELECT 
                                    votaciones.* 
                                FROM 
                                    votaciones 
                                WHERE 1=1" .
                                (!empty($num_rut) ? " AND rut LIKE ? " : "");

            if ($stmt = $this->get_conexion()->prepare($consulta)) {

                 // Bind params opcionales
                 if (!empty($num_rut))
                    $stmt->bind_param("s", $num_rut);

                // Ejecutar statement
                $stmt->execute();
            
                $result = $stmt->get_result();
                
                while ($data_votaciones = $result->fetch_assoc())
                {
                    
                    $arr_result[] = new Votacion($data_votaciones);

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

    /**
     * Metodo que graba una Votacion validando duplicidad de RUT
     * @return array Array asociativo con Estado y Mensaje de resultado
     */
    public function saveVotacion() {

        try {

            // Busqueda por RUT
            $arr_votante = $this->get_votacion($this->rut);

            if (count($arr_votante) > 0)
                return array("estado" => $this::ESTADO_RUT_REPETIDO, "mensaje" => "El RUT indicado ya ha realizado una votaci&oacute;n");

            // Preparar
            $consulta = "INSERT INTO votaciones";
            $consulta .= " (nombre_apellido, alias, rut, email, id_comuna, id_candidato, entero_web, entero_tv, entero_redes_sociales, entero_amigo)";
            $consulta .= " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ";

            if ($stmt = $this->get_conexion()->prepare($consulta)) {

                // Bind params 
                $stmt->bind_param(
                    "ssssiiiiii", 
                    $this->nombre_apellido, 
                    $this->alias, 
                    $this->rut, 
                    $this->email,
                    $this->id_comuna,
                    $this->id_candidato,
                    $this->entero_web,
                    $this->entero_tv,
                    $this->entero_redes_sociales,
                    $this->entero_amigo
                );

                // Ejecutar statement
                if ($stmt->execute())
                    return array("estado" => $this::ESTADO_GRABADO, "mensaje" => "Votaci&oacute;n realizada correctamente");
                
            }

            return array("estado" => $this::ESTADO_ERROR, "mensaje" => "Algo ha salido mal, sentimos los inconvenientes");
            
        } catch (Exception $e) {

            return array("estado" => $this::ESTADO_ERROR, "mensaje" => "Algo ha salido mal, sentimos los inconvenientes");

        }

    }
    
}

?>