public class CalcularDistancia {
    public static void main (String [] args){
        int x1 = Integer.parseInt(args[0]);
        int y1 = Integer.parseInt(args[1]);
        int x2 = Integer.parseInt(args[2]);
        int y2 = Integer.parseInt(args[3]);

        Punto p1 = new Punto(x1,y1);
        Punto p2 = new Punto(x2,y2);
        Distancia d = new Distancia(p1, p2);

        Mensaje msj = new Mensaje();

        Ventana vent = new Ventana(msj, p1, p2, d); // va a llamar a d.dist adentro de msj, solo hay que pasarle el objeto y solido accede a su dist

        vent.setVisible(true);

    }
}
