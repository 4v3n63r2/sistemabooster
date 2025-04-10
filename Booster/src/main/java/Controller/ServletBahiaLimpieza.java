package Controller;

import Modelo.Servicio;
import Modelo.ServicioDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "ServletBahiaLimpieza", urlPatterns = {"/ServletBahiaLimpieza"})
public class ServletBahiaLimpieza extends HttpServlet {

    private static final Logger logger = Logger.getLogger(ServletDatosLimpieza.class.getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String idCliente = request.getParameter("id_cliente");
        request.setAttribute("id_cliente", idCliente);
        RequestDispatcher dispatcher = request.getRequestDispatcher("BahiaLimpieza.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Obtener y validar ID cliente
            String idClienteStr = request.getParameter("id_cliente");
            if (idClienteStr == null || idClienteStr.isEmpty()) {
                throw new Exception("ID de cliente no proporcionado");
            }
            long idCliente = Long.parseLong(idClienteStr);

            // Construir objeto servicio
            Servicio servicio = new Servicio();
            servicio.setIdCliente(idCliente);
            servicio.setTipoLimpieza(getRequiredParameter(request, "tipo_limpieza"));
            servicio.setCuartos(Integer.parseInt(getRequiredParameter(request, "cuartos")));
            servicio.setBanos((int)Double.parseDouble(getRequiredParameter(request, "banos")));
            servicio.setPiesCuadrados(parsePiesCuadrados(getRequiredParameter(request, "pies_cuadrados")));
            servicio.setPersonas(Integer.parseInt(getRequiredParameter(request, "personas")));
            servicio.setFrecuenciaLimpieza(getRequiredParameter(request, "frecuencia"));
            
            // Procesar extras
            String[] extras = request.getParameterValues("extra");
            if (extras != null) {
                servicio.setExtra1(extras.length > 0 ? extras[0] : null);
                servicio.setExtra2(extras.length > 1 ? extras[1] : null);
                servicio.setExtra3(extras.length > 2 ? extras[2] : null);
                servicio.setExtra4(extras.length > 3 ? extras[3] : null);
                servicio.setExtra5(extras.length > 4 ? extras[4] : null);
                servicio.setExtra6(extras.length > 5 ? extras[5] : null);
            }
            
            // Procesar productos
            String[] productos = request.getParameterValues("producto_limpieza");
            if (productos != null) {
                servicio.setProducto1(productos.length > 0 ? productos[0] : null);
                servicio.setProducto2(productos.length > 1 ? productos[1] : null);
                servicio.setProducto3(productos.length > 2 ? productos[2] : null);
                servicio.setProducto4(productos.length > 3 ? productos[3] : null);
            }
            
            // Procesar totales
            servicio.setTotalHoras(parseHoras(getRequiredParameter(request, "total_horas")));
            servicio.setTotalPrecio(parsePrecio(getRequiredParameter(request, "total_precio")));

            // Guardar en BD
            ServicioDAO servicioDAO = new ServicioDAO();
            if (!servicioDAO.agregarServicio(servicio)) {
                throw new Exception("No se pudo guardar el servicio en la base de datos");
            }

            // Redireccionar si todo sale bien
            response.sendRedirect("ServletPostal?id_cliente=" + idCliente);
            
        } catch (Exception e) {
            logger.log(Level.SEVERE, "Error al procesar servicio", e);
            request.setAttribute("error", "Error: " + e.getMessage());
            request.setAttribute("id_cliente", request.getParameter("id_cliente"));
            request.getRequestDispatcher("datoslimpieza.jsp").forward(request, response);
        }
    }

    private String getRequiredParameter(HttpServletRequest request, String name) throws Exception {
        String value = request.getParameter(name);
        if (value == null || value.trim().isEmpty()) {
            throw new Exception("El campo " + name + " es requerido");
        }
        return value.trim();
    }

    private double parsePiesCuadrados(String value) throws Exception {
        if (value.contains("-")) {
            String[] partes = value.split("-");
            return (Double.parseDouble(partes[0].trim()) + Double.parseDouble(partes[1].trim())) / 2;
        }
        return Double.parseDouble(value);
    }

    private double parseHoras(String value) throws Exception {
        if (value.contains("-")) {
            String[] partes = value.split("-");
            return (parseTimeToHours(partes[0].trim()) + parseTimeToHours(partes[1].trim())) / 2;
        }
        return parseTimeToHours(value);
    }

    private double parseTimeToHours(String time) throws Exception {
        String[] partes = time.split(":");
        int horas = Integer.parseInt(partes[0]);
        int minutos = partes.length > 1 ? Integer.parseInt(partes[1]) : 0;
        return horas + (minutos / 60.0);
    }

    private double parsePrecio(String value) throws Exception {
        return Double.parseDouble(value.replace("$", "").trim());
    }
}