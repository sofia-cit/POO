package mx.unam.fi.poo.g1.proyecto2;

public class EmpleadoAsalariado extends Empleado {
    private double salarioSemanal; 

    public EmpleadoAsalariado(String nombre, String apellidoPaterno, String numeroSeguroSocial, double salarioSemanal) {
        super(nombre, apellidoPaterno, numeroSeguroSocial);
        setSalarioSemanal(salarioSemanal);
    }

    public void setSalarioSemanal(double salarioSemanal) {
        if (salarioSemanal < 0.0) {
            System.out.println("el salario semanal debe ser mayor qeu 0");
        }else{
        this.salarioSemanal = salarioSemanal;}
    }

    public double getSalarioSemanal() {
        return salarioSemanal;
    }
    @Override
    public double ingresos() {
        return getSalarioSemanal();
    }
    @Override
    public String toString() {
        return super.toString() + 
        "\nSalario Semanal: $" + getSalarioSemanal();
    }
}
