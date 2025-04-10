package Modelo;

import config.conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ServicioDAO {

    private static final Logger logger = Logger.getLogger(ServicioDAO.class.getName());

    public boolean agregarServicio(Servicio servicio) {
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try {
            conn = conexion.getConnection();
            conn.setAutoCommit(false); // Iniciar transacción
            
            String sql = "INSERT INTO servicios (id_cliente, tipo_limpieza, cuartos, banos, pies_cuadrados, "
                    + "personas, frecuencia_limpieza, extra1, extra2, extra3, extra4, extra5, extra6, "
                    + "producto1, producto2, producto3, producto4, total_horas, total_precio) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            
            stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            
            // Setear parámetros
            stmt.setLong(1, servicio.getIdCliente());
            stmt.setString(2, servicio.getTipoLimpieza());
            stmt.setInt(3, servicio.getCuartos());
            stmt.setInt(4, servicio.getBanos());
            stmt.setDouble(5, servicio.getPiesCuadrados());
            stmt.setInt(6, servicio.getPersonas());
            stmt.setString(7, servicio.getFrecuenciaLimpieza());
            
            setStringOrNull(stmt, 8, servicio.getExtra1());
            setStringOrNull(stmt, 9, servicio.getExtra2());
            setStringOrNull(stmt, 10, servicio.getExtra3());
            setStringOrNull(stmt, 11, servicio.getExtra4());
            setStringOrNull(stmt, 12, servicio.getExtra5());
            setStringOrNull(stmt, 13, servicio.getExtra6());
            
            setStringOrNull(stmt, 14, servicio.getProducto1());
            setStringOrNull(stmt, 15, servicio.getProducto2());
            setStringOrNull(stmt, 16, servicio.getProducto3());
            setStringOrNull(stmt, 17, servicio.getProducto4());
            
            stmt.setDouble(18, servicio.getTotalHoras());
            stmt.setDouble(19, servicio.getTotalPrecio());
            
            // Ejecutar inserción
            int affectedRows = stmt.executeUpdate();
            if (affectedRows == 0) {
                throw new SQLException("No se insertaron filas");
            }
            
            conn.commit(); // Confirmar transacción
            return true;
            
        } catch (SQLException e) {
            logger.log(Level.SEVERE, "Error al guardar servicio", e);
            if (conn != null) {
                try {
                    conn.rollback(); // Revertir en caso de error
                } catch (SQLException ex) {
                    logger.log(Level.SEVERE, "Error al hacer rollback", ex);
                }
            }
            return false;
        } finally {
            // Cerrar recursos
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException e) {
                    logger.log(Level.WARNING, "Error al cerrar statement", e);
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    logger.log(Level.WARNING, "Error al cerrar conexión", e);
                }
            }
        }
    }

    private void setStringOrNull(PreparedStatement stmt, int index, String value) throws SQLException {
        if (value != null && !value.isEmpty()) {
            stmt.setString(index, value);
        } else {
            stmt.setNull(index, java.sql.Types.VARCHAR);
        }
    }
}