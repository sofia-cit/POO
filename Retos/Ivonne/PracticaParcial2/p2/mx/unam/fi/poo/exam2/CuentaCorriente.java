package mx.unam.fi.poo.exam2;  
//hereda de CuentaBancaria e implementa Transaccionable para cobrar una comision
public class CuentaCorriente extends CuentaBancaria implements Transaccionable {
    private double limiteSobregiro; 
    private static final double COMISION_MENSUAL = 5.0;


    public CuentaCorriente(String numeroCuenta, String titular, double limiteSobregiro) {
        super(numeroCuenta, titular);
        this.limiteSobregiro = limiteSobregiro;
    }

    @Override
    public void depositar(double monto) {
        if (monto > 0) {
            saldo += monto;
            System.out.println("Depósito de " + String.format("%.2f", monto) + " realizado en Cuenta Corriente " + numeroCuenta);
        } else {
            System.out.println("El monto a depositar debe ser positivo.");
        }
    }

   
    @Override
    public void retirar(double monto) {
        if (monto <= 0) {
            System.out.println("El monto a retirar debe ser positivo");
            return;
        }

        if (saldo - monto >= -limiteSobregiro) {
            saldo -= monto;
            System.out.println("Retiro de " + String.format("%.2f", monto) + " realizado en Cuenta Corriente " + numeroCuenta);
    
            if (saldo < 0) {
                System.out.println("La cuenta está en sobregiro: " + String.format("%.2f", saldo));
            }
        } else {
            System.out.println("Retiro denegado, excede el límite de sobregiro (" + String.format("%.2f", limiteSobregiro) + ") en Cuenta Corriente " + numeroCuenta);
        }
    }

    @Override
    public void aplicarCargoMensual() {
        saldo -= COMISION_MENSUAL;
        System.out.println("Se cobró la comisión mensual de " + String.format("%.2f", COMISION_MENSUAL) + " a la Cuenta Corriente " + numeroCuenta + ". Nuevo saldo: " + String.format("%.2f", saldo));
    }

    @Override
    public String toString() {
        return super.toString() + String.format(" (Corriente, Sobregiro: %.2f)", limiteSobregiro);
    }
}