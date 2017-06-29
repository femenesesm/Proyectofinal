<!DOCTYPE html>
<?php
    include 'constantes.php';
    include PATH.'/lib/Conexion.php';
    include PATH.'/lib/Usuario.php';

?>
<html>
    <head>
        <script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>
        <meta charset="UTF-8">
        <title>Crear Usuario</title>
    </head>
    <body>
        <h2>Crear Usuario</h2>
        <form id="frmusuario" action="controlador/ValidaUsuario.php" method="post">
            <div><label>Usuario:</label><input id="nombreUsuario" type="text" name="nombreUsuario" ></div>
            <div><label>Nombre:</label><input id="nombre" type="text" name="nombre" ></div>
            <div><label>Clave:</label><input id="password" type="password" name="password" ></div>
            <input id="enviar" type="button" onclick="" value="Enviar"> 
            <div id="mensaje"></div>
        </form>
        <?php
        
        /*
            $usu= new Usuario("Sebastian","scalderon","12345");
            $usu->AgregarUsuario();
        */       
            
            
        ?>

    </body>
    <script>
    $(document).ready(function(){
            $("#enviar").click(function(){
        
                if ($("#nombreUsuario").val()!=="" && $("#password").val()!=="" && $("#nombre").val()!==""){
                    ///*$("#frmusuario").submit();
                        $.ajax({url:"controlador/ValidaUsuario.php"
                            ,type:'post'
                            ,data:{'nombreUsuario':$("#nombreUsuario").val(),
                                'password':$("#password").val(),
                                'nombre':$("#nombre").val()
                                }
                            ,success:function(resultado){
                                $("#mensaje").html(resultado);
                            }
                        });
                    }
                else
                    alert("Debe Agregar el usuario y clave");
            });
     });
     </script>
</html>
