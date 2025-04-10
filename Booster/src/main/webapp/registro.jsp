<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Registro</title>
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
                margin: 0;
                padding: 0;
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
                margin-bottom: 30px;
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
            
            /* Mantenemos los estilos originales del formulario pero con algunas mejoras visuales */
            .container {
                background: white;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
                text-align: center;
                width: 350px;
                margin-top: 50px;
            }
            
            h2 {
                margin-bottom: 20px;
                color: var(--primary-color);
                font-weight: 600;
            }
            
            label {
                display: block;
                margin: 10px 0 5px;
                font-weight: bold;
                text-align: left;
                color: #555;
            }
            
            input {
                width: 100%;
                padding: 10px;
                margin-bottom: 15px;
                border: 1px solid #ddd;
                border-radius: 5px;
                transition: border-color 0.3s ease;
            }
            
            input:focus {
                border-color: var(--accent-color);
                outline: none;
                box-shadow: 0 0 0 2px rgba(108, 99, 255, 0.2);
            }
            
            button {
                width: 100%;
                padding: 12px;
                background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 16px;
                font-weight: 600;
                transition: all 0.3s ease;
                box-shadow: 0 4px 10px rgba(78, 84, 200, 0.3);
            }
            
            button:hover {
                transform: translateY(-2px);
                box-shadow: 0 6px 15px rgba(78, 84, 200, 0.4);
            }
            
            .error {
                color: #e53e3e;
                margin-top: 10px;
                padding: 8px;
                background-color: #fff5f5;
                border-radius: 5px;
                border-left: 3px solid #e53e3e;
                text-align: left;
            }
            
            /* Agregamos fuente Poppins de Google Fonts */
                    </style>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark">
            <div class="container-fluid">
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
                            <a class="nav-link active" href="ServletRegistro">
                                <i class="fas fa-user-plus me-1"></i> Registrar Usuarios
                            </a>
                        </li>
                         <li class="nav-item">
                            <a class="nav-link" href="Servletpostaladmin">
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
     
        <div class="d-flex justify-content-center align-items-center" style="min-height: 80vh;">
            <div class="container">
                <h2>Registro Usuario</h2>
                <form action="ServletRegistro" method="post" onsubmit="mostrarAlerta(event)">
                    <label for="nombreUsuario">Nombre de usuario:</label>
                    <input type="text" id="nombreUsuario" name="nombreUsuario" required>
                    <label for="password">Contraseña:</label>
                    <input type="password" id="password" name="password" required>
                    <button type="submit">Registrar</button>
                </form>
                <% 
                    String mensajeError = (String) request.getAttribute("mensajeError");
                    if (mensajeError != null) {
                        out.println("<p class='error'><i class='fas fa-exclamation-circle me-2'></i>" + mensajeError + "</p>");
                    }
                %>
            </div>
        </div>

        <!-- Scripts de Bootstrap -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
        <script>
    function mostrarAlerta(event) {
        event.preventDefault(); // Evita el envío inmediato del formulario
        alert("Usuario registrado con éxito");
        event.target.submit(); // Envía el formulario después de mostrar la alerta
    }
</script>

    </body>
</html>