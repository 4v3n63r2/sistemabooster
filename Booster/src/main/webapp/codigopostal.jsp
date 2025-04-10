<%@page import="Modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Administrador</title>
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
                display: flex;
                justify-content: center;
                align-items: center;
                margin: 0;
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
            
            /* Estilos para el contenedor principal */
            .admin-container {
                display: flex;
                flex-direction: column;
                align-items: center;
                width: 100%;
                max-width: 500px;
                padding: 20px;
            }
            
            .welcome-header {
                background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
                color: white;
                padding: 20px 30px;
                border-radius: 15px;
                margin-bottom: 30px;
                text-align: center;
                box-shadow: 0 5px 15px rgba(78, 84, 200, 0.3);
                width: 100%;
                animation: fadeInDown 0.8s ease;
            }
            
            .welcome-title {
                font-weight: 700;
                font-size: 1.8rem;
                margin-bottom: 0;
            }
            
            .welcome-icon {
                font-size: 2.5rem;
                margin-bottom: 10px;
            }
            
            /* Estilos para el formulario */
            .auth-container {
                background-color: white;
                border-radius: 15px;
                box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
                padding: 40px;
                animation: fadeInUp 0.8s ease;
                border-top: 5px solid var(--accent-color);
                width: 100%;
            }
            
            .auth-header {
                text-align: center;
                margin-bottom: 30px;
            }
            
            .auth-title {
                color: var(--primary-color);
                font-weight: 700;
                font-size: 1.8rem;
                margin-bottom: 10px;
            }
            
            .auth-subtitle {
                color: #666;
                font-weight: 400;
                font-size: 1rem;
            }
            
            .form-group {
                margin-bottom: 20px;
            }
            
            .form-label {
                display: block;
                margin-bottom: 8px;
                font-weight: 500;
                color: #555;
                font-size: 0.95rem;
                text-align: left;
            }
            
            .form-control {
                width: 100%;
                padding: 12px 15px;
                border: 1px solid #e1e1e1;
                border-radius: 8px;
                font-size: 1rem;
                transition: all 0.3s ease;
            }
            
            .form-control:focus {
                border-color: var(--accent-color);
                box-shadow: 0 0 0 3px rgba(108, 99, 255, 0.2);
                outline: none;
            }
            
            .input-icon-wrapper {
                position: relative;
            }
            
            .input-icon {
                position: absolute;
                top: 50%;
                transform: translateY(-50%);
                left: 15px;
                color: #aaa;
            }
            
            .input-with-icon {
                padding-left: 45px;
            }
            
            .btn-submit {
                width: 100%;
                padding: 14px;
                background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
                color: white;
                border: none;
                border-radius: 8px;
                font-weight: 600;
                font-size: 1rem;
                cursor: pointer;
                transition: all 0.3s ease;
                margin-top: 10px;
                box-shadow: 0 4px 10px rgba(78, 84, 200, 0.3);
            }
            
            .btn-submit:hover {
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
            
            @keyframes fadeInDown {
                from {
                    opacity: 0;
                    transform: translateY(-20px);
                }
                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }
            
            @media (max-width: 576px) {
                .admin-container {
                    padding: 15px;
                }
                
                .auth-container {
                    padding: 25px;
                }
                
                .welcome-header {
                    padding: 15px;
                }
                
                .welcome-title {
                    font-size: 1.5rem;
                }
            }
            
            /* Agregamos fuente Poppins de Google Fonts */
           
        </style>
    </head>
    <body>
        <div class="admin-container">
            <div class="welcome-header">
                <i class="fas fa-user-shield welcome-icon"></i>
                <h1 class="welcome-title">Bienvenido, <%= ((Usuario) session.getAttribute("usuario")).getNombreUsuario() %></h1>
            </div>
            
            <div class="auth-container">
                <div class="auth-header">
                    <h2 class="auth-title">Buscar Código Postal</h2>
                    <p class="auth-subtitle">Ingresa el código postal que deseas consultar</p>
                </div>
                
                <form action="ServletPostal" method="post">
                    <div class="form-group">
                        <label for="codigo_postal" class="form-label">Código Postal</label>
                        <div class="input-icon-wrapper">
                            <i class="fas fa-map-marker-alt input-icon"></i>
                            <input type="text" id="codigo_postal" name="codigo_postal" class="form-control input-with-icon" required>
                        </div>
                    </div>
                    
                    <button type="submit" class="btn-submit">
                        <i class="fas fa-search me-2"></i> Buscar
                    </button>
                </form>
            </div>
        </div>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>