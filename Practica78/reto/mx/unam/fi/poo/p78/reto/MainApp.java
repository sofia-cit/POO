//javac mx/unam/fi/poo/p78/reto/*.java
//java mx/unam/fi/poo/p78/reto/MainApp

package mx.unam.fi.poo.p78.reto;
import java.util.ArrayList;
public class MainApp{
    public static void main (String [] args){
        ArrayList <Material> materiales  = new ArrayList<>();
        
        Libro lib = new Libro ("Emma", "Jane Austen", 1815, 624);
        Libro lib2 = new Libro ("Mindhunter", "John Douglas", 1995, 424);
        Revista rev = new Revista("Vogue México", "Karla Martínez de Salas", 210, 1,9,2024);
        Dvd cd = new Dvd("Clueless", "Amy Heckerling", 1995, 97, "Inglés");
        Dvd cd2 = new Dvd("Cars", "Disney Pixar", 2006, 117, "Español");

        materiales.add(lib);
        materiales.add(rev);
        materiales.add(cd);
        materiales.add(lib2);
        materiales.add(cd2);

        System.out.println("----Biblioteca Multimedia----");
        System.out.println("material disponible: ");
        for(Material i : materiales){
            i.mostrarInformacion();
        }
    }
}