<%-- 
    Document   : consulta
    Created on : 20/04/2016, 17:17:00
    Author     : Rafael Monteiro
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta charset="UTF-8">
        <link href="css/style.css" rel="stylesheet" media="screen">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.js" type="text/javascript"></script>
        <script>
            $(document).ready(function () {
                $('#submit').click(function (event) {
                    var username = $('#user').val();
                    if (username === "") {
                        $('#aviso').html("<h1>Digite um nome por favor!</h1>").fadeIn().delay(2000).fadeOut();
                    } else {
                        $.get('../BuscarCadastro', {user: username}, function (responseText) {
                            $('#resultado').html(responseText);
                        });
                    }
                });

            });
        </script>
        <title>Consulta</title>
    </head>
    <body>
        <%@include file="menu-2.html"%>
        <div class="container">
            <div class="col-md-6 busca">
               
                <div class="col-md-2">
                    <input type="button" class="btn btn-primary" value="Buscar" name="verificar" id="submit">
                </div>

                <div class="form-group col-md-8">
                    <input type="text" class="form-control" name="user" id="user">
                </div>


                <div class="quadro">
                    <table class="table table-striped" id="tabela">
                        <tbody id="resultado">
                        </tbody>
                    </table>
                </div>
                <div id="aviso"></div>
            </div>
        </div>
    </body>
</html>
