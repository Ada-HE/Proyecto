<?php
include_once 'Modelo/clsconexion.php';

class clsProvedores extends clsconexion{

	
	public function AgregarPro($nombre,$ap,$am, $direccion, $telefono )
	{
		$sql = "CALL sp_Iprovedor($nombre,$ap,$am,$direccion,$telefono);";
       
		$resultado = $this->conectar->query($sql);
		
		return $resultado;
	}	
}

?>