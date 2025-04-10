package Modelo;

import config.conexion;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PostalAdminDAO {
    
    // Método para obtener todos los códigos postales
    public List<CodigoPostal> obtenerTodos() {
        List<CodigoPostal> lista = new ArrayList<>();
        String sql = "SELECT * FROM codigos_postales";
        
        try (Connection con = conexion.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            
            while (rs.next()) {
                CodigoPostal cp = new CodigoPostal();
                cp.setId(rs.getLong("id"));
                cp.setCodigoPostal(rs.getString("codigo_postal"));
                cp.setNombreCiudad(rs.getString("nombre_ciudad"));
                lista.add(cp);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }
    
    // Método para agregar un nuevo código postal
    public boolean agregar(CodigoPostal cp) {
        String sql = "INSERT INTO codigos_postales (codigo_postal, nombre_ciudad) VALUES (?, ?)";
        
        try (Connection con = conexion.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            
            ps.setString(1, cp.getCodigoPostal());
            ps.setString(2, cp.getNombreCiudad());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    // Método para actualizar un código postal
    public boolean actualizar(CodigoPostal cp) {
        String sql = "UPDATE codigos_postales SET codigo_postal = ?, nombre_ciudad = ? WHERE id = ?";
        
        try (Connection con = conexion.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            
            ps.setString(1, cp.getCodigoPostal());
            ps.setString(2, cp.getNombreCiudad());
            ps.setLong(3, cp.getId());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    // Método para eliminar un código postal
    public boolean eliminar(Long id) {
        String sql = "DELETE FROM codigos_postales WHERE id = ?";
        
        try (Connection con = conexion.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            
            ps.setLong(1, id);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    // Método para obtener un código postal por su ID
    public CodigoPostal obtenerPorId(Long id) {
        String sql = "SELECT * FROM codigos_postales WHERE id = ?";
        
        try (Connection con = conexion.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            
            ps.setLong(1, id);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                CodigoPostal cp = new CodigoPostal();
                cp.setId(rs.getLong("id"));
                cp.setCodigoPostal(rs.getString("codigo_postal"));
                cp.setNombreCiudad(rs.getString("nombre_ciudad"));
                return cp;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
