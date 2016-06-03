<!DOCTYPE html>
<%@page import="Dominio.PreCadastro"%>
<jsp:useBean id="cliente" class="DAO.PreCadastroDAO"/>
<jsp:useBean id="clientes" class="Dominio.PreCadastro"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Atendimento</title>
    <!-- Bootstrap -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="UTF-8">
    <link href="css/style.css" rel="stylesheet" media="screen">
    <link href="css/metro.css" rel="stylesheet">
    <script src="js/jquery.js"></script>
    <link href="css/metro-schemes.min.css" rel="stylesheet" type="text/css"/>
    <script src="js/metro.js"></script>
</head>
<body>
<%@include file="menu-2.html" %>



<div class="container corpo">
    <div class="exibirSenha">
        <c:forEach var='clientes' items="${cliente.consultaPreferencial()}">
            <p class="lista">
                ${clientes.nome}
            </p>
        </c:forEach>
    </div>
</div>

</body>

</html>