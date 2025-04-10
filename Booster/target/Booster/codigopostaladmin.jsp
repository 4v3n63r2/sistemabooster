<%@page import="Modelo.CodigoPostal"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Administrar Códigos Postales</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
 
         <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
        }
        :root {
            --primary-color: #4e54c8;
            --secondary-color: #8f94fb;
            --text-color: #333;
            --light-color: #f8f9fa;
            --accent-color: #6c63ff;
        }
        
        body {
            font-family: 'Poppins', sans-serif;
            background-image: url('https://images.unsplash.com/photo-1557683311-eac922347aa1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1829&q=80');
            background-size: cover;
            background-attachment: fixed;
            background-position: center;
            color: var(--text-color);
            position: relative;
            min-height: 100vh;
        }
        
        body::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(255, 255, 255, 0.92);
            z-index: -1;
        }
        
        .navbar {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color)) !important;
            padding: 15px 0;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            border-radius: 0 0 15px 15px;
        }
        
        .navbar-brand {
            color: white !important;
            font-weight: 700;
            font-size: 1.5rem;
            padding: 0 15px;
            transition: all 0.3s ease;
        }
        
        .navbar-brand:hover {
            transform: translateY(-2px);
        }
        
        .navbar-nav .nav-link {
            color: rgba(255, 255, 255, 0.9) !important;
            font-weight: 500;
            padding: 10px 15px !important;
            border-radius: 6px;
            transition: all 0.3s ease;
            margin: 0 5px;
        }
        
        .navbar-nav .nav-link:hover,
        .navbar-nav .nav-link.active {
            background-color: rgba(255, 255, 255, 0.2);
            transform: translateY(-2px);
        }

        .navbar-nav .nav-link.active {
            background-color: rgba(255, 255, 255, 0.25);
            color: white !important;
        }
        
        /* Estilos para la tabla y contenido */
        .content-container {
            background-color: white;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            padding: 30px;
            margin-top: 30px;
            margin-bottom: 30px;
            border-top: 5px solid var(--accent-color);
        }
        
        .page-title {
            color: var(--primary-color);
            font-weight: 700;
            margin-bottom: 25px;
            font-size: 2rem;
        }
        
        .table {
            border-collapse: separate;
            border-spacing: 0;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.05);
        }
        
        .table thead {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: white;
        }
        
        .table thead th {
            border: none;
            padding: 15px;
            font-weight: 600;
        }
        
        .table tbody tr:hover {
            background-color: rgba(108, 99, 255, 0.05);
        }
        
        .btn-success {
            background: linear-gradient(135deg, #28a745, #20c997);
            border: none;
            padding: 10px 20px;
            border-radius: 30px;
            font-weight: 600;
            transition: all 0.3s ease;
            box-shadow: 0 4px 10px rgba(40, 167, 69, 0.3);
        }
        
        .btn-success:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 15px rgba(40, 167, 69, 0.4);
        }
        
        .btn-warning {
            background: linear-gradient(135deg, #ffc107, #ffb700);
            border: none;
            color: #212529;
            transition: all 0.3s ease;
        }
        
        .btn-warning:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(255, 193, 7, 0.3);
        }
        
        .btn-danger {
            background: linear-gradient(135deg, #dc3545, #c82333);
            border: none;
            transition: all 0.3s ease;
        }
        
        .btn-danger:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(220, 53, 69, 0.3);
        }
        
        /* Estilos para los modales */
        .modal-content {
            border-radius: 15px;
            border: none;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
        }
        
        .modal-header {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: white;
            border-radius: 15px 15px 0 0;
            border-bottom: none;
        }
        
        .modal-title {
            font-weight: 600;
        }
        
        .modal-body {
            padding: 25px;
        }
        
        .form-label {
            font-weight: 500;
            color: #555;
        }
        
        .form-control {
            border-radius: 8px;
            padding: 10px 15px;
            border: 1px solid #e1e1e1;
            transition: all 0.3s ease;
        }
        
        .form-control:focus {
            border-color: var(--accent-color);
            box-shadow: 0 0 0 3px rgba(108, 99, 255, 0.2);
        }
        
        .btn-primary {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            border: none;
            padding: 10px 20px;
            border-radius: 30px;
            font-weight: 600;
            transition: all 0.3s ease;
            box-shadow: 0 4px 10px rgba(78, 84, 200, 0.3);
        }
        
        .btn-primary:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 15px rgba(78, 84, 200, 0.4);
        }
        
        /* Agregamos fuente Poppins de Google Fonts */
       
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container">
            <!-- Logo o nombre de la aplicación -->
            <a class="navbar-brand" href="index.jsp">
                <i class="fas fa-layer-group me-2"></i>
                Mi Aplicación
            </a>
            <!-- Botón de menú en pantallas pequeñas -->
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <!-- Menú de navegación -->
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="index.jsp">
                            <i class="fas fa-home me-1"></i> Inicio
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="ServletRegistro">
                            <i class="fas fa-user-plus me-1"></i> Registrar Usuarios
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="Servletpostaladmin">
                            <i class="fas fa-map-marker-alt me-1"></i> Códigos Postales
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="ServletLogin">
                            <i class="fas fa-cog me-1"></i> Salir
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container">
        <div class="content-container">
            <h2 class="page-title"><i class="fas fa-map-marker-alt me-2"></i>Listado de Códigos Postales</h2>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Código Postal</th>
                        <th>Ciudad</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <%-- Aquí se insertarán dinámicamente los datos desde el servlet --%>
                    <%@page import="java.util.List" %>
                    <%@page import="Modelo.CodigoPostal" %>
                    <%
                        List<CodigoPostal> listaCodigos = (List<CodigoPostal>) request.getAttribute("listaCodigos");
                        if (listaCodigos != null) {
                            for (CodigoPostal codigo : listaCodigos) {
                    %>
                    <tr>
                        <td><%= codigo.getId() %></td>
                        <td><%= codigo.getCodigoPostal() %></td>
                        <td><%= codigo.getNombreCiudad() %></td>
                        <td>
                            <!-- Botón para editar -->
                            <button class="btn btn-warning btn-sm" data-bs-toggle="modal" data-bs-target="#editarModal" 
                            onclick="llenarFormularioEditar(<%= codigo.getId() %>, '<%= codigo.getCodigoPostal() %>', '<%= codigo.getNombreCiudad() %>')">
                                <i class="fas fa-edit me-1"></i> Editar
                            </button>
                            
                            <!-- Botón para eliminar -->
                            <a href="Servletpostaladmin?accion=eliminar&id=<%= codigo.getId() %>" class="btn btn-danger btn-sm" onclick="return confirm('¿Estás seguro?');">
                                <i class="fas fa-trash-alt me-1"></i> Eliminar
                            </a>
                        </td>
                    </tr>
                    <%  }
                        }
                    %>
                </tbody>
            </table>

            <!-- Botón para agregar un nuevo código postal -->
            <button class="btn btn-success mt-3" data-bs-toggle="modal" data-bs-target="#agregarModal">
                <i class="fas fa-plus-circle me-2"></i> Agregar Nuevo Código Postal
            </button>

            <!-- Modal para Agregar un Nuevo Código Postal -->
            <div class="modal fade" id="agregarModal" tabindex="-1" aria-labelledby="agregarModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="agregarModalLabel">
                                <i class="fas fa-plus-circle me-2"></i> Agregar Nuevo Código Postal
                            </h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form action="Servletpostaladmin" method="post">
                                <input type="hidden" name="accion" value="insertar">
                                <div class="mb-3">
                                    <label for="codigoPostal" class="form-label">Código Postal</label>
                                    <input type="text" class="form-control" id="codigoPostal" name="codigoPostal" required>
                                </div>
                                <div class="mb-3">
                                    <label for="nombreCiudad" class="form-label">Nombre de la Ciudad</label>
                                    <input type="text" class="form-control" id="nombreCiudad" name="nombreCiudad" required>
                                </div>
                                <button type="submit" class="btn btn-primary">
                                    <i class="fas fa-save me-2"></i> Agregar
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Modal para Editar un Código Postal -->
            <div class="modal fade" id="editarModal" tabindex="-1" aria-labelledby="editarModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="editarModalLabel">
                                <i class="fas fa-edit me-2"></i> Editar Código Postal
                            </h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form action="Servletpostaladmin" method="post">
                                <input type="hidden" name="accion" value="editar">
                                <input type="hidden" id="idEditar" name="id">
                                <div class="mb-3">
                                    <label for="codigoPostalEditar" class="form-label">Código Postal</label>
                                    <input type="text" class="form-control" id="codigoPostalEditar" name="codigoPostal" required>
                                </div>
                                <div class="mb-3">
                                    <label for="nombreCiudadEditar" class="form-label">Nombre de la Ciudad</label>
                                    <input type="text" class="form-control" id="nombreCiudadEditar" name="nombreCiudad" required>
                                </div>
                                <button type="submit" class="btn btn-primary">
                                    <i class="fas fa-save me-2"></i> Guardar cambios
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function llenarFormularioEditar(id, codigoPostal, nombreCiudad) {
            document.getElementById("idEditar").value = id;
            document.getElementById("codigoPostalEditar").value = codigoPostal;
            document.getElementById("nombreCiudadEditar").value = nombreCiudad;
        }
    </script>
</body>
</html>