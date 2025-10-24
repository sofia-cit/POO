package mx.unam.fi.poo.proyecto2;

public class EmpleadoPorHoras extends Empleado {
    private double ventasNetas;
    private double tarifaComision;

    public EmpleadoPorHoras(String nombre, String apellidoPaterno, String numeroSeguroSocial, double ventasNetas, double tarifaComision) {
        super(nombre, apellidoPaterno, numeroSeguroSocial);
        setVentasNetas(ventasNetas);
        setTarifaComision(tarifaComision);
    }

    //getters y setters
    public void setVentasNetas(double ventasNetas) {
        if (ventasNetas < 0.0) {//ventas negativas
            System.out.println("Las ventas netas no pueden ser negativas.");
        }
        else{
            this.ventasNetas = ventasNetas;
        }
    }

    public double getVentasNetas() {
        return ventasNetas;
    }

    public void setTarifaComision(double tarifaComision) {
        if (tarifaComision < 0 || tarifaComision > 1) {
            System.out.println("La tarifa de comisión debe estar entre 0 y 1");
        }
        else{
            this.tarifaComision = tarifaComision;
        }
    }

    public double getTarifaComision() {
        return tarifaComision;
    }

    //tarifa de comisión por las ventas netas
    @Override
    public double ingresos() {
        return getTarifaComision() * getVentasNetas();
    }

  
    @Override
    public String toString() {
        return String.format("Empleado por Horas \nVentas netas: $%,.2f \nTarifa de comisión: %.2f (%.0f)",
                                super.toString(), 
                                getVentasNetas(), 
                                getTarifaComision(), 
                                getTarifaComision() * 100);
    }
        
}