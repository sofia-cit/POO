// javac mx/unam/fi/poo/g1/proyecto2/*java 
// java mx/unam/fi/poo/g1/proyecto2/MainApp

package mx.unam.fi.poo.g1.proyecto2;

import java.util.ArrayList;
import java.util.List;

public class MainApp {
    public static void main(String[] args) {
        List<Empleado> nomina = new ArrayList<>();
        EmpleadoAsalariado eA1 = new EmpleadoAsalariado("Maria", "López", "456987123", 15000.00);
        EmpleadoPorComision eC1 = new EmpleadoPorComision("Pedro", "García", "789321654", 50000.00, 0.15);

        nomina.add(eA1);
        nomina.add(eC1);
        
        System.out.println("la nómina actual tiene "+ nomina.size() + " empleados");
        System.out.println("nomina actual:");
        int numEmpleado=1;
        for (Empleado empleadoActual : nomina) {
            System.out.println("--------------------------");
            System.out.print(numEmpleado+". ");
            System.out.println(empleadoActual); 
            double ingresos = empleadoActual.ingresos();
            System.out.printf("cálculo de ingresos:" + ingresos+ "\n");
            numEmpleado++;
        }
    }
}