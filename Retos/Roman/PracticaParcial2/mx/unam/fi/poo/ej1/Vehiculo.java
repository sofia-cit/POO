package mx.unam.fi.poo.ej1;

public abstract class Vehiculo {
    //atributos
    private String matricula;
    private String modelo;
    private double costoBaseDia;
    
    //constructor
    public Vehiculo(String matricula, String modelo, double costoBaseDia){
        this.matricula=matricula;
        this.modelo=modelo;
        this.costoBaseDia=costoBaseDia;
    }

    //getters y setters
    public String getMatricula() {
        return matricula;
    }
    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }
    public String getModelo() {
        return modelo;
    }
    public void setModelo(String modelo) {
        this.modelo = modelo;
    }
    public double getCostoBaseDia() {
        return costoBaseDia;
    }
    public void setCostoBaseDia(double costoBaseDia) {
        this.costoBaseDia = costoBaseDia;
    }

    //metodos
    public abstract double calcularCostoAlquiler(int dias);
    //para imprimirlos
    public String imprimirVehiculo(){
        return  ("\tModelo: " + getModelo() +
                "\n\tMatricula: " + getMatricula() +
                "\n\tCosto base por día: " + getCostoBaseDia());
    }
    public abstract void impVehiculo();
}