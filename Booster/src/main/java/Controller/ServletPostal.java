/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Modelo.Postal;
import Modelo.postalDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Arrays;
import java.util.List;

/**
 *
 * @author Kris
 */
@WebServlet(name = "ServletPostal", urlPatterns = {"/ServletPostal"})
public class ServletPostal extends HttpServlet {

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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ServletPostal</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServletPostal at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        

        RequestDispatcher dispatcher = request.getRequestDispatcher("codigopostal.jsp");

        dispatcher.forward(request, response);
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
        
        String codigo = request.getParameter("codigo_postal");
        postalDAO dao = new postalDAO();
        Postal postal = dao.buscarPorCodigo(codigo);
        
       if (postal != null) {
    List<String> codigosPermitidos = Arrays.asList(
        "94102", "94103", "94104", "94105", "94107", "94108", "94109", "94110",
        "94111", "94112", "94114", "94115", "94116", "94117", "94118", "94121",
        "94122", "94123", "94124", "94127", "94129", "94130", "94131", "94132",
        "94133", "94134", "94158"
    );

    if (codigosPermitidos.contains(codigo)) {
        response.sendRedirect("ServletFormulario?codigo_postal=" + codigo);
    } else{
        response.sendRedirect("BahiaServlet?codigo_postal=" + codigo);
    }
} else {
    response.getWriter().write("<script>alert('Cosdigo postal no se encuentra en el rango'); window.history.back();</script>");
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

