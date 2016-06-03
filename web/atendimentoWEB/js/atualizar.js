$(document).ready(function Att() {
                
                
                $.ajax({             
                    url: '../SenhaController',                    
                    data: 'json',                   
                    success: function(data) {
                        $('#tabelaNormal > tbody tr').remove();
                        $('#tabelaPreferencial > tbody tr').remove();
                        $.each(data.nomeNormal, function (idx, obj) {
                            
                            $('#tabelaNormal > tbody').append("<tr><td>" + obj.nomeNormal + "</td></tr>");
                            
                            
                            
                        });
                        $.each(data.nomePref, function (idx, obj) {
                            $('#tabelaPreferencial > tbody').append("<tr><td>" + obj.nomePref + "</td></tr>");
                        });   
                        
                        setTimeout(Att,1000);
                        
                        
                    }                   
                });               
            });