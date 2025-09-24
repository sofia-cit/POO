public class TrianguloEq {
    public static void main(String[] args) {
        if (args.length !=6) {
            System.out.println("Error: Debes proporcionar 6 valores (x1 y1 x2 y2 x3 y3)");
            return; 
        }


        int x1 = Integer.parseInt(args[0]);
        int y1 = Integer.parseInt(args[1]);
        int x2 = Integer.parseInt(args[2]);
        int y2 = Integer.parseInt(args[3]);
        int x3 = Integer.parseInt(args[4]);
        int y3 = Integer.parseInt(args[5]);

        Punto p1 = new Punto(x1, y1);
        Punto p2 = new Punto(x2, y2);
        Punto p3 = new Punto(x3, y3);
        Mensaje msj = new Mensaje();

        Ventana vent = new Ventana(msj, p1, p2, p3);
        vent.setVisible(true);
    }
}