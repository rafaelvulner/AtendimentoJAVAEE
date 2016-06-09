
package DAO;

import Dominio.PreCadastro;
import Model.Conexao;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author DTI05
 */
public class PreCadastroDAO {

    Conexao conn = new Conexao();

    public void inserir(PreCadastro cliente) throws Exception {
        String sql = "insert into precadastro(nome, senha, horas, data) values(?,?,?,?)";

        try {
            PreparedStatement ps = conn.getConexao().prepareStatement(sql);

            ps.setString(1, cliente.getNome());
            ps.setInt(2, cliente.getSenha());
            ps.setString(3, cliente.getHora());
            ps.setString(4, cliente.getData());
            ps.execute();
        } catch (SQLException e) {
            System.out.println("Erro");
        }

    }

    public List<PreCadastro> consultaNormal() throws SQLException {

        List<PreCadastro> cli = new ArrayList();
        String Sql = "select * from precadastro where senha=0 order by data and horas desc";

        PreparedStatement ps = conn.getConexao().prepareStatement(Sql);

        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            PreCadastro clientes = new PreCadastro();
            
            clientes.setNome(rs.getString("nome"));
            clientes.setHora(rs.getString("horas"));
            clientes.setData(rs.getString("data"));
            cli.add(clientes);

        }
        
        return cli;

    }
    
    public List<PreCadastro> consultaPreferencial() throws SQLException{
    List<PreCadastro> cli = new ArrayList();
        String Sql = "select * from precadastro where senha=1 order by data and horas desc";

        PreparedStatement ps = conn.getConexao().prepareStatement(Sql);

        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            PreCadastro clientes = new PreCadastro();

            clientes.setNome(rs.getString("nome"));
            clientes.setHora(rs.getString("horas"));
            clientes.setData(rs.getString("data"));
            cli.add(clientes);

        }
        

        
        return cli;
    }
    
    public List<PreCadastro> consultaGeral() throws SQLException{
    List<PreCadastro> lista = new ArrayList();
    String sql = "select * from precadastro order by Id desc limit 3";
    PreparedStatement ps = conn.getConexao().prepareStatement(sql);
    
    ResultSet rs = ps.executeQuery();
    
        while (rs.next()) {            
            PreCadastro pre = new PreCadastro();
            
            pre.setNome(rs.getString("nome"));
            pre.setSenha(rs.getInt("senha"));
            pre.setHora(rs.getString("horas"));
            
            
            lista.add(pre);
        }
        
        return lista;
        
    }
    
    

}
