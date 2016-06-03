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
        <link href="css/metro.css" rel="stylesheet" media="screen">
        <link href="css/metro-schemes.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery.js"></script>
        <script src="js/metro.js"></script>
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
        <div class="corpo">
            <div class="busca">
                <input type="button" value="Buscar" name="verificar" id="submit">
                <input type="text" class="input-control" name="user" id="user" size="60">
            </div>

            <div class="quadro">
                <table class="table striped hovered border bordered" id="tabela">
                    <tbody id="resultado">
                    </tbody>
                </table>
            </div>
            <div id="aviso"></div>
        </div>
    </body>
</html>
