package mx.unam.fi.poo.exam2;

//hereda de CuentaBancaria e implementa transaccionable para añadir intereses
public class CuentaAhorro extends CuentaBancaria implements Transaccionable {
    private double tasaInteres; 
    private static final double LIMITE_RETIRO = 500.0;

    public CuentaAhorro(String numeroCuenta, String titular, double tasaInteres) {
        super(numeroCuenta, titular);
        this.tasaInteres = tasaInteres;
    }

    @Override
    public void depositar(double monto) {
        if (monto > 0) {
            saldo += monto;
            System.out.println("Deposito de " + String.format("%.2f", monto) + " realizado en Cuenta Ahorro " + numeroCuenta);
        } else {
            System.out.println("El monto a depositar debe ser positivo");
        }
    }

    @Override
    public void retirar(double monto) {
        if (monto <= 0) {
            System.out.println("El monto a retirar debe ser positivo");
            return;
        }

        if (monto > LIMITE_RETIRO) {
            System.out.println("Retiro denegado, el monto excede el límite de retiro de Cuenta Ahorro: " + String.format("%.2f", LIMITE_RETIRO));
            return;
        }

        if (saldo >= monto) {
            saldo -= monto;
            System.out.println("Retiro de " + String.format("%.2f", monto) + " realizado en Cuenta Ahorro " + numeroCuenta);
        } else {
            System.out.println("Saldo insuficiente en Cuenta Ahorro " + numeroCuenta);
        }
    }

    @Override
    public void aplicarCargoMensual() {
        double interesGanado = saldo * (tasaInteres / 12.0);
        saldo += interesGanado;
        System.out.println("se aplicó un interés de " + String.format("%.2f", interesGanado) + " a la Cuenta Ahorro " + numeroCuenta + ". Nuevo saldo: " + String.format("%.2f", saldo));
    }

    @Override
    public String toString() {
        return super.toString() + String.format(" (Ahorro, Interés: %.2f%%)", tasaInteres * 100);
    }
}