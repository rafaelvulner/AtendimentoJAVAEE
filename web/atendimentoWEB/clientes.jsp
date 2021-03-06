<%-- 
    Document   : clientes
    Created on : 30/04/2016, 21:12:17
    Author     : Rafael Monteiro
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/style.css" rel="stylesheet" media="screen">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.js" type="text/javascript"></script>
        <script>
            $(document).ready(function () {
                /**
                 * 
                 * @param Excluir cadastro do cliente
                 * @param {type} obj
                 * @returns {undefined}
                 */
                $('#delet').click(function (e) {
                    
                    if (confirm('Deseja excluir?')) {
                        $.get('../ExcluirCadastroController', {id:${param.Id}}, function (responseText) {
                            alert('Cadastro excluido com sucesso!');
                            $(location).attr('href','consulta.jsp');
                        });
                    } else {
                        e.default;
                    }
                    
                });

                /**
                 * 
                 * @param Método para buscar todo cliente com esse ID
                 * @param {type} obj
                 * @returns {undefined}                 */
                $.getJSON('../BuscarClienteController', {id:${param.Id}}, function (resposta) {
                    $.each(resposta.nome, function (idx, obj) {
                        $('#nomes').ready().append("<td>" + obj.nome + "</td>");
                        $('#nomes').ready().append("<td>" + obj.rua + "</td>");
                        $('#nomes').ready().append("<td>" + obj.bairro + "</td>");
                        $('#nomes').ready().append("<td>" + obj.cidade + "</td>");
                        $('#nomes').ready().append("<td>" + obj.rg + "</td>");
                        $('#nomes').ready().append("<td>" + obj.cpf + "</td>");
                        $('#nomes').ready().append("<td>" + obj.telefone + "</td>");
                        $('#nomes').ready().append("<td>" + obj.data + "</td>");
                    });
                });



            });
        </script>
        <title>Cadastro de clientes</title>
    </head>
    <body>
        <%@include file="menu-2.html" %>
        <div class="corpo">
            <table class="table table-bordered table-responsive">
                <thead>
                    <tr>
                        <th>Nome</th>
                        <th>Rua</th>
                        <th>Bairro</th>
                        <th>Cidade</th>
                        <th>Rg</th>
                        <th>CPF</th>
                        <th>Telefone</th>
                        <th>Data de cadastro</th>
                    </tr>
                </thead>
                <tbody>
                    <tr id="nomes">

                    </tr>
                </tbody>

            </table>
            <a href="consulta.jsp"><input type="button" value="Voltar" class="btn btn-primary"></a>
            <a href="alterar.jsp?Id=${param.Id}"><input type="button" value="Alterar dados" class="btn btn-primary"></a>
            
            <input type="button" value="Excluir" id="delet" class="btn btn-danger"></input>
            <div id="resultado"></div>
        </div>
        
    </body>
</html>
