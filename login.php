<form class="form" action="/SistemaProductos/index?clase=controladorfabricante&metodo=insertarproductos" method="POST">
    <h2>Fabricante</h2>
    <div class="form-group">
      <label for="nombre">Nombre:</label>
      <input type="text" id="nombre" name="txtnombre" required>
    </div>
    <div class="form-group">
      <label for="telefono">Teléfono:</label>
      <input type="text" id="telefono" name="txttelefono" required>
    </div>
    <div class="form-group">
      <label for="email">Email:</label>
      <input type="email" id="email" name="txtemail" required>
    </div>
    
    <div class="form-group">
      <button type="submit">Guardar</button>
    </div>
  </form>

<br></br>
<div class="table-container">
  <table class="centered-table">
    <thead>
      <tr>
        <th>Código Fabricante</th>
        <th>Nombre</th>
        <th>Teléfono</th>
        <th>Email</th>
        <th>Acción</th>
      </tr>
    </thead>
    <tbody>
    
      <?php
            while ($fab= $Consulta->fetch_object()) {
              echo '<form class="form" action="/SistemaProductos/index?clase=controladorfabricante&metodo=ActualizarXEliminar" method="POST">';
                echo '<tr>';
                echo '<td> <input type="text" name="txtcodigo_fab" value="'.$fab->codigo_fab.'" readonly> </td>';
                echo '<td> <input type="text" name="txtnombre" value="'.$fab->Nombre.'" ></td>';
                echo '<td> <input type="text" name="txttelefono" value="'.$fab->Telefono.'" ></td>';
                echo '<td> <input type="text" name="txtemail" value="'.$fab->Email.'" ></td>';
                echo '<td width=250>';
                echo '<button type="submit" name="btnActualizar" value="btnActualizar" class="submit-button" >Actualizar</button>';
                echo '&nbsp;';
                echo '<button type="submit" name="btnEliminar" value="btnEliminar" class="submit-button">Eliminar</button>';
                echo '</td>';
                echo '</tr>';
                
                echo '</form>';
            }
      
      ?>
    
    </tbody>
  </table>