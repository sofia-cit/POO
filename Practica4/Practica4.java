public class Practica4 {
    public static void main (String [] args){

        //castear los args de string a int
        int x1 = Integer.parseInt(args[0]);
        int y1 = Integer.parseInt(args[1]);
        int x2 = Integer.parseInt(args[2]);
        int y2 = Integer.parseInt(args[3]);

        Punto p1 = new Punto(x1, y1);
        Punto p2 = new Punto(x2, y2);


        Mensaje msj = new Mensaje();


        Ventana vent = new Ventana(msj, p1, p2);
        vent.setVisible(true);


    }
}
