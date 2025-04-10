package Modelo;

public class CodigoPostal {
    private Long id;
    private String codigoPostal;
    private String nombreCiudad;

    // Constructor vacío
    public CodigoPostal() {
    }

    // Constructor con parámetros
    public CodigoPostal(Long id, String codigoPostal, String nombreCiudad) {
        this.id = id;
        this.codigoPostal = codigoPostal;
        this.nombreCiudad = nombreCiudad;
    }

    // Getters y Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCodigoPostal() {
        return codigoPostal;
    }

    public void setCodigoPostal(String codigoPostal) {
        this.codigoPostal = codigoPostal;
    }

    public String getNombreCiudad() {
        return nombreCiudad;
    }

    public void setNombreCiudad(String nombreCiudad) {
        this.nombreCiudad = nombreCiudad;
    }
}
