package Modelo;

import config.conexion;
import java.sql.*;
import java.util.Date;

public class UsuarioDAO {
    private Connection connection;

    public UsuarioDAO() {
        this.connection = conexion.getConnection();
    }

    // Método para registrar un nuevo usuario
    public boolean registrarUsuario(Usuario usuario) {
        String sql = "INSERT INTO usuarios (nombre_usuario, password, fecha_registro, rol) VALUES (?, ?, ?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, usuario.getNombreUsuario());
            stmt.setString(2, usuario.getPassword());  // La contraseña no está cifrada (⚠ Se recomienda cifrarla)
            stmt.setTimestamp(3, new Timestamp(usuario.getFechaRegistro().getTime()));  // Fecha de registro
            stmt.setString(4, usuario.getRol()); // Se agrega el rol al registro

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Método para validar el login de un usuario
    public Usuario validarUsuario(String nombreUsuario, String password) {
        String sql = "SELECT id, nombre_usuario, password, fecha_registro, rol FROM usuarios WHERE nombre_usuario = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, nombreUsuario);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                String storedPassword = rs.getString("password");
                if (storedPassword.equals(password)) {  // ⚠ Comparación sin cifrar (Se recomienda cifrado seguro)
                    Long id = rs.getLong("id");
                    Date fechaRegistro = rs.getTimestamp("fecha_registro");
                    String rol = rs.getString("rol"); // Obtiene el rol del usuario

                    return new Usuario(id, nombreUsuario, storedPassword, fechaRegistro, rol);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;  // Usuario no encontrado o contraseña incorrecta
    }
}