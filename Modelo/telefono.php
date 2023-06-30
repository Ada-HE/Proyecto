<?php
include_once 'Modelo/clsconexion.php';

class Telefono extends clsconexion{

	
	public function AgregarTel($telefono,$folio )
	{
		$sql = "CALL sp_telefono($telefono, $folio);";
       
		$resultado = $this->conectar->query($sql);
		
		return $resultado;
	}	
}

?>