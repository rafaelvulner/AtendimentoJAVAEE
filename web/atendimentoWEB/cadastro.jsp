
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta charset="UTF-8">
        <link href="css/style.css" rel="stylesheet" media="screen">
        <link href="css/metro.css" rel="stylesheet">
        <script src="js/jquery.js"></script>
        <script src="js/metro.js"></script>
        <link href="css/metro-schemes.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/js.js"></script>
        <script src="js/jquery.mask.js" type="text/javascript"></script>
        
        <script>
            $(document).ready(function(){
                $('#rg').mask("99999999-9");
                $('#cpf').mask("999.999.999-99");
                $('#telefone').mask("(99)9999-9999");
            });
        </script>
        
        <script language="JavaScript" type="text/javascript">
            function InserirData() {
                var d = new Date();
                var monthname = new Array("01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12");
                var TODAY = d.getDate() + "/" + monthname[d.getMonth()] + "/" + d.getFullYear();
                form1.data.value = TODAY;
            }
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
                            $('#resultado').html(data).fadeIn().delay(1000).fadeOut();
                            if (data!=="Existem campos vazios favor preencher!") {
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
<body onload="return InserirData();">
    <%@include file="menu-2.html" %>

    <div class="grid corpo">

        <%@include file="chamar-senha.html" %>

        <div class="telaCadastro ">

            <form name="form1" action="" method="post" id="form">

                <div class="campos ">
                    <label for="nome">
                        <p class="corLetras">Nome</p><br><input class="input-control text full-size" type="text" name="nome" id="nome">
                    </label>

                    <label for="rua">
                        <p class="corLetras">Rua</p><br><input class="input-control text full-size" type="text" name="rua" id="rua" placeholder="Exemplo: Rua José Carlos Almeida 567">
                    </label>
                    <br>

                    <label for="bairro">
                        <p class="corLetras">Bairro</p><br><input class="input-control text full-size" type="text" name="bairro" id="bairro">
                    </label>

                    <label for="cidade">
                        <p class="corLetras">Cidade</p><br><input class="input-control text full-size" type="text" name="cidade" id="cidade">
                    </label>

                    <label for="rg">
                        <p class="corLetras">RG</p><br><input class="input-control text" type="text" name="rg" id="rg">
                    </label>

                    <label for="cpf">
                        <p class="corLetras">CPF</p><br><input class="input-control col-xs-12" type="text" name="cpf" id="cpf" required="">
                    </label>

                    <label for="telefone">
                        <p class="corLetras">Telefone</p><br><input class="input-control col-xs-12" type="text" name="telefone" id="telefone" maxlength="15" required="">
                    </label>

                    <label for="data" id="data">
                        <p class="corLetras"></p><br><input class="input-control col-xs-12" type="hidden" name="data" id="data" value="" readonly="">
                    </label><br>

                    <input class="button" type="button" value="Cadastrar" id="submit">
                    <div id="resultado"></div>
                </div>

            </form>
        </div>
    </div>

</body>
</html>