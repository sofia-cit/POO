import java.util.ArrayList;

public class Articulo {
    //atributos
    String articulo;
    double precio;
    ArrayList <Articulo> lista = new ArrayList<>(); 
    //constructor
    public Articulo(String articulo, double precio){
        this.articulo=articulo;
        this.precio=precio;
    }
    //metodos
    public void printArticulo(){
        System.out.print(articulo);
        System.out.println("\tPrecio: " + precio);
    }
}
