/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.ClienteDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

/**
 *
 * @author DTI05
 */
@WebServlet(name = "BuscarClienteController", urlPatterns = {"/BuscarClienteController"})
public class BuscarClienteController extends HttpServlet {

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
            throws ServletException, IOException, SQLException {
            
            //Cabeçalho para charset UTC-8 e JSON
            response.setContentType("text/html;charset=UTF-8");
            response.setContentType( "application/json");
            
            //Faz todas instancias
            ClienteDAO dao = new ClienteDAO();
            JSONArray array = new JSONArray();
            JSONObject json = new JSONObject();
            
            //Buscar as informações do cliente
            int id = Integer.parseInt(request.getParameter("id"));
            String nome = dao.buscarClientePeloId(id).getNome();
            String rua = dao.buscarClientePeloId(id).getRua();
            String bairro = dao.buscarClientePeloId(id).getBairro();
            String cidade = dao.buscarClientePeloId(id).getCidade();
            String rg = dao.buscarClientePeloId(id).getRg();
            String cpf = dao.buscarClientePeloId(id).getCpf();
            String telefone = dao.buscarClientePeloId(id).getTelefone();
            String data = dao.buscarClientePeloId(id).getData();
            
            
            
        try (PrintWriter out = response.getWriter()) {
            //Criar um JSON de cada variável
            json.put("id", id);
            json.put("nome", nome);
            json.put("rua", rua);
            json.put("bairro", bairro);
            json.put("cidade", cidade);
            json.put("rg", rg);
            json.put("cpf", cpf);
            json.put("telefone", telefone);
            json.put("data", data);
            
            //Adicionar cada JSON em um ARRAY de JSON
            array.add(json);
            
            //Enviar a resposta para a VIEW em um ARRAYJSON
            response.getWriter().write("{\"nome\":"+array.toString()+"}");
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
            Logger.getLogger(BuscarClienteController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(BuscarClienteController.class.getName()).log(Level.SEVERE, null, ex);
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
