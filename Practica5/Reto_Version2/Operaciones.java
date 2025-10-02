package Reto_Version2;

public class Operaciones {


    public double sumar(double a, double b) {
        return a + b;
    }
    public double restar(double a, double b) {
        return a - b;
    }
    public double multiplicar( double a, double b) {
        return a * b;
    }
    public double dividir(double a, double b) {
        if (b == 0) {
            System.out.println("No se puede dividir entre cero");
            return -1;
        }
        return (double) a / b;
    }

}
