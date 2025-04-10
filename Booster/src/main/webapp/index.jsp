<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Inicio</title>
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
            
            .hero-section {
                padding: 100px 0;
                text-align: center;
            }
            
            .hero-title {
                font-size: 3rem;
                font-weight: 800;
                margin-bottom: 1.5rem;
                color: var(--primary-color);
                animation: fadeInUp 1s ease;
            }
            
            .hero-subtitle {
                font-size: 1.2rem;
                font-weight: 300;
                margin-bottom: 2rem;
                color: #666;
                animation: fadeInUp 1s ease 0.3s;
                animation-fill-mode: both;
                max-width: 600px;
                margin-left: auto;
                margin-right: auto;
            }
            
            .content-card {
                background-color: white;
                border-radius: 15px;
                box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
                padding: 30px;
                margin-bottom: 40px;
                transform: translateY(0);
                transition: all 0.3s ease;
                border-left: 5px solid var(--accent-color);
            }
            
            .content-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 15px 35px rgba(0, 0, 0, 0.15);
            }
            
            .card-icon {
                font-size: 2.5rem;
                margin-bottom: 20px;
                color: var(--accent-color);
            }
            
            .btn-primary {
                background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
                border: none;
                padding: 12px 25px;
                border-radius: 30px;
                font-weight: 600;
                transition: all 0.3s ease;
                box-shadow: 0 4px 10px rgba(78, 84, 200, 0.3);
            }
            
            .btn-primary:hover {
                transform: translateY(-3px);
                box-shadow: 0 6px 15px rgba(78, 84, 200, 0.4);
            }
            
            @keyframes fadeInUp {
                from {
                    opacity: 0;
                    transform: translateY(20px);
                }
                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            @media (max-width: 768px) {
                .hero-title {
                    font-size: 2.2rem;
                }
                
                .hero-section {
                    padding: 60px 0;
                }
            }
            
            /* Agregamos fuente Poppins de Google Fonts */
          

        </style>
    </head>
    <body>
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
                            <a class="nav-link active" aria-current="page" href="#">
                                <i class="fas fa-home me-1"></i> Inicio
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="ServletRegistro">
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
                                <i class="fas fa-cog me-1"></i>Salir
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Hero section -->
        <div class="hero-section">
            <div class="container">
                <h1 class="hero-title">Bienvenido Admin</h1>
                <p class="hero-subtitle"></p>
            </div>
        </div>

        <!-- Contenido de la página -->
        
        <div class="container d-flex justify-content-center">
    <div class="row d-flex justify-content-center">
        <div class="col-md-4 d-flex justify-content-center">
            <div class="content-card text-center">
                <i class="fas fa-users card-icon"></i>
                <h3>Gestión de Usuarios</h3>
                <p>Administra fácilmente todos los usuarios registrados en el sistema.</p>
                <a href="ServletRegistro" class="btn btn-primary mt-2">Registrar Usuario</a>
            </div>
        </div>
        <div class="col-md-4 d-flex justify-content-center">
            <div class="content-card text-center">
                <i class="fas fa-map card-icon"></i>
                <h3>Códigos Postales</h3>
                <p>Consulta y gestiona la información de códigos postales de manera intuitiva.</p>
                <a href="Servletpostaladmin" class="btn btn-primary mt-2">Ver Códigos</a>
            </div>
        </div>
    </div>
</div>


        <!-- Scripts de Bootstrap -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>