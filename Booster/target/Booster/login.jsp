<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <title>Iniciar Sesión</title>
      
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
                background-image: url('Fondo_Login.png');
                background-size: cover;
                background-position: center;
                background-attachment: fixed;
                height: 100vh;
                margin: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                position: relative;
            }
            
            body::before {
                content: "";
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.6);
                z-index: -1;
            }
            
            /* Estilos para el formulario de login */
            .auth-container {
                max-width: 420px;
                background-color: white;
                border-radius: 15px;
                box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
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
                font-size: 2rem;
                margin-bottom: 10px;
            }
            
            .auth-subtitle {
                color: #666;
                font-weight: 400;
                font-size: 1rem;
                margin-bottom: 20px;
            }
            
            .auth-icon {
                font-size: 3.5rem;
                color: var(--accent-color);
                margin-bottom: 15px;
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
            
            .register-link {
                display: block;
                margin-top: 20px;
                text-align: center;
                color: var(--primary-color);
                font-weight: 500;
                text-decoration: none;
                transition: all 0.3s ease;
            }
            
            .register-link:hover {
                color: var(--accent-color);
                text-decoration: underline;
            }
            
            .error-message {
                background-color: #fff5f5;
                color: #e53e3e;
                padding: 12px;
                border-radius: 8px;
                margin-top: 20px;
                font-size: 0.9rem;
                border-left: 4px solid #e53e3e;
                animation: shake 0.5s ease;
                text-align: left;
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
            
            @keyframes shake {
                0%, 100% { transform: translateX(0); }
                10%, 30%, 50%, 70%, 90% { transform: translateX(-5px); }
                20%, 40%, 60%, 80% { transform: translateX(5px); }
            }
            
            @media (max-width: 480px) {
                .auth-container {
                    max-width: 90%;
                    padding: 30px 20px;
                }
            }
            
            /* Agregamos fuente Poppins de Google Fonts */
          
        </style>
    </head>
    <body>
        <div class="auth-container">
            <div class="auth-header">
                <i class="fas fa-user-circle auth-icon"></i>
                <h2 class="auth-title">Iniciar Sesión</h2>
                <p class="auth-subtitle">Ingresa tus datos para acceder al sistema</p>
            </div>
            
            <form action="ServletLogin" method="post">
                <div class="form-group">
                    <label for="nombreUsuario" class="form-label">Nombre de usuario</label>
                    <div class="input-icon-wrapper">
                        <i class="fas fa-user input-icon"></i>
                        <input type="text" id="nombreUsuario" name="nombreUsuario" class="form-control input-with-icon" required>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="password" class="form-label">Contraseña</label>
                    <div class="input-icon-wrapper">
                        <i class="fas fa-lock input-icon"></i>
                        <input type="password" id="password" name="password" class="form-control input-with-icon" required>
                    </div>
                </div>
                
                <button type="submit" class="btn-submit">
                    <i class="fas fa-sign-in-alt me-2"></i> Iniciar sesión
                </button>
            </form>
            
            <% String mensajeError = (String) request.getAttribute("mensajeError");
                if (mensajeError != null) { %>
                <div class="error-message">
                    <i class="fas fa-exclamation-circle me-2"></i>
                    <%= mensajeError %>
                </div>
            <% } %>
            
            
        </div>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>