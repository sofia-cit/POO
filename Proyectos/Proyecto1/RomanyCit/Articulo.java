public class Articulo {
    //atributos
    String articulo;
    double precio;
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
