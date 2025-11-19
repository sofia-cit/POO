package mx.unam.fi.poo.exam2;
import java.util.ArrayList;
import java.util.InputMismatchException;
import java.util.List;
import java.util.Scanner;


public class MainApp {

    private static List<CuentaBancaria> cuentas = new ArrayList<>();
    private static Scanner scanner = new Scanner(System.in);

    public static void main(String[] args) {
        
        cuentas.add(new CuentaAhorro("001A", "Uriel Mendoza", 0.05)); 
        cuentas.add(new CuentaCorriente("002C", "Ivonne Rodriguez", 100.0)); //100 de sobregiro
        cuentas.get(0).depositar(1000);
        cuentas.get(1).depositar(500);

        int opcion;
        do {
            mostrarMenu();
            try {
                opcion = scanner.nextInt();
                scanner.nextLine(); //consume la nueva línea
                switch (opcion) {
                    case 1:
                        crearNuevaCuenta();
                        break;
                    case 2:
                        realizarTransaccion();
                        break;
                    case 3:
                        aplicarCargosMensuales();
                        break;
                    case 4:
                        System.out.println("saliendo del sistema");
                        break;
                    default:
                        System.out.println("Opción no válida");
                }
            } catch (InputMismatchException e) {
                System.out.println("Entrada no válida");
                scanner.nextLine(); 
                opcion = 0; 
            }
            System.out.println("\n");
        } while (opcion != 4);
    }

    private static void mostrarMenu() {
        System.out.println("Sistema de cuentas bancarias");
        System.out.println("Cuentas Actuales:");
        if (cuentas.isEmpty()) {
            System.out.println("  (No hay cuentas registradas)");
        } else {
            for (int i = 0; i < cuentas.size(); i++) {
                System.out.println("  [" + (i + 1) + "] " + cuentas.get(i));
            }
        }
        System.out.println("\nMenú de Opciones");
        System.out.println("1. Crear una nueva cuenta");
        System.out.println("2. Realizar un depósito o retiro");
        System.out.println("3. Aplicar cargo mensual a todas las cuentas");
        System.out.println("4. Salir");
        System.out.print("Seleccione una opción: ");
    }

    private static void crearNuevaCuenta() {
        System.out.println("\nCrear Nueva Cuenta");
        System.out.print("Ingrese número de cuenta (ej: 003A): ");
        String num = scanner.nextLine();
        System.out.print("Ingrese nombre del titular: ");
        String titular = scanner.nextLine();

        System.out.println("Tipo de cuenta: 1) Ahorro, 2) Corriente");
        System.out.print("Seleccione un tipo: ");
        int tipo = scanner.nextInt();
        scanner.nextLine();

        try {
            if (tipo == 1) {
                System.out.print("Ingrese Tasa de Interés (ej: 0.04 para 4%): ");
                double tasa = scanner.nextDouble();
                scanner.nextLine();
                cuentas.add(new CuentaAhorro(num, titular, tasa));
                System.out.println("Cuenta de Ahorro creada");
            } else if (tipo == 2) {
                System.out.print("Ingrese Límite de Sobregiro (ej: 200.0): ");
                double limite = scanner.nextDouble();
                scanner.nextLine();
                cuentas.add(new CuentaCorriente(num, titular, limite));
                System.out.println("cuenta corriente creada ");
            } else {
                System.out.println("Tipo de cuenta no reconocido");
            }
        } catch (InputMismatchException e) {
            System.out.println("Entrada numérica no válida");
            scanner.nextLine(); 
        }
    }

   
    private static void realizarTransaccion() {
        if (cuentas.isEmpty()) {
            System.out.println("No hay cuentas para realizar transacciones");
            return;
        }

        System.out.print("Ingrese el número de la cuenta a operar (1 a " + cuentas.size() + "): ");
        try {
            int indice = scanner.nextInt() - 1;
            scanner.nextLine();

            if (indice < 0 || indice >= cuentas.size()) {
                System.out.println("Número de cuenta no válido");
                return;
            }

            CuentaBancaria cuentaSeleccionada = cuentas.get(indice);
            System.out.println("Operando en: " + cuentaSeleccionada);

            System.out.println("Tipo de operación: 1) Depósito, 2) Retiro");
            System.out.print("Seleccione un tipo: ");
            int tipoOp = scanner.nextInt();
            scanner.nextLine();

            System.out.print("Ingrese el monto: ");
            double monto = scanner.nextDouble();
            scanner.nextLine();

            if (tipoOp == 1) {
                cuentaSeleccionada.depositar(monto); 
            } else if (tipoOp == 2) {
                cuentaSeleccionada.retirar(monto); 
            } else {
                System.out.println("Tipo de operación no válido");
            }
        } catch (InputMismatchException e) {
            System.out.println("Entrada numérica no válida");
            scanner.nextLine();
        }
    }

  
    private static void aplicarCargosMensuales() {
        System.out.println("\nAplicando Cargos Mensuales ");
        int transaccionesAplicadas = 0;

        for (CuentaBancaria cuenta : cuentas) {
            if (cuenta instanceof Transaccionable) {
                //se castea el objeto CuentaBancaria a Transaccionable
                Transaccionable transaccionable = (Transaccionable) cuenta;
                transaccionable.aplicarCargoMensual();
                transaccionesAplicadas++;
            } else {
                System.out.println("Cuenta " + cuenta.getNumeroCuenta() + " no implementa Transaccionable, cargo no aplicado");
            }
        }

        if (transaccionesAplicadas == 0) {
             System.out.println("No se aplicó ningún cargo/beneficio mensual");
        }
    }
}