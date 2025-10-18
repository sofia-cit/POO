package mx.unam.fi.poo.ej1;

public class Camioneta extends Vehiculo implements Alquilable{
    //atributo propio
    private double capacidadCarga;
    //constructor
    public Camioneta(String matricula, String modelo, double costoBaseDia,double capCarga){
        super(matricula,modelo,costoBaseDia);
        setCapacidadCarga(capCarga);
    }
    //getter y setter
    public double getCapacidadCarga(){
        return capacidadCarga;
    }
    public void setCapacidadCarga(double capCarga){
        this.capacidadCarga=capCarga;
    }
    //metodo abstracto de Vehiculo
    public double calcularCostoAlquiler(int dias){
        //promedio: de 1 a 2 toneladas
        //si carga una tonelada, que se cobre 1000 pesos
        double cargoCapacidad=(getCapacidadCarga()*100);
        return (getCostoBaseDia()*dias*cargoCapacidad);
    }
    //metodo de Alquilable
    public void mostrarDetalleAlquiler(){
            System.out.print("--- Camioneta: ---\n");
        System.out.println(super.imprimirVehiculo());
        System.out.println("\tCapacidad de carga (en toneladas): " + getCapacidadCarga());
    }
    public void mostrarDetalleAlquiler(int dias){
        System.out.print("--- Camioneta: ---\n");
        System.out.println(super.imprimirVehiculo());
        System.out.println("\tCapacidad de carga (en toneladas): " + getCapacidadCarga());
        System.out.println("\tCosto por " + dias +" dias: " + calcularCostoAlquiler(dias));
    }

    public void impVehiculo(){
        mostrarDetalleAlquiler();
    }
    
}
