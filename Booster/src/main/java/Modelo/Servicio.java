package Modelo;

public class Servicio {
    private Long idServicio;
    private Long idCliente;
    private String tipoLimpieza;
    private int cuartos;
    private int banos;
    private double piesCuadrados;
    private int personas;
    private String frecuenciaLimpieza;
    private String extra1;
    private String extra2;
    private String extra3;
    private String extra4;
    private String extra5;
    private String extra6;
    private String producto1;
    private String producto2;
    private String producto3;
    private String producto4;
    private double totalHoras;
    private double totalPrecio;

    // Getters y Setters
    public Long getIdServicio() { return idServicio; }
    public void setIdServicio(Long idServicio) { this.idServicio = idServicio; }

    public Long getIdCliente() { return idCliente; }
    public void setIdCliente(Long idCliente) { this.idCliente = idCliente; }

    public String getTipoLimpieza() { return tipoLimpieza; }
    public void setTipoLimpieza(String tipoLimpieza) { this.tipoLimpieza = tipoLimpieza; }

    public int getCuartos() { return cuartos; }
    public void setCuartos(int cuartos) { this.cuartos = cuartos; }

    public int getBanos() { return banos; }
    public void setBanos(int banos) { this.banos = banos; }

    public double getPiesCuadrados() { return piesCuadrados; }
    public void setPiesCuadrados(double piesCuadrados) { this.piesCuadrados = piesCuadrados; }

    public int getPersonas() { return personas; }
    public void setPersonas(int personas) { this.personas = personas; }

    public String getFrecuenciaLimpieza() { return frecuenciaLimpieza; }
    public void setFrecuenciaLimpieza(String frecuenciaLimpieza) { this.frecuenciaLimpieza = frecuenciaLimpieza; }

    public String getExtra1() { return extra1; }
    public void setExtra1(String extra1) { this.extra1 = extra1; }
    
    public String getExtra2() { return extra2; }
    public void setExtra2(String extra2) { this.extra2 = extra2; }
    
    public String getExtra3() { return extra3; }
    public void setExtra3(String extra3) { this.extra3 = extra3; }
    
    public String getExtra4() { return extra4; }
    public void setExtra4(String extra4) { this.extra4 = extra4; }
    
    public String getExtra5() { return extra5; }
    public void setExtra5(String extra5) { this.extra5 = extra5; }
    
    public String getExtra6() { return extra6; }
    public void setExtra6(String extra6) { this.extra6 = extra6; }
    
    public String getProducto1() { return producto1; }
    public void setProducto1(String producto1) { this.producto1 = producto1; }
    
    public String getProducto2() { return producto2; }
    public void setProducto2(String producto2) { this.producto2 = producto2; }
    
    public String getProducto3() { return producto3; }
    public void setProducto3(String producto3) { this.producto3 = producto3; }
    
    public String getProducto4() { return producto4; }
    public void setProducto4(String producto4) { this.producto4 = producto4; }
    
    public double getTotalHoras() { return totalHoras; }
    public void setTotalHoras(double totalHoras) { this.totalHoras = totalHoras; }

    public double getTotalPrecio() { return totalPrecio; }
    public void setTotalPrecio(double totalPrecio) { this.totalPrecio = totalPrecio; }

    @Override
    public String toString() {
        return "Servicio{" +
                "idCliente=" + idCliente +
                ", tipoLimpieza='" + tipoLimpieza + '\'' +
                ", cuartos=" + cuartos +
                ", banos=" + banos +
                ", piesCuadrados=" + piesCuadrados +
                ", personas=" + personas +
                ", frecuenciaLimpieza='" + frecuenciaLimpieza + '\'' +
                ", totalHoras=" + totalHoras +
                ", totalPrecio=" + totalPrecio +
                '}';
    }
}