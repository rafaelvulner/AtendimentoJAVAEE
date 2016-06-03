/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DAO.PreCadastroDAO;
import Dominio.PreCadastro;
import com.google.gson.Gson;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.json.simple.JSONObject;

/**
 *
 * @author DTI05
 */
@WebServlet(name = "gerarSenha", urlPatterns = {"/gerarSenha"})
public class GerarSenhaController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        
        //Cabeçalho das aplicações
        response.setContentType("text/html;charset=UTF-8");
        
        //Instancia do horario para inserir no banco
        SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
        Date hora = Calendar.getInstance().getTime();
        
       
        
        //Faz a captura das informações trazidas via form
        String nome = request.getParameter("user");
        String senha = request.getParameter("senha");
        String horaCerta = sdf.format(hora);
        int numero=1;
        
        //Faz instancia do dominio pre cadastro
        PreCadastro precadastro = new PreCadastro();
        //Faz a instancia do DAO
        PreCadastroDAO dao = new PreCadastroDAO();

        //Verficicar se os campos foram todos preenchidos
        if (nome.isEmpty() || senha.isEmpty()) {
            
            response.getWriter().write("<h1>Digite um nome</h1>");
            return;
        }

        try {
            
            int number = Integer.parseInt(senha);
            precadastro.setNome(nome);
            precadastro.setSenha(number);
            precadastro.setHora(horaCerta);
            dao.inserir(precadastro);
            response.getWriter().write("<h1>Cadastro efetuado com sucesso</h1>");
            
            
        
        } catch (SQLException e) {
            response.getWriter().write("<h1>Erro ao inserir no banco</h1>");
        }
        

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(GerarSenhaController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(GerarSenhaController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
