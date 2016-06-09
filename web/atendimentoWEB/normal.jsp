<!DOCTYPE html>
<%@page import="Dominio.PreCadastro"%>
<jsp:useBean id="cliente" class="DAO.PreCadastroDAO"/>
<jsp:useBean id="clientes" class="Dominio.PreCadastro"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="UTF-8">
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
    <link href="css/style.css" rel="stylesheet" media="screen">
   
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.js" type="text/javascript"></script>
    <title>Normal</title>
</head>
<body>
<%@include file="menu-2.html" %>




<div class="container corpo">
    <div class="exibirSenha">
        <table class="table table-bordered">
                <thead>
                    <tr>
                <th>Nome</th>
                <th>Data</th>
                <th>Horas</th>
                </tr>
                </thead>
                <tbody>
        <c:forEach var='clientes' items="${cliente.consultaNormal()}">
            <tr>
                <td>${clientes.nome}</td>
                <td>${clientes.data}</td>
                <td>${clientes.hora}</td>
            </tr>
        </c:forEach>
                    </tbody>
                </table>
    </div>
</div>

</body>

</html>