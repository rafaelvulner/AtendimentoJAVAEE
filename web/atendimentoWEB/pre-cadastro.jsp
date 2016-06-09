<%-- 
    Document   : pre-cadastro
    Created on : 26/05/2016, 20:49:41
    Author     : Rafael Monteiro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery.js" type="text/javascript"></script>
        <script src="js/bootstrap.js" type="text/javascript"></script>
        <title>Triagem</title>
    </head>
    <script>
        $(document).ready(function() {
            $('#submit').click(function (){
                var nome = $('#name').val();
                var senha = $('input:radio[name=senha]:checked').val();
               $.ajax({
                  url: '../gerarSenha',
                  data: 'user='+nome+'&senha='+senha,
                  method: 'post',
                  success: function (data){
                      $('#name').val('');
                      $('#resultado').html(data).fadeIn().delay(1000).fadeOut();
                  }
               });
            });
            
        });
    </script>
    <body>
        <%@include file="menu-2.html" %>
        <div class="grid corpo">
           
                <div class="preCad">

                   
                    <div class="form-group">
                    <input type="text" class="form-control" name="nome"id="name">
                    </div>
                    <button id="submit" class="btn btn-default">Gerar senha</button>
                    
                        
                    

                    <label class="corLetras">
                        <input type="radio" name="senha" class="toolbar-group-radio" value="0">Normal
                    </label>

                    <label class="questoes corLetras">
                        <input type="radio" name="senha" class="toolbar-group-radio" value="1">Preferencial
                    </label>
                      
                    
                    
                </div>
            <div id="resultado" class="resultado"><h1></h1></div>
                
            
                
                
          
        </div>

    </body>
    </body>
</html>
