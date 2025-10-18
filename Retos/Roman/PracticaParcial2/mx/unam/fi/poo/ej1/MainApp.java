/*
javac mx/unam/fi/poo/ej1/*.java
java mx/unam/fi/poo/ej1/MainApp
*/
package mx.unam.fi.poo.ej1;
import java.util.ArrayList;
import java.util.Scanner;

public class MainApp {
    public static void main(String[] args) {
        ArrayList <Vehiculo> listaVehiculos = new ArrayList<>();
        Scanner sc = new Scanner (System.in);

        Coche c1 = new Coche("AB2323", "Versa", 1500, 4);
        Camioneta cam1 = new Camioneta("NFL0705", "Ford3000", 6000, 1.5);
        Coche c2 = new Coche("ANQ7899", "Sentra", 1000, 4);
        Camioneta cam2 = new Camioneta("ABM8452", "Raptor", 1700, 1.7);

        listaVehiculos.add(c1);
        listaVehiculos.add(cam1);
        listaVehiculos.add(cam2);
        listaVehiculos.add(c2);

        System.out.println("---Bienvenido al alquiler de autos---");
        int opcion = 0;
        while (opcion!=4){
            System.out.println("Menú de opciones:");
            System.out.println("1. Agregar un nuevo vehículo");
            System.out.println("2. Mostrar la lista de todos los vehículos");
            System.out.println("3. Calcular el costo de alquiler para un vehículo");
            System.out.println("4. Salir");
            opcion = sc.nextInt();
            switch (opcion) {
                case 1:
                    System.out.println("¿Qué tipo de vehículo desea agregar?");
                    System.out.println("1. Coche");
                    System.out.println("2. Camioneta");
                    sc.nextLine();
                    int opcionV = sc.nextInt();
                    switch (opcionV) {
                        case 1:
                            sc.nextLine();
                            System.out.println("Modelo: ");
                            String mod = sc.nextLine();
                            System.out.println("Matrícula: ");
                            String mat = sc.nextLine();
                            System.out.println("Costo base por día: ");
                            double cB = sc.nextDouble();
                            System.out.println("Numero de puertas: ");
                            int nP = sc.nextInt();
                            Coche cN = new Coche (mod,mat,cB,nP);
                            listaVehiculos.add(cN);
                            break;
                        case 2:
                            sc.nextLine();
                            System.out.println("Modelo: ");
                            String modC = sc.nextLine();
                            System.out.println("Matrícula: ");
                            String matC = sc.nextLine();
                            System.out.println("Costo base por día: ");
                            double cBC = sc.nextDouble();
                            System.out.println("Capacidad de carga (en toneladas): ");
                            double cC = sc.nextDouble();
                            Camioneta camN = new Camioneta (modC,matC,cBC,cC);
                            listaVehiculos.add(camN);
                            break;
                        default:
                            break;
                    }

                    break;
                case 2:
                    mostrarLista(listaVehiculos);
                    break;
                case 3:
                    mostrarLista(listaVehiculos);
                    System.out.println("¿Qué número de vehículo desea cotizar?");
                    int opcionCot = sc.nextInt();
                    System.out.println("¿Por cuántos días?");
                    int dias = sc.nextInt(); 
                    double costo = (listaVehiculos.get(opcionCot-1)).calcularCostoAlquiler(dias);
                    System.out.println("El costo del auto #" + opcionCot + " por " + dias + " dias es: " + costo);
                    break;
                case 4:
                    System.out.println("Saliendo");
                default:
                    System.out.println("Opción no válida");
                    break;
            }
        }

    sc.close();
    }
    public static void mostrarLista(ArrayList<Vehiculo>listaV){
        int numeroVehiculo=1;
        for (Vehiculo v : listaV){
            System.out.println("Vehículo #" + numeroVehiculo + ":");
            v.impVehiculo();
            numeroVehiculo++;
        }
    }
}
