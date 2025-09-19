import java.util.Scanner;

public class Proyecto {
    public static void main (String [] args){
        Scanner sc = new Scanner (System.in);
        Carrito carr = new Carrito();
        // Articulo art1 = new Articulo("Manzana 1kg", 35);
        // carr.agregarArticulo(art1);

        System.out.println("Bienvenido al carrito de compras");
        int opcion;
        do{
            System.out.println("\n---Menú, sewlecciona una opcion---");
            System.out.println("1. Ver lista de compras");
            System.out.println("2. Agregar artículo");
            System.out.println("3. ELiminar artículo");
            System.out.println("4. Salir");
            opcion =sc.nextInt();
            sc.nextLine();
            switch (opcion) {
                case 1:
                    carr.printLista();
                    break;
                case 2:
                    System.out.println("NOmbre del articulo: ");
                    String nomArt=sc.nextLine();
                    System.out.println("Precio del articulo: ");
                    Double precioArt=sc.nextDouble();
                    Articulo art = new Articulo(nomArt, precioArt);
                    carr.agregarArticulo(art);
                    break;
                case 3:
                    carr.printLista();
                    System.out.println("Ingresa el numero de artículo a eliminar: ");
                    int elim = sc.nextInt();
                    carr.eliminarArticulo(elim);
                    break;
                case 4:
                    System.out.println("Saliendo...");
                    break;
                default:
                System.out.println("opcion no valida");
                    break;
            }

        }while(opcion!=4);
        sc.close();
    }

}
