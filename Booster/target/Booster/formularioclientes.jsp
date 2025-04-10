<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulario de Clientes</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

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
            padding: 40px 0;
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
        
        .container {
            position: relative;
            z-index: 1;
        }
        
        /* Estilos para el formulario */
        .form-container {
            background-color: white;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            padding: 40px;
            animation: fadeInUp 0.8s ease;
            border-top: 5px solid var(--accent-color);
            max-width: 700px;
            margin: 0 auto;
        }
        
        .form-header {
            text-align: center;
            margin-bottom: 30px;
        }
        
        .form-title {
            color: var(--primary-color);
            font-weight: 700;
            font-size: 2rem;
            margin-bottom: 10px;
        }
        
        .form-subtitle {
            color: #666;
            font-weight: 400;
            font-size: 1rem;
            margin-bottom: 20px;
        }
        
        .form-icon {
            font-size: 3rem;
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
        
        .form-control[readonly] {
            background-color: #f8f9fa;
            border-color: #ddd;
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
            padding: 14px 30px;
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: white;
            border: none;
            border-radius: 8px;
            font-weight: 600;
            font-size: 1rem;
            cursor: pointer;
            transition: all 0.3s ease;
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
        
        @media (max-width: 768px) {
            .form-container {
                padding: 30px 20px;
                margin: 0 15px;
            }
            
            .form-title {
                font-size: 1.8rem;
            }
        }
        
        /* Agregamos fuente Poppins de Google Fonts */
      
    </style>
    <script>
        function validarFormulario() {
            let nombre = document.getElementById("nombre").value;
            let telefono = document.getElementById("telefono").value;
            let correo = document.getElementById("correo").value;
            let codigoPostal = document.getElementById("codigo_postal").value;
            
            if (nombre.trim() === "") {
                alert("El nombre es obligatorio.");
                return false;
            }
            
            if (telefono.trim() === "") {
                alert("El teléfono es obligatorio.");
                return false;
            }
            
            let correoRegex = /^[^@]+@[^@]+\.[a-zA-Z]{2,}$/;
            if (!correoRegex.test(correo)) {
                alert("Ingrese un correo válido.");
                return false;
            }
            
            let codigoPostalRegex = /^\d+$/;
            if (!codigoPostalRegex.test(codigoPostal)) {
                alert("El código postal solo debe contener números.");
                return false;
            }
            
            return true;
        }
    </script>
</head>
<body>
    <div class="container">
        <div class="form-container">
            <div class="form-header">
                <i class="fas fa-user-plus form-icon"></i>
                <h2 class="form-title">Registro de Cliente</h2>
                <p class="form-subtitle">Complete el formulario con los datos del cliente</p>
            </div>
            
            <form action="ServletFormulario" method="post" onsubmit="return validarFormulario()">
                <div class="mb-4">
                    <label for="nombre" class="form-label">Nombre:</label>
                    <div class="input-icon-wrapper">
                        <i class="fas fa-user input-icon"></i>
                        <input type="text" id="nombre" name="nombre" class="form-control input-with-icon" required>
                    </div>
                </div>
                
                <div class="mb-4">
                    <label for="telefono" class="form-label">Teléfono:</label>
                    <div class="input-icon-wrapper">
                        <i class="fas fa-phone input-icon"></i>
                        <input type="text" id="telefono" name="telefono" class="form-control input-with-icon" required>
                    </div>
                </div>
                
                <div class="mb-4">
                    <label for="correo" class="form-label">Correo Electrónico:</label>
                    <div class="input-icon-wrapper">
                        <i class="fas fa-envelope input-icon"></i>
                        <input type="email" id="correo" name="correo" class="form-control input-with-icon" required>
                    </div>
                </div>
                
                <div class="mb-4">
                    <label for="codigo_postal" class="form-label">Código Postal:</label>
                    <div class="input-icon-wrapper">
                        <i class="fas fa-map-marker-alt input-icon"></i>
                        <input type="text" id="codigo_postal" name="codigo_postal" class="form-control input-with-icon" 
                            value="${codigo_postal}" readonly>
                    </div>
                </div>
                
                <div class="text-center">
                    <button type="submit" class="btn-submit">
                        <i class="fas fa-save me-2"></i> Registrar Cliente
                    </button>
                </div>
            </form>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>