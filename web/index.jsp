<%-- 
    Document   : index
    Created on : 7 oct 2024, 11:20:44 a.m.
    Author     : israel
--%>
<%@page import="modelo.Empleado" %>
<%@page import="modelo.Puesto" %>
<%@page import="javax.swing.table.DefaultTableModel" %>
<%@page import="java.util.HashMap" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Empleados</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        @keyframes mover {
            0% { transform: translateX(0); }
            100% { transform: translateX(20px); }
            100% { transform: translateX(0); }
        }
        .movimiento {
            animation: mover 1s infinite;
        }
    </style>
    </head>
    <body>
        
        <div class="text-center">
             <div class="container text-center mt-5">
        <h1 class="movimiento">FORMULARIO EMPLEADOS</h1>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
            <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#modal_empleado" onclick="limpiar()">
                AGREGAR EMPLEADO
            </button>
        </div>

        <div class="container">
           <div class="modal fade" id="modal_empleado" tabindex="-1" aria-labelledby="modal_empleado" aria-hidden="true">
        <div class="modal-dialog">
        <div class="modal-content">

          <div class="modal-body">
<form action="sr_empleado" method="post" class="p-4 bg-warning rounded shadow">
    <h4 class="text-center mb-4"><b>Formulario de Empleado</b></h4>

    <div class="mb-3">
        <label for="txt_id" class="form-label"><b>ID</b></label>
        <input type="text" name="txt_id" id="txt_id" class="form-control" value="0" readonly>
    </div>
    
    <div class="mb-3">
        <label for="txt_codigo" class="form-label"><b>Código:</b></label>
        <input type="text" name="txt_codigo" id="txt_codigo" class="form-control" placeholder="Ejemplo: E001" required>
    </div>

    <div class="mb-3">
        <label for="txt_nombres" class="form-label"><b>Nombres:</b></label>
        <input type="text" name="txt_nombres" id="txt_nombres" class="form-control" placeholder="Ejemplo: Juan, María" required>
    </div>

    <div class="mb-3">
        <label for="txt_apellidos" class="form-label"><b>Apellidos:</b></label>
        <input type="text" name="txt_apellidos" id="txt_apellidos" class="form-control" placeholder="Ejemplo: Pérez, Gómez" required>
    </div>

    <div class="mb-3">
        <label for="txt_direccion" class="form-label"><b>Dirección:</b></label>
        <input type="text" name="txt_direccion" id="txt_direccion" class="form-control" placeholder="Ejemplo: Calle Principal 123, Ciudad" required>
    </div>

    <div class="mb-3">
        <label for="txt_telefono" class="form-label"><b>Teléfono:</b></label>
        <input type="number" name="txt_telefono" id="txt_telefono" class="form-control" placeholder="Ejemplo: 123456789" required>
    </div>

    <div class="mb-3">
        <label for="txt_fn" class="form-label"><b>Fecha de Nacimiento:</b></label>
        <input type="date" name="txt_fn" id="txt_fn" class="form-control" required>
    </div>

    <div class="mb-3">
        <label for="drop_puesto" class="form-label"><b>Puesto:</b></label>
        <select name="drop_puesto" id="drop_puesto" class="form-select">
            <%
               Puesto puesto = new Puesto(); 
               HashMap<String,String> drop = puesto.drop_sangre();
               for (String i: drop.keySet()){
                    out.println("<option value='"+i+"'>"+drop.get(i)+"</option>");
                }
            %>    
        </select>
    </div>

    <div class="d-flex justify-content-between">
        <button name="btn_agregar" id="btn_agregar" value="agregar" class="btn btn-dark">Agregar</button>
        <button name="btn_modificar" id="btn_modificar" value="modificar" class="btn btn-success">Modificar</button>
        <button name="btn_eliminar" id="btn_eliminar" value="eliminar" class="btn btn-danger" onclick="javascript:if(!confirm('¿Desea Eliminar?'))return false">Eliminar</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
    </div>
</form>


          </div>
      
    </div>
  </div>
</div>
            
            
<table class="table table-warning table-striped>
    <thead>
        <tr>
<th>CÓDIGO</th>
<th>NOMBRES</th>
<th>APELLIDOS</th>
<th>DIRECCIÓN</th>
<th>TELÉFONO</th>
<th>F. NACIMIENTO</th>
<th>PUESTO</th>
        </tr>
    </thead>
    <tbody id="tbl_empleados">
        <%
            Empleado empleado = new Empleado();
            DefaultTableModel tabla = empleado.leer();
            for (int t = 0; t < tabla.getRowCount(); t++) {
                out.println("<tr data-id='" + tabla.getValueAt(t, 0) + "' data-id_p='" + tabla.getValueAt(t, 8) + "'>");
                out.println("<td>" + tabla.getValueAt(t, 1) + "</td>");
                out.println("<td>" + tabla.getValueAt(t, 2) + "</td>");
                out.println("<td>" + tabla.getValueAt(t, 3) + "</td>");
                out.println("<td>" + tabla.getValueAt(t, 4) + "</td>");
                out.println("<td>" + tabla.getValueAt(t, 5) + "</td>");
                out.println("<td>" + tabla.getValueAt(t, 6) + "</td>");
                out.println("<td>" + tabla.getValueAt(t, 7) + "</td>");
                out.println("</tr>");
            }
        %>
    </tbody>
</table>

<style>
.custom-table {
    background-color: #ffcc80; /* Color anaranjado suave */
}

.custom-table th {
    background-color: #ffab40; /* Color anaranjado más fuerte para el encabezado */
}

.custom-table tbody tr:hover {
    background-color: #ff9800; /* Color anaranjado al pasar el mouse sobre la fila */
}
</style>



        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
        <script type="text/javascript">
            function limpiar (){
                $("#txt_id").val(0);
               $("#txt_codigo").val('');
               $("#txt_nombres").val('');
               $("#txt_apellidos").val('');
               $("#txt_direccion").val('');
               $("#txt_telefono").val('');
               $("#txt_fn").val('');
               $("#drop_puesto").val(1);
            }
            $('#tbl_empleados').on('click','tr td',function(evt){
               var target,id,id_p,codigo,nombres,apellidos,direccion,telefono,nacimiento;
               target = $(evt.target);
               id = target.parent().data('id');
               id_p = target.parent().data('id_p');
               codigo = target.parent("tr").find("td").eq(0).html();
               nombres = target.parent("tr").find("td").eq(1).html();
               apellidos = target.parent("tr").find("td").eq(2).html();
               direccion = target.parent("tr").find("td").eq(3).html();
               telefono = target.parent("tr").find("td").eq(4).html();
               nacimiento = target.parent("tr").find("td").eq(5).html();
               
               $("#txt_id").val(id);
               $("#txt_codigo").val(codigo);
               $("#txt_nombres").val(nombres);
               $("#txt_apellidos").val(apellidos);
               $("#txt_direccion").val(direccion);
               $("#txt_telefono").val(telefono);
               $("#txt_fn").val(nacimiento);
               $("#drop_puesto").val(id_p);
               $("#modal_empleado").modal('show');
               
            });
        </script>
    </body>
</html>
