package mx.unam.fi.poo.proyecto2;

public class EmpleadoAsalariado extends Empleado {

    private double salarioSemanal;
    
    public EmpleadoAsalariado(String nombre, String apellidoPaterno, String numeroSeguroSocial, double salario) {
        
        super(nombre, apellidoPaterno, numeroSeguroSocial);
        setSalarioSemanal(salario);
    }

    public void setSalarioSemanal(double salario) {
        if (salario < 0.0) {
            System.out.println("El salario semanal debe ser positivo");
        }else{
        this.salarioSemanal = salario;
        }
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
        return String.format("Empleado asalariado \n%s\nSalario Semanal: $%.2f",
                super.toString(), 
                getSalarioSemanal());
    }
}