package mx.unam.fi.poo.exam2;

//clase abstracta base para todas las cuentas bancarias
public abstract class CuentaBancaria {
    protected String numeroCuenta;
    protected double saldo;
    protected String titular;

    public CuentaBancaria(String numeroCuenta, String titular) {
        this.numeroCuenta = numeroCuenta;
        this.titular = titular;
        this.saldo = 0.0;
    }

    public abstract void depositar(double monto);

    public abstract void retirar(double monto);


    public String getNumeroCuenta() {
        return numeroCuenta;
    }

    public double getSaldo() {
        return saldo;
    }

    public String getTitular() {
        return titular;
    }
    
    @Override
    public String toString() {
        return "Cuenta [No: " + numeroCuenta + ", Titular: " + titular + ", Saldo: " + String.format("%.2f", saldo) + "]";
    }
}