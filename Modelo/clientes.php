<?php
include_once 'Modelo/clsconexion.php';

class clsClientes extends clsconexion{

	
	public function AgregarUsu($nombre,$ap,$am, $telefono, $direccion)
	{
		$sql = "CALL sp_Icliente($nombre,$ap,$am,$telefono,$direccion);";
       
		$resultado = $this->conectar->query($sql);
		
		return $resultado;
	}	
}

?>