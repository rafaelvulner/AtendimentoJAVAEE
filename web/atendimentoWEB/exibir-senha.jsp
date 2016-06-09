<%-- 
    Document   : exibir-senha
    Created on : 01/05/2016, 19:37:24
    Author     : Rafael Monteiro
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>   
        <link href="css/painel.css" rel="stylesheet" type="text/css"/>
        
        <script src="js/jquery.js" type="text/javascript"></script>
        <script src="js/horaData.js" type="text/javascript"></script>
        <title>Painel de senha</title>
        <script type="text/javascript">
            jQuery(window).load(function ($) {
                atualizaRelogio();
            });
        </script>
        <script>
            $(document).ready(function senha() {

                
                $.ajax({
                    url: '../SenhaController',
                    data: 'json',
                    success: function (data) {
                        $('#tabela > tbody tr').remove();
                        $.each(data, function (idx, obj) {

                            if (obj.senha === 0) {
                                $('#tabela > tbody').append('<tr><td>' + obj.nome + '</td><td>Normal</td><td>' + obj.hora + '</td></tr>');
                                
                            } else {
                                $('#tabela > tbody').append('<tr><td>' + obj.nome + '</td><td>Preferencial</td><td>' + obj.hora + '</td></tr>');
                            }
                            
                        });
                        
                    }
                });
                 setTimeout(senha,2000);
            });
       
        </script>
    </head>
    <body>
        <div class="container">
            <div class="corpo">

                <div class="sejabemvindo img-rounded">
                    <div class="text-center ">
                        Seja bem vindo!
                    </div>
                    <div class="text-right">
                        <output id="data" style="color: white"></output>
                    </div>
                    <div class="text-right">
                        <output id="hora" style="color: white"></output>				
                    </div>			
                </div>


                <div class="row col-md-6">


                    <div class="row col-md-11 senha img-rounded text-center">
                        <h3>Senha</h3>
                        <p id="senha">009</p>
                    </div>

                    <div class="row col-md-11 guiche img-rounded text-center">
                        <h3>Guichê</h3>
                        4
                    </div>
                </div>

                <div class="row col-md-6 historico text-center img-rounded">
                    <div>
                        <h3>Historico de chamadas</h3>
                        <table class="table" id="tabela">
                            <thead>
                                <tr>
                                    <td>Nome</td>
                                    <td>Tipo</td>
                                    <td>Hora</td>
                                </tr>
                            </thead>
                            <tbody>

                            </tbody>
                        </table>
                    </div>

                </div>

            </div>
        </div>
    </body>
</html>


