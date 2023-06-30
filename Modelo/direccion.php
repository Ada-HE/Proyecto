<?php
include_once 'Modelo/clsconexion.php';

class Direccion extends clsconexion{

	
	public function AgregarDirec($domicilio,$colonia,$calle )
	{
		$sql = "CALL sp_Idireccion($domicilio,$colonia,$calle);";
       
		$resultado = $this->conectar->query($sql);
        
		
		return $resultado;
	}	
}

?>