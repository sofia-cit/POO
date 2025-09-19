import java.util.ArrayList;
public class Carrito {
    ArrayList <Articulo> lista = new ArrayList<Articulo>(); 


    public void agregarArticulo(Articulo art){
        lista.add(art);
        System.out.println("Se agregó el artículo "+ art.articulo);
    }

    public void eliminarArticulo(int indArticulo){
        Articulo temp = lista.get(indArticulo-1);
        System.out.println("Se eliminó el artículo " + temp.articulo);
        lista.remove(indArticulo-1);
    }

    public void printLista(){
        System.out.println("Lista de compras: ");
        if(lista.isEmpty()){
            System.out.println("No hay artículos");
        }else{
            int numArt=1;
            for (Articulo artTemp :lista){
                System.out.print("Artículo " + numArt +": ");
                artTemp.printArticulo();
                numArt++;
            }
        }
    }
}
