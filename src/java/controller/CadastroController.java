/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.ClienteDAO;
import Dominio.Cliente;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import static java.time.Clock.system;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author DTI05
 */
@WebServlet(name = "cadastro", urlPatterns = {"/CadastroController"})
public class CadastroController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.sql.SQLException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        
        //Instancia a hora e data atual
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        Date hora = new Date();
        String data = sdf.format(hora);
       
        try{
            //Tenta buscar todas informações do formulário
            String nome = request.getParameter("nome");
            String rua = request.getParameter("rua");
            String bairro = request.getParameter("bairro");
            String cidade = request.getParameter("cidade");
            String rg = request.getParameter("rg");
            String cpf = request.getParameter("cpf");
            String telefone = request.getParameter("telefone");
            
            
            Cliente cli = new Cliente();
            ClienteDAO inserir = new ClienteDAO();
            
            //Validação de campo do lado servidor
            if (nome.isEmpty() || rua.isEmpty() || bairro.isEmpty() || cidade.isEmpty() || rg.isEmpty() || cpf.isEmpty() || telefone.isEmpty()) {
                response.getWriter().write("Existem campos vazios favor preencher!");
                return;
            }
            
            //Se todos os campos forem preenchidos ele seta os valores no cliente
            cli.setNome(nome);
            cli.setRua(rua);
            cli.setBairro(bairro);
            cli.setCidade(cidade);
            cli.setRg(rg);
            cli.setCpf(cpf);
            cli.setTelefone(telefone);
            cli.setData(data);
            
            
            //Faz a inserção do cadastro no banco de dados
            inserir.inserirCadastro(cli);
            
        }catch(SQLException e){
            
            //Se der algum erro de SQL ele informa o erro do lado cliente
            System.out.println("Erro no cadastro"+e);
        }
        try (PrintWriter out = response.getWriter()) {
             
            //Se der tudo certo ele leva uma mensagem de cadastro com sucesso
            out.println("Cadastrado com sucesso");
           
            
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
        } catch (SQLException ex) {
            Logger.getLogger(CadastroController.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (SQLException ex) {
            Logger.getLogger(CadastroController.class.getName()).log(Level.SEVERE, null, ex);
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
