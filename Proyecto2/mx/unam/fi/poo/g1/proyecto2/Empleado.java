package mx.unam.fi.poo.g1.proyecto2;

public abstract class Empleado {
    protected final String nombre;
    protected final String apellidoPaterno;
    protected final String numeroSeguroSocial;

    public Empleado(String nombre, String apellidoPaterno, String numeroSeguroSocial) {
        this.nombre = nombre;
        this.apellidoPaterno = apellidoPaterno;
        this.numeroSeguroSocial = numeroSeguroSocial;
    }

    public abstract double ingresos();

    @Override
    public String toString() {
        return "Empleado: " + nombre + " " + apellidoPaterno
               + "\nNúmero de Seguro Social: " + numeroSeguroSocial;
    }
}
