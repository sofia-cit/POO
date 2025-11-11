package mx.unam.fi.poo.g1.proyecto2;

public class EmpleadoPorComision extends Empleado {
    private double ventasNetas;
    private double tarifaComision;

    public EmpleadoPorComision(String nombre, String apellidoPaterno, String numeroSeguroSocial, double ventasNetas, double tarifaComision) {
        super(nombre, apellidoPaterno, numeroSeguroSocial);
        setVentasNetas(ventasNetas);
        setTarifaComision(tarifaComision);
    }

    public void setVentasNetas(double ventasNetas) {
        if (ventasNetas < 0.0) {
            System.out.println("las ventas netas deben ser mayores a 0");
        }else{
        this.ventasNetas = ventasNetas;}
    }
    public double getVentasNetas() {
        return ventasNetas;
    }

    public void setTarifaComision(double tarifaComision) {
        if (tarifaComision <= 0.0 || tarifaComision >= 1.0) {
            System.out.println("la tarifa de comisión debe ser mayor a 0 y menor a 1");
        }else{
        this.tarifaComision = tarifaComision;}
    }

    public double getTarifaComision() {
        return tarifaComision;
    }

    @Override
    public double ingresos() {
        return getVentasNetas() * getTarifaComision();
    }

    @Override
    public String toString() {
        double porcentaje = getTarifaComision() * 100;
        
        return super.toString() + 
        "\nVentas Netas: $" + getVentasNetas() + 
        "\nTarifa de Comisión: " + getTarifaComision() + 
        " (" + (int) porcentaje + "%)"; //casteo a int para el pocentaje
    }
}

//prueba de cambio