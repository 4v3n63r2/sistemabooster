package Controller;


import Modelo.CodigoPostal;
import Modelo.PostalAdminDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


@WebServlet(name = "Servletpostaladmin", urlPatterns = {"/Servletpostaladmin"})
public class Servletpostaladmin extends HttpServlet {

    private PostalAdminDAO dao = new PostalAdminDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");

        // Acción para eliminar un código postal
        if (accion != null && accion.equals("eliminar")) {
            long id = Long.parseLong(request.getParameter("id"));
            dao.eliminar(id);
        }

        // Acción para editar un código postal (cargar los datos para mostrarlos en el modal)
        if (accion != null && accion.equals("editar")) {
            long id = Long.parseLong(request.getParameter("id"));
            CodigoPostal codigoPostal = dao.obtenerPorId(id);
            request.setAttribute("codigoPostal", codigoPostal);
        }

        // Obtener la lista de códigos postales actualizada
        List<CodigoPostal> listaCodigos = dao.obtenerTodos();
        request.setAttribute("listaCodigos", listaCodigos);

        // Redirigir a la JSP para mostrar la lista de códigos postales
        request.getRequestDispatcher("codigopostaladmin.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");

        // Verificar la acción (insertar o editar)
        if (accion != null) {
            CodigoPostal cp = new CodigoPostal();
            cp.setCodigoPostal(request.getParameter("codigoPostal"));
            cp.setNombreCiudad(request.getParameter("nombreCiudad"));

            if (accion.equals("insertar")) {
                // Agregar nuevo código postal
                dao.agregar(cp);
            } else if (accion.equals("editar")) {
                // Actualizar código postal existente
                cp.setId(Long.parseLong(request.getParameter("id")));
                dao.actualizar(cp);
            }
        }

        // Obtener la lista de códigos postales actualizada
        List<CodigoPostal> listaCodigos = dao.obtenerTodos();
        request.setAttribute("listaCodigos", listaCodigos);

        // Redirigir al mismo servlet para recargar la página con los datos actualizados
        response.sendRedirect("Servletpostaladmin");
    }

    @Override
    public String getServletInfo() {
        return "Servlet para administrar los códigos postales";
    }
}
