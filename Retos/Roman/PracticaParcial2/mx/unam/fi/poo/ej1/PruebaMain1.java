/*
javac mx/unam/fi/poo/ej1/*.java
java mx/unam/fi/poo/ej1/PruebaMain1
*/
package mx.unam.fi.poo.ej1;

public class PruebaMain1 {
    public static void main(String[] args) {
        Coche c1 = new Coche("AB2323", "Versa", 1500, 4);
        c1.mostrarDetalleAlquiler();
        c1.mostrarDetalleAlquiler(3);
        Camioneta cam1 = new Camioneta("NFL0705", "Ford3000", 6000, 1.5);
        cam1.mostrarDetalleAlquiler();
        cam1.mostrarDetalleAlquiler(2);
    }
}
