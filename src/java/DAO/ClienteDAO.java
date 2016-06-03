/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Dominio.Cliente;
import Model.Conexao;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.jsp.jstl.sql.Result;

/**
 *
 * @author DTI05
 */
public class ClienteDAO {

    Conexao conn = new Conexao();
    
    /**
     * @Inseri o cliente
     * @param cliente
     * @throws SQLException 
     */

    public void inserirCadastro(Cliente cliente) throws SQLException {
        String sql = "insert into cadastro(nome, rua, bairro, cidade, rg, cpf, telefone, data) values (?,?,?,?,?,?,?,?)";

        try {

            PreparedStatement ps = conn.getConexao().prepareStatement(sql);

            ps.setString(1, cliente.getNome());
            ps.setString(2, cliente.getRua());
            ps.setString(3, cliente.getBairro());
            ps.setString(4, cliente.getCidade());
            ps.setString(5, cliente.getRg());
            ps.setString(6, cliente.getCpf());
            ps.setString(7, cliente.getTelefone());
            ps.setString(8, cliente.getData());
            ps.execute();
        } catch (SQLException e) {

            System.out.println("Erro ao inserir no banco"+e);
        }

    }

    /**
     * @Busca todos os clientes cadastrados e traz uma lista com todas informações
     * @return
     * @throws SQLException 
     */
    public List<Cliente> listarClientes() throws SQLException {
        List<Cliente> Lista = new ArrayList();

        String sql = "select * from cadastro Order by Id desc";
        PreparedStatement ps = conn.getConexao().prepareStatement(sql);

        ResultSet rs = ps.executeQuery();

        while (rs.next()) {

            Cliente cli = new Cliente();
            cli.setNome(rs.getString("nome"));
            cli.setRua(rs.getString("rua"));
            cli.setBairro(rs.getString("bairro"));
            cli.setCidade(rs.getString("cidade"));
            cli.setRg(rs.getString("rg"));
            cli.setCpf(rs.getString("cpf"));
            cli.setTelefone(rs.getString("telefone"));
            cli.setData(rs.getString("data"));

            Lista.add(cli);
        }

        return Lista;

    }

    /**
     * @Faz a busca de um cliente pelo nome e traz todas informações do banco
     * @param nome
     * @return
     * @throws SQLException 
     */
    public List<Cliente> buscarCliente(String nome) throws SQLException {
        List<Cliente> Lista = new ArrayList();

        String sql = "select * from cadastro where nome like?";
        PreparedStatement ps = conn.getConexao().prepareStatement(sql);
        ps.setString(1, "%" + nome + "%");

        ResultSet rs = ps.executeQuery();

        while (rs.next()) {

            Cliente cli = new Cliente();
            cli.setId(rs.getInt("Id"));
            cli.setNome(rs.getString("nome"));
            cli.setRua(rs.getString("rua"));
            cli.setBairro(rs.getString("bairro"));
            cli.setCidade(rs.getString("cidade"));
            cli.setRg(rs.getString("rg"));
            cli.setCpf(rs.getString("cpf"));
            cli.setTelefone(rs.getString("telefone"));
            cli.setData(rs.getString("data"));

            Lista.add(cli);
        }

        return Lista;

    }

    /**
     * 
     * @param id
     * @Faz uma busca no banco de dados pelo numero do id e retona um cliente com todas informações
     * @return
     * @throws SQLException 
     */
    public Cliente buscarClientePeloId(int id) throws SQLException {
        Cliente cli = new Cliente();
        String sql = "select * from cadastro where Id=?";
        PreparedStatement ps = conn.getConexao().prepareStatement(sql);
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();
        try {
            while (rs.next()) {
                cli.setId(rs.getInt("Id"));
                cli.setNome(rs.getString("nome"));
                cli.setRua(rs.getString("rua"));
                cli.setBairro(rs.getString("bairro"));
                cli.setCidade(rs.getString("cidade"));
                cli.setRg(rs.getString("rg"));
                cli.setCpf(rs.getString("cpf"));
                cli.setTelefone(rs.getString("telefone"));
                cli.setData(rs.getString("data"));
            }
        } catch (SQLException e) {
            System.out.println("Erro ao buscar " + e);
        }
        return cli;
    }
    
    /**
     * 
     * @param cli cliente para setar os valores
     * @param id pega um int ID
     * Método para inserir atualização nos dados do cliente cadastrado
     * @throws SQLException 
     */
    
    public void inserirUpdate(Cliente cli, int id) throws SQLException{
    String sql = "update cadastro set nome=?, rua=?,bairro=?,cidade=?,rg=?,cpf=?,telefone=?,data=? where id=?";
    PreparedStatement ps = conn.getConexao().prepareStatement(sql);
    ps.setString(1, cli.getNome());
    ps.setString(2, cli.getRua());
    ps.setString(3, cli.getBairro());
    ps.setString(4, cli.getCidade());
    ps.setString(5, cli.getRg());
    ps.setString(6, cli.getCpf());
    ps.setString(7, cli.getTelefone());
    ps.setString(8, cli.getData());
    ps.setInt(9, id);
    ps.execute();
    }
    
    /**
     * 
     * @param id método para excluir registro do bando de dados
     * @return retorna uma string informando se deu certo
     * @throws SQLException 
     */
    
   public String excluirCadastro(int id) throws SQLException{
       String sql = "DELETE FROM CADASTRO WHERE ID=?";
       PreparedStatement ps = conn.getConexao().prepareStatement(sql);
       ps.setInt(1, id);
       ps.execute();
       
       return "Excluido com sucesso";
   }

}
