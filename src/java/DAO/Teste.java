/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Dominio.Cliente;
import Dominio.PreCadastro;
import com.google.gson.Gson;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;


/**
 *
 * @author DTI05
 */
public class Teste {
    public static void main(String[] args) throws Exception {
        
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        Date hora = new Date();
        String data = sdf.format(hora);
        System.out.println(data);
        
        
//        PreCadastroDAO dao = new PreCadastroDAO();
//        Gson gson = new Gson();
//        List<PreCadastro> preLista = new ArrayList();
//        
//        for (PreCadastro pre : dao.consultaGeral()) {
//            preLista.add(pre);
//        }
//        
//        String teste = gson.toJson(preLista);
//        System.out.println(teste);
        
    }
}
