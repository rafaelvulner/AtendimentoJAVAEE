<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta charset="UTF-8">
        <link href="css/style.css" rel="stylesheet" media="screen">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.js" type="text/javascript"></script>
        <title>Atendimento WEB</title>
    </head>
    <body>
        <%@include file="menu-2.html" %>


        <div class="container col-md-12">

            <div class="row text-center">
                <h3>Menu rápido</h3>

                <div class="col-sm-3 indexCirculo">
                    <a href="cadastro.jsp" class=""><img src="img/cadastro.png" class="img-responsive imgIndex img-rounded indexImagen" alt="Image"></a>
                    <p>Cadastrar usuario</p>
                </div>
                
                <div class="col-sm-3 indexCirculo">
                    <a href="consulta.jsp"><img src="img/consulta.png" class="img-responsive img-rounded indexImagen imgIndex" alt="Image"></a>
                    <p>Acessar cadastro</p>
                </div>

                           
                <div class="col-sm-3 indexCirculo">
                    <a href="pre-cadastro.jsp"><img src="img/gerarsenha.png" class="img-responsive img-rounded indexImagen imgIndex" alt="Image"></a>
                    <p>Gerar senha</p>
                </div>
                
                <div class="col-sm-3 indexCirculo">
                    <a href="exibir-senha.jsp" target="_blank"><img src="img/painel.png" class="img-responsive img-rounded indexImagen imgIndex" alt="Image"></a>
                    <p>Acessar painel de senhas</p>
                </div>  






            </div>
        </div>
    </body>

</html>