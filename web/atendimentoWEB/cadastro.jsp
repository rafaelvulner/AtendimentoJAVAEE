
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta charset="UTF-8">
        <link href="css/style.css" rel="stylesheet" media="screen">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery.js"></script>
        <script src="js/jquery.mask.js" type="text/javascript"></script>
        <script src="js/bootstrap.js" type="text/javascript"></script>
        <script>
            $(document).ready(function () {
                $('#rg').mask("99999999-9");
                $('#cpf').mask("999.999.999-99");
                $('#telefone').mask("(99)9999-9999");
            });
        </script>

        <script>
            $(document).ready(function () {
                var form = $('#form');
                $('#submit').click(function (event) {
                    $.ajax({
                        url: '../CadastroController',
                        data: form.serialize(),
                        type: 'post',
                        success: function (data) {
                          
                                $('#resposta').html(data).fadeIn().delay(3000).fadeOut();
                       
                            if (data !== "Existem campos vazios favor preencher!") {
                                $('#form')[0].reset();
                            }

                        }
                    });


                });
            });
        </script>

    </script>
    <title>Cadastro</title>
</head>
<body>
    <%@include file="menu-2.html" %>

    <div class="container">



        <div class="telaCadastro col-md-4 ">

            <form id="form" method="post">

                <div class="form-group">
                    <label for="nome"><p class="corLetras">Nome</p></label>
                    <input class="form-control" type="text" name="nome" id="nome">
                </div>

                <div class="form-group">
                    <label for="rua"><p class="corLetras">Rua</p></label>
                    <input class="form-control" type="text" name="rua" id="rua" placeholder="Exemplo: Rua José Carlos Almeida 567">
                </div>


                <div class="form-group">
                    <label for="bairro"><p class="corLetras">Bairro</p></label>
                    <input class="form-control" type="text" name="bairro" id="bairro">
                </div>

                <div class="form-group">
                <label for="cidade"><p class="corLetras">Cidade</p></label>
                <input class="form-control" type="text" name="cidade" id="cidade">
                </div>
                
                <div class="form-group">
                <label for="rg"><p class="corLetras">RG</p></label>
                <input class="form-control" type="text" name="rg" id="rg">
                </div>
                
                <div class="form-group">
                <label for="cpf"><p class="corLetras">CPF</p></label>
                <input class="form-control" type="text" name="cpf" id="cpf">
                </div>
                
                <div class="form-group">
                <label for="telefone"><p class="corLetras">Telefone</p></label>
                <input class="form-control" type="text" name="telefone" id="telefone">
                </div>
                <input type="button" class="btn btn-default" id="submit" value="Cadastrar">
                
        </div>
        
        <div class="col-md-4 alert-success aviso" id="resposta" role="alert"></div>
    </form>
            
            
            
</div>
</div>

</body>
</html>