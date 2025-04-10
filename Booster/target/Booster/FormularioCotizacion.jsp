<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Formulario de Servicios</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    .container {
      max-width: 600px;
      background: #f8f9fa;
      padding: 20px;
      border-radius: 10px;
      box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    }
    .form-select, .form-control {
      font-size: 14px;
      padding: 5px;
    }
    .form-check-label {
      font-size: 14px;
    }
    .btn {
      width: 100%;
    }
  </style>
</head>
<body>
  <div class="container mt-4">
    <h4 class="text-center">Registrar Servicio</h4>
    <form>
      <div class="mb-2">
        <label class="form-label">Tipo de limpieza</label>
        <select class="form-select" id="tipo_limpieza">
          <option value="estandar">Estándar</option>
          <option value="profunda">Profunda</option>
          <option value="mudanza">Mudanza</option>
        </select>
      </div>

      <div class="row mb-2">
        <div class="col">
          <label class="form-label">Cuartos</label>
          <select class="form-select" id="cuartos">
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
            <option value="6">6</option>
          </select>
        </div>
        <div class="col">
          <label class="form-label">Baños</label>
          <select class="form-select" id="banos">
            <option value="1">1</option>
            <option value="1.5">1.5</option>
            <option value="2">2</option>
            <option value="2.5">2.5</option>
            <option value="3">3</option>
            <option value="3.5">3.5</option>
            <option value="4">4</option>
            <option value="4.5">4.5</option>
            <option value="5">5</option>
          </select>
        </div>
      </div>

     <div class="mb-2">
    <label class="form-label">Tamaño (Pies cuadrados)</label>
    <select class="form-select" id="pies_cuadrados">
        <option value="" selected>Seleccione un tamaño</option>
        <option value="500-700">500 - 700</option>
        <option value="700-1000">700 - 1000</option>
        <option value="1000-1500">1000 - 1500</option>
        <option value="1500-2100">1500 - 2100</option>
        <option value="2100-2800">2100 - 2800</option>
        <option value="2800-3800">2800 - 3800</option>
        <option value="3800-5000">3800 - 5000</option>
    </select>
</div>


      <div class="row mb-2">
        <div class="col">
          <label class="form-label">Personas</label>
          <select class="form-select" id="personas">
            <option value="1">1</option>
            <option value="2">2</option>
          </select>
        </div>
        <div class="col">
          <label class="form-label">Frecuencia</label>
          <select class="form-select" id="frecuencia">
            <option value="semanal">Semanal</option>
            <option value="quincenal">Quincenal</option>
            <option value="mensual">Mensual</option>
          </select>
        </div>
      </div>

      <div class="mb-2">
        <label class="form-label">Extras</label><br>
        <div class="row">
          <div class="col-6">
            <div class="form-check">
              <input class="form-check-input" type="checkbox" name="extra" value="Limpieza de ventanas interiores">
              <label class="form-check-label">Limpieza de ventanas interiores</label>
            </div>
            <div class="form-check">
              <input class="form-check-input" type="checkbox" name="extra" value="Limpieza de azulejos y juntas">
              <label class="form-check-label">Limpieza de azulejos y juntas</label>
            </div>
            <div class="form-check">
              <input class="form-check-input" type="checkbox" name="extra" value="Limpieza del interior del refrigerador">
              <label class="form-check-label">Limpieza del interior del refrigerador</label>
            </div>
          </div>
          <div class="col-6">
            <div class="form-check">
              <input class="form-check-input" type="checkbox" name="extra" value="Limpieza del interior del horno">
              <label class="form-check-label">Limpieza del interior del horno</label>
            </div>
            <div class="form-check">
              <input class="form-check-input" type="checkbox" name="extra" value="Cajones y gabinetes">
              <label class="form-check-label">Cajones y gabinetes</label>
            </div>
            <div class="form-check">
              <input class="form-check-input" type="checkbox" name="extra" value="Aspirado de tapicería">
              <label class="form-check-label">Aspirado de tapicería</label>
            </div>
          </div>
        </div>
      </div>

      <div class="mb-2">
        <label class="form-label">Producto de limpieza</label>
        <select class="form-select" id="producto_limpieza">
          <option value="apto_ninos">Apto para niños</option>
          <option value="ecologico">Ecológico</option>
          <option value="no_toxico">No tóxico</option>
          <option value="apto_mascotas">Apto para mascotas</option>
        </select>
      </div>

      <div class="mb-2">
        <label class="form-label">Total Horas</label>
        <input type="text" class="form-control" id="total_horas" readonly>
      </div>

      <div class="mb-2">
        <label class="form-label">Total Precio</label>
        <input type="text" class="form-control" id="total_precio" readonly>
      </div>

      <button type="button" class="btn btn-primary">Generar Servicio</button>
    </form>

    <script>
      function calculateService() {
        // Obtener los valores del formulario
        const cuartos = parseInt(document.getElementById('cuartos').value);
        const banos = parseFloat(document.getElementById('banos').value);
        const piesCuadrados = document.getElementById('pies_cuadrados').value;
        const personas = parseInt(document.getElementById('personas').value);
        const frecuencia = document.getElementById('frecuencia').value;

        let horas = 0;

        // Si se cumple la condición para un servicio de un baño y un cuarto
        if (cuartos === 1 && banos === 1) {
          if (piesCuadrados === "500-700") {
            // Rango de 2:30 - 3:00 horas para 1 persona, se toma el promedio: 2.75 hrs
            // Para 2 personas: promedio de 1:15 ? 1:30 = 1.375 hrs
            horas = personas === 1 ? 2.75 : 1.375;
          } else if (piesCuadrados === "700-1000") {
            // Rango de 3:00 - 4:00 hrs para 1 persona: promedio 3.5 hrs
            // Para 2 personas: promedio de 1:30 - 2:00 hrs = 1.75 hrs
            horas = personas === 1 ? 3.5 : 1.75;
          } else if (piesCuadrados === "1000-1500") {
            // Rango de 3:30 - 4:00 hrs para 1 persona: promedio 3.75 hrs
            // Para 2 personas: promedio de 1:15 - 1:30 hrs = 1.375 o 1.75 hrs (según info, usaremos 1.75)
            horas = personas === 1 ? 3.75 : 1.75;
          }
        }

        // Ajuste por frecuencia: si es semanal, quincenal o mensual,
        // se utiliza un tiempo fijo: 2 hrs para 1 persona o 1 hr para 2 personas.
        if (frecuencia === "semanal" || frecuencia === "quincenal" || frecuencia === "mensual") {
          horas = personas === 1 ? 2 : 1;
        }

        // Calcular precio según el Este de la Bahía
        const precioPorHora = personas === 1 ? 59.50 : 119.00;
        const totalPrecio = horas * precioPorHora;

        // Actualizar los campos de Total Horas y Total Precio
        document.getElementById('total_horas').value = horas.toFixed(2);
        document.getElementById('total_precio').value = `$${totalPrecio.toFixed(2)}`;
      }

      // Escuchar cambios en los campos para actualizar en tiempo real
      document.getElementById('cuartos').addEventListener('change', calculateService);
      document.getElementById('banos').addEventListener('change', calculateService);
      document.getElementById('pies_cuadrados').addEventListener('change', calculateService);
      document.getElementById('personas').addEventListener('change', calculateService);
      document.getElementById('frecuencia').addEventListener('change', calculateService);

      // Actualizar al cargar la página
      window.onload = calculateService;
    </script>
  </div>
</body>
</html>
