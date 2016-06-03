<%-- 
    Document   : alterar
    Created on : 05/05/2016, 10:58:45
    Author     : DTI05
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/metro-schemes.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/metro.css" rel="stylesheet" type="text/css"/>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link href="css/metro-rtl.css" rel="stylesheet" type="text/css"/>
        <link href="css/metro-responsive.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery.js" type="text/javascript"></script>
        <link href="css/metro-responsive.css" rel="stylesheet" type="text/css"/>
        <script src="js/metro.js" type="text/javascript"></script>
        <script src="js/js.js" type="text/javascript"></script>
        <script>
            $(document).ready(function () {
                $.getJSON('../BuscarClienteController', {id:${param.Id}}, function (resposta) {
                    $.each(resposta.nome, function (idx, obj) {
                        $('#id').val(obj.id);
                        $('#nome').val(obj.nome);
                        $('#rua').val(obj.rua);
                        $('#bairro').val(obj.bairro);
                        $('#cidade').val(obj.cidade);
                        $('#rg').val(obj.rg);
                        $('#cpf').val(obj.cpf);
                        $('#telefone').val(obj.telefone);
                        $('#data').val(obj.data);
                    });
                });

                var form = $('#form');
                $('#submit').click(function (event) {
                    $.ajax({
                        url: '../UpdateController',
                        data: form.serialize(),
                        type: 'post',
                        success: function (data) {
                            $('#resultado').html(data).fadeIn().delay(1000).fadeOut();
                        }
                    });
                });
            });
        </script>
        <title>Alteração cadastral</title>
    </head>
    <body>
        <header>
            <%@include file="menu-2.html" %>
        </header>
        <div class="grid tabelAlterar">

            <div class=" row">
                <table class="table striped hovered cell-hovered border bordered">
                    <form id="form">
                        <tr>
                            <td>Nome</td>
                            <td> <input type="text" value="" id="nome" name="nome" class="input-control  text full-size"></td
                        </tr>
                        <tr>
                            <td>Rua</td>
                            <td><input type="text" value="" id="rua" name="rua" class="input-control text full-size"></td>
                        </tr>
                        <tr>
                            <td>Bairro</td>
                            <td><input type="text" value="" id="bairro" name="bairro" class="input-control text full-size"></td>
                        </tr>
                        <tr>
                            <td>Cidade</td>
                            <td><input type="text" value="" id="cidade" name="cidade" class="input-control text full-size"></td>
                        </tr>
                        <tr>
                            <td>RG</td>
                            <td><input type="text" value="" id="rg" name="rg" class="input-control text full-size"></td>
                        </tr>
                        <tr>
                            <td>CPF</td>
                            <td><input type="text" value="" id="cpf" name="cpf" class="input-control text full-size"></td>
                        </tr>
                        <tr>
                            <td>Telefone</td>
                            <td><input type="text" value="" id="telefone" name="telefone" class="input-control text full-size"></td>
                        </tr>
                        <tr>
                            <td>Data</td>
                            <td><input type="text" value="" id="data" name="data" class="input-control text full-size"></td>
                        </tr>
                        <!--Leva o ID até o controler para fazer update-->
                        <input type="hidden" value="" id="id" name="id">
                    </form>
                </table>
                
                    <button class="button" id="submit">Atualizar</button>
                    <a href="clientes.jsp?Id=${param.Id}"><button class="button">Voltar</button></a>
                


            </div>
            <div id="resultado"></div>
        </div>
    </body>
</html>
