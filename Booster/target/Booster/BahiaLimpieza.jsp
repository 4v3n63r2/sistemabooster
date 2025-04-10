<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulario de Servicios</title>
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
        
        .form-control, .form-select {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #e1e1e1;
            border-radius: 8px;
            font-size: 1rem;
            transition: all 0.3s ease;
        }
        
        .form-control:focus, .form-select:focus {
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
            width: 100%;
            margin-bottom: 10px;
        }
        
        .btn-submit:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 15px rgba(78, 84, 200, 0.4);
        }
        
        .btn-calculate {
            background: linear-gradient(135deg, #6c63ff, #9d94fb);
        }
        
        .error-message {
            color: red;
            font-size: 0.85rem;
            margin-top: 5px;
        }
        
        .form-check {
            margin-bottom: 10px;
        }
        
        .form-check-input {
            margin-right: 8px;
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
    </style>
</head>
<body>
    <div class="container">
        <div class="form-container">
            <div class="form-header">
                <i class="fas fa-broom form-icon"></i>
                <h2 class="form-title">Registrar Servicio</h2>
                <p class="form-subtitle">Complete el formulario con los detalles del servicio de limpieza</p>
            </div>
            
            <%-- Mostrar mensaje de error si existe --%>
            <% if (request.getAttribute("error") != null) { %>
                <div class="alert alert-danger" role="alert">
                    <%= request.getAttribute("error") %>
                </div>
            <% } %>
            
            <form id="servicioForm" action="ServletBahiaLimpieza" method="POST" onsubmit="return validarFormulario()">
                <input type="hidden" id="id_cliente" name="id_cliente" value="${param.id_cliente}">
                
                <div class="form-group">
                    <label class="form-label">Tipo de limpieza</label>
                    <select class="form-select" id="tipo_limpieza" name="tipo_limpieza" required>
                        <option value="">Seleccione...</option>
                        <option value="estandar">Estándar</option>
                        <option value="profunda">Profunda</option>
                        <option value="mudanza">Mudanza</option>
                    </select>
                </div>
               

                <div class="row">
                    <div class="col form-group">
                        <label class="form-label">Cuartos</label>
                        <select class="form-select" id="cuartos" name="cuartos" required>
                            <option value="">Seleccione...</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                        </select>
                    </div>
                    <div class="col form-group">
                        <label for="banos" class="form-label">Baños</label>
                        <select class="form-select" id="banos" name="banos" required>
                            <option value="">Seleccione...</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label class="form-label">Tamaño (Pies cuadrados)</label>
                    <select class="form-select" id="pies_cuadrados" name="pies_cuadrados">
                        <option value="">Seleccione...</option>
                        <option value="500-700">500 - 700</option>
                        <option value="700-1000">700 - 1000</option>
                        <option value="1000-1500">1000 - 1500</option>
                        <option value="1500-2100">1500 - 2100</option>
                        <option value="2100-2800">2100 - 2800</option>
                        <option value="2800-3800">2800 - 3800</option>
                        <option value="3800-5000">3800 - 5000</option>
                        <option value="5000-6500">5000 - 6500</option>
                    </select>
                </div>

                <div class="row">
                    <div class="col form-group">
                        <label class="form-label">Personas</label>
                        <select class="form-select" id="personas" name="personas" required>
                            <option value="">Seleccione...</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                        </select>
                    </div>
                    <div class="col form-group">
                        <label class="form-label">Frecuencia</label>
                        <select class="form-select" id="frecuencia" name="frecuencia" required>
                            <option value="">Seleccione...</option>
                            <option value="Una Vez">Una vez</option>
                            <option value="semanal">Semanal</option>
                            <option value="quincenal">Quincenal</option>
                            <option value="mensual">Mensual</option>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label class="form-label">Extras</label>
                    <div class="row">
                        <div class="col-6">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="extra" value="Limpieza de ventanas interiores" id="extra1">
                                <label class="form-check-label" for="extra1">Limpieza de ventanas interiores</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="extra" value="Limpieza de azulejos y juntas" id="extra2">
                                <label class="form-check-label" for="extra2">Limpieza de azulejos y juntas</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="extra" value="Limpieza del interior del refrigerador" id="extra3">
                                <label class="form-check-label" for="extra3">Limpieza del interior del refrigerador</label>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="extra" value="Limpieza del interior del horno" id="extra4">
                                <label class="form-check-label" for="extra4">Limpieza del interior del horno</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="extra" value="Cajones y gabinetes" id="extra5">
                                <label class="form-check-label" for="extra5">Cajones y gabinetes</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="extra" value="Aspirado de tapicería" id="extra6">
                                <label class="form-check-label" for="extra6">Aspirado de tapicería</label>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="form-label">Productos de limpieza</label>
                    <div class="row">
                        <div class="col-6">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="producto_limpieza" value="apto_ninos" id="prod1">
                                <label class="form-check-label" for="prod1">Apto para niños</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="producto_limpieza" value="ecologico" id="prod2">
                                <label class="form-check-label" for="prod2">Ecológico</label>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="producto_limpieza" value="no_toxico" id="prod3">
                                <label class="form-check-label" for="prod3">No tóxico</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="producto_limpieza" value="apto_mascotas" id="prod4">
                                <label class="form-check-label" for="prod4">Apto para mascotas</label>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="form-label">Total Horas</label>
                    <div class="input-icon-wrapper">
                        <i class="fas fa-clock input-icon"></i>
                        <input type="text" class="form-control input-with-icon" id="total_horas" name="total_horas" readonly required>
                    </div>
                    <div id="horas_error" class="error-message"></div>
                </div>

                <div class="form-group">
                    <label class="form-label">Total Precio</label>
                    <div class="input-icon-wrapper">
                        <i class="fas fa-dollar-sign input-icon"></i>
                        <input type="text" class="form-control input-with-icon" id="total_precio" name="total_precio" readonly required>
                    </div>
                    <div id="precio_error" class="error-message"></div>
                </div>

                <button type="button" class="btn-submit btn-calculate" id="calcular_btn">
                    <i class="fas fa-calculator me-2"></i> Generar Servicio
                </button>
                <button type="submit" class="btn-submit" id="guardar_btn">
                    <i class="fas fa-save me-2"></i> Guardar Servicio
                </button>
            </form>
        </div>
    </div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Actualizar opciones de baños según cuartos seleccionados
    document.getElementById('cuartos').addEventListener('change', function() {
        const cuartos = parseInt(this.value);
        const banosSelect = document.getElementById('banos');
        
        // Limpiar opciones actuales
        banosSelect.innerHTML = '<option value="">Seleccione...</option>';
        
        // Agregar opciones según cuartos
        if (cuartos === 1) {
            addOption(banosSelect, '1', '1');
        } else if (cuartos === 2) {
            addOption(banosSelect, '1', '1');
            addOption(banosSelect, '1.5', '1.5');
            addOption(banosSelect, '2', '2');
        } else if (cuartos === 3) {
            addOption(banosSelect, '1', '1');
            addOption(banosSelect, '1.5', '1.5');
            addOption(banosSelect, '2', '2');
            addOption(banosSelect, '2.5', '2.5');
            addOption(banosSelect, '3', '3');
        } else if (cuartos === 4) {
            addOption(banosSelect, '2', '2');
            addOption(banosSelect, '3', '3');
            addOption(banosSelect, '3.5', '3.5');
            addOption(banosSelect, '4', '4');
        } else if (cuartos === 5) {
            addOption(banosSelect, '3', '3');
            addOption(banosSelect, '4', '4');
            addOption(banosSelect, '5', '5');
        } else if (cuartos === 6) {
            addOption(banosSelect, '5', '5');
        }
    });

    function addOption(selectElement, value, text) {
        const option = document.createElement('option');
        option.value = value;
        option.textContent = text;
        selectElement.appendChild(option);
    }

    document.getElementById('calcular_btn').addEventListener('click', function() {
        calcularServicio();
    });

    function validarFormulario() {
        const totalHoras = document.getElementById('total_horas').value;
        const totalPrecio = document.getElementById('total_precio').value;
        let valido = true;

        // Validar que se haya calculado el servicio
        if (!totalHoras || totalHoras.trim() === '') {
            document.getElementById('horas_error').textContent = 'Debe generar el servicio primero';
            valido = false;
        } else {
            document.getElementById('horas_error').textContent = '';
        }

        if (!totalPrecio || totalPrecio.trim() === '' || totalPrecio === '$0.00') {
            document.getElementById('precio_error').textContent = 'Debe generar el servicio primero';
            valido = false;
        } else {
            document.getElementById('precio_error').textContent = '';
        }

        return valido;
    }

    function calcularServicio() {
        // Validar campos requeridos
        const requiredFields = ['cuartos', 'banos', 'pies_cuadrados', 'personas', 'frecuencia'];
        let missingFields = [];
        
        requiredFields.forEach(fieldId => {
            const field = document.getElementById(fieldId);
            if (!field.value) {
                missingFields.push(fieldId);
            }
        });

        if (missingFields.length > 0) {
            alert('Por favor complete todos los campos requeridos antes de calcular.');
            return;
        }

        const cuartos = parseInt(document.getElementById('cuartos').value);
        const banos = parseFloat(document.getElementById('banos').value);
        const pies = document.getElementById('pies_cuadrados').value;
        const personas = parseInt(document.getElementById('personas').value);
        const frecuencia = document.getElementById('frecuencia').value;
        
        // Contar extras seleccionados
        const extras = document.querySelectorAll('input[name="extra"]:checked').length;
        const productos = document.querySelectorAll('input[name="producto_limpieza"]:checked');
        
        // Calcular tiempo base y precio según las reglas
        let tiempoBase = '';
        let precioBase = 0;
        
        // 1 cama
        if (cuartos === 1) {
            if (pies === '500-700') {
                if (personas === 1) {
                    tiempoBase = '2:30-3:00';
                    precioBase = 159.38;
                } else {
                    tiempoBase = '1:15-1:30';
                    precioBase = 191.25;
                }
            } else if (pies === '700-1000') {
                if (personas === 1) {
                    tiempoBase = '3:00-4:00';
                    precioBase = 191.25;
                } else {
                    tiempoBase = '1:30-2:00';
                    precioBase = 255.00;
                }
            } else if (pies === '1000-1500') {
                if (personas === 1) {
                    tiempoBase = '3:30-4:00';
                    precioBase = 191.25;
                } else {
                    tiempoBase = '1:30-2:00';
                    precioBase = 255.00;
                }
            }
        }
        // 2 camas y 1 baño o 1.5 baños
        else if (cuartos === 2 && (banos === 1 || banos === 1.5)) {
            if (pies === '700-1000') {
                if (personas === 1) {
                    tiempoBase = '3:30-4:00';
                    precioBase = 223.13;
                } else {
                    tiempoBase = '1:45-2:00';
                    precioBase = 255.00;
                }
            } else if (pies === '1000-1500') {
                if (personas === 1) {
                    tiempoBase = '4:00-4:30';
                    precioBase = 255.00;
                } else {
                    tiempoBase = '2:00-2:15';
                    precioBase = 286.88;
                }
            } else if (pies === '1500-2100') {
                if (personas === 1) {
                    tiempoBase = '4:30-5:00';
                    precioBase = 286.88;
                } else {
                    tiempoBase = '2:15-2:30';
                    precioBase = 318.75;
                }
            } else if (pies === '2100-2800') {
                if (personas === 1) {
                    tiempoBase = '5:00-5:30';
                    precioBase = 318.75;
                } else {
                    tiempoBase = '2:30-2:45';
                    precioBase = 350.63;
                }
            } else if (pies === '2800-3800') {
                if (personas === 1) {
                    tiempoBase = '5:30-6:00';
                    precioBase = 286.88;
                } else {
                    tiempoBase = '2:15-3:00';
                    precioBase = 382.50;
                }
            }
        }
        // 2 camas y 2 baños o 3 camas y 1 baño o 1.5 baños
        else if ((cuartos === 2 && banos === 2) || (cuartos === 3 && (banos === 1 || banos === 1.5))) {
            if (pies === '1000-1500') {
                if (personas === 1) {
                    tiempoBase = '5:00-5:30';
                    precioBase = 318.75;
                } else {
                    tiempoBase = '2:30-2:45';
                    precioBase = 350.63;
                }
            } else if (pies === '1500-2100') {
                if (personas === 1) {
                    tiempoBase = '5:30-6:00';
                    precioBase = 350.63;
                } else {
                    tiempoBase = '2:45-3:00';
                    precioBase = 382.50;
                }
            } else if (pies === '2100-2800') {
                if (personas === 1) {
                    tiempoBase = '6:00-6:30';
                    precioBase = 382.50;
                } else {
                    tiempoBase = '3:00-3:15';
                    precioBase = 414.38;
                }
            } else if (pies === '2800-3800') {
                if (personas === 1) {
                    tiempoBase = '6:30-7:30';
                    precioBase = 414.38;
                } else {
                    tiempoBase = '3:15-3:45';
                    precioBase = 478.13;
                }
            } else if (pies === '3800-5000') {
                if (personas === 1) {
                    tiempoBase = '7:00-8:00';
                    precioBase = 446.25;
                } else {
                    tiempoBase = '3:30-4:00';
                    precioBase = 510.00;
                }
            }
        }
        // 3 camas y 2.5 baños o 3 camas y 3 baños o 4 camas y 2 baños
        else if ((cuartos === 3 && (banos === 2.5 || banos === 3)) || (cuartos === 4 && banos === 2)) {
            if (pies === '1000-1500') {
                if (personas === 1) {
                    tiempoBase = '6:30-7:30';
                    precioBase = 414.38;
                } else {
                    tiempoBase = '3:15-3:45';
                    precioBase = 478.13;
                }
            } else if (pies === '1500-2100') {
                if (personas === 1) {
                    tiempoBase = '7:00-8:00';
                    precioBase = 446.25;
                } else {
                    tiempoBase = '3:30-4:00';
                    precioBase = 510.00;
                }
            } else if (pies === '2100-2800') {
                if (personas === 1) {
                    tiempoBase = '7:30-8:30';
                    precioBase = 478.13;
                } else {
                    tiempoBase = '3:45-4:15';
                    precioBase = 541.88;
                }
            } else if (pies === '2800-3800') {
                if (personas === 1) {
                    tiempoBase = '8:00-9:00';
                    precioBase = 510.00;
                } else {
                    tiempoBase = '4:00-4:30';
                    precioBase = 573.75;
                }
            } else if (pies === '3800-5000') {
                if (personas === 1) {
                    tiempoBase = '8:30-9:30';
                    precioBase = 541.88;
                } else {
                    tiempoBase = '4:15-4:45';
                    precioBase = 605.63;
                }
            }
        }
        // 4 camas y 3 baños o 3.5 baños o 4 baños o 5 camas y 3 baños
        else if ((cuartos === 4 && (banos === 3 || banos === 3.5 || banos === 4)) || (cuartos === 5 && banos === 3)) {
            if (pies === '1500-2100') {
                if (personas === 1) {
                    tiempoBase = '7:00-8:00';
                    precioBase = 446.25;
                } else {
                    tiempoBase = '3:30-4:00';
                    precioBase = 510.00;
                }
            } else if (pies === '2100-2800') {
                if (personas === 1) {
                    tiempoBase = '7:30-8:30';
                    precioBase = 478.13;
                } else {
                    tiempoBase = '3:45-4:15';
                    precioBase = 541.88;
                }
            } else if (pies === '2800-3800') {
                if (personas === 1) {
                    tiempoBase = '8:00-9:00';
                    precioBase = 510.00;
                } else {
                    tiempoBase = '4:00-4:30';
                    precioBase = 573.75;
                }
            } else if (pies === '3800-5000') {
                if (personas === 1) {
                    tiempoBase = '8:30-9:30';
                    precioBase = 541.88;
                } else {
                    tiempoBase = '4:15-4:45';
                    precioBase = 605.63;
                }
            } else if (pies === '5000-6500') {
                if (personas === 1) {
                    tiempoBase = '9:00-10:00';
                    precioBase = 573.75;
                } else {
                    tiempoBase = '4:30-5:00';
                    precioBase = 637.50;
                }
            }
        }
        // 5 camas y 4 baños
        else if (cuartos === 5 && banos === 4) {
            if (pies === '1500-2100') {
                if (personas === 1) {
                    tiempoBase = '8:30-9:30';
                    precioBase = 541.88;
                } else {
                    tiempoBase = '4:15-4:45';
                    precioBase = 605.63;
                }
            } else if (pies === '2100-2800') {
                if (personas === 1) {
                    tiempoBase = '9:00-9:30';
                    precioBase = 573.75;
                } else {
                    tiempoBase = '4:30-5:00';
                    precioBase = 637.50;
                }
            } else if (pies === '2800-3800') {
                if (personas === 1) {
                    tiempoBase = '9:30-10:30';
                    precioBase = 605.63;
                } else {
                    tiempoBase = '4:45-5:15';
                    precioBase = 669.38;
                }
            } else if (pies === '3800-5000') {
                if (personas === 1) {
                    tiempoBase = '10:00-11:00';
                    precioBase = 637.50;
                } else {
                    tiempoBase = '5:00-5:30';
                    precioBase = 701.25;
                }
            } else if (pies === '5000-6500') {
                if (personas === 1) {
                    tiempoBase = '10:30-11:30';
                    precioBase = 669.38;
                } else {
                    tiempoBase = '5:15-5:45';
                    precioBase = 733.13;
                }
            }
        }
        // 5 camas y 5 baños o 6 camas y 5 baños
        else if ((cuartos === 5 && banos === 5) || (cuartos === 6 && banos === 5)) {
            if (pies === '2100-2800') {
                if (personas === 1) {
                    tiempoBase = '9:30-10:30';
                    precioBase = 605.63;
                } else {
                    tiempoBase = '4:45-5:15';
                    precioBase = 669.38;
                }
            } else if (pies === '2800-3800') {
                if (personas === 1) {
                    tiempoBase = '10:00-11:00';
                    precioBase = 669.38;
                } else {
                    tiempoBase = '5:00-5:30';
                    precioBase = 701.25;
                }
            } else if (pies === '3800-5000') {
                if (personas === 1) {
                    tiempoBase = '10:30-11:30';
                    precioBase = 669.38;
                } else {
                    tiempoBase = '5:15-5:45';
                    precioBase = 733.13;
                }
            } else if (pies === '5000-6500') {
                if (personas === 1) {
                    tiempoBase = '11:00-12:00';
                    precioBase = 701.25;
                } else {
                    tiempoBase = '5:30-6:00';
                    precioBase = 765.00;
                }
            }
        }
        
        // Calcular tiempo adicional por extras y precio adicional por productos y tiempo extra
        let tiempoAdicional = 0;
        let precioAdicional = 0;
        
        // Precio fijo por productos seleccionados
        productos.forEach(prod => {
            if (prod.value === "apto_ninos") precioAdicional += 15;
            if (prod.value === "ecologico") precioAdicional += 20;
            if (prod.value === "no_toxico") precioAdicional += 25;
            if (prod.value === "apto_mascotas") precioAdicional += 30;
        });
        
        // Tiempo y precio adicional por extras
        if (extras > 0) {
            if (personas === 2) {
                if (extras <= 2) {
                    tiempoAdicional = 15;
                    precioAdicional += 31.88; // 15 min = 0.25h * $127.50/h
                } else if (extras <= 4) {
                    tiempoAdicional = 30;
                    precioAdicional += 63.75; // 30 min = 0.5h * $127.50/h
                } else {
                    tiempoAdicional = 45;
                    precioAdicional += 95.63; // 45 min = 0.75h * $127.50/h
                }
            } else {
                if (extras <= 2) {
                    tiempoAdicional = 30;
                    precioAdicional += 31.88; // 30 min = 0.5h * $63.75/h
                } else if (extras <= 4) {
                    tiempoAdicional = 60;
                    precioAdicional += 63.75; // 60 min = 1h * $63.75/h
                } else {
                    tiempoAdicional = 90;
                    precioAdicional += 95.63; // 90 min = 1.5h * $63.75/h
                }
            }
        }
        
        // Convertir tiempo base a minutos para sumar el adicional
        if (tiempoBase) {
            const [tiempoInicio, tiempoFin] = tiempoBase.split('-');
            const [horasInicio, minutosInicio] = tiempoInicio.split(':').map(Number);
            const [horasFin, minutosFin] = tiempoFin.split(':').map(Number);
            
            const totalMinutosInicio = horasInicio * 60 + minutosInicio;
            const totalMinutosFin = horasFin * 60 + minutosFin;
            
            const nuevoMinutosInicio = totalMinutosInicio + tiempoAdicional;
            const nuevoMinutosFin = totalMinutosFin + tiempoAdicional;
            
            const nuevaHoraInicio = Math.floor(nuevoMinutosInicio / 60) + ':' + (nuevoMinutosInicio % 60).toString().padStart(2, '0');
            const nuevaHoraFin = Math.floor(nuevoMinutosFin / 60) + ':' + (nuevoMinutosFin % 60).toString().padStart(2, '0');
            
            tiempoBase = nuevaHoraInicio + '-' + nuevaHoraFin;
        }
        
        // Sumar el precio adicional al precio base
        const precioTotal = precioBase + precioAdicional;
        
        // Mostrar resultados
        document.getElementById('total_horas').value = tiempoBase || 'No disponible';
        document.getElementById('total_precio').value = precioTotal ? '$' + precioTotal.toFixed(2) : 'No disponible';
        
        // Limpiar mensajes de error
        document.getElementById('horas_error').textContent = '';
        document.getElementById('precio_error').textContent = '';
    }
</script>
</body>
</html>