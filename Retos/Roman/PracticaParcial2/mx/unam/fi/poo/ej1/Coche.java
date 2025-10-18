package mx.unam.fi.poo.ej1;

public class Coche extends Vehiculo implements Alquilable{
    //nuevo atributo
    private int numPuertas;
    //constructor
    public Coche (String matricula, String modelo, double costoBaseDia, int numPuertas){
        super(matricula, modelo, costoBaseDia);
        setNumPuertas(numPuertas);;
    }
    //getters y setter del nuevo atributo
    public int getNumPuertas() {
        return numPuertas;
    }
    public void setNumPuertas(int numPuertas) {
        this.numPuertas = numPuertas;
    }
    //implementar el método abstracto de Vehiculo
    public double calcularCostoAlquiler(int dias){
        return (getCostoBaseDia()*dias);
    }
    //implementar el metodo de Alquilable
    public void mostrarDetalleAlquiler(){
        System.out.print("--- Coche: ---\n");
        System.out.println(super.imprimirVehiculo());
        System.out.println("\tNúmero de puertas: " + getNumPuertas());
    }
    public void mostrarDetalleAlquiler(int dias){
        System.out.print("--- Coche: ---\n");
        System.out.println(super.imprimirVehiculo());
        System.out.println("\tNúmero de puertas: " + getNumPuertas());
        System.out.println("\tCosto por " + dias +" dias: " + calcularCostoAlquiler(dias));
    }
    public void impVehiculo(){
        mostrarDetalleAlquiler();
    }
}
