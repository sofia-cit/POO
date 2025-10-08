public class TrianguloEq {
    public static void main(String[] args) {
        if (args.length !=6) {
            System.out.println("Debes ingresar 6 valores (x1 y1 x2 y2 x3 y3)");
            return;
        }

        double x1 = Double.parseDouble(args[0]);
        double y1 = Double.parseDouble(args[1]);
        double x2 = Double.parseDouble(args[2]);
        double y2 = Double.parseDouble(args[3]);
        double x3 = Double.parseDouble(args[4]);
        double y3 = Double.parseDouble(args[5]);

        Punto p1 = new Punto(x1, y1);
        Punto p2 = new Punto(x2, y2);
        Punto p3 = new Punto(x3, y3);
        Mensaje msj = new Mensaje();

        Ventana vent = new Ventana(msj, p1, p2, p3);
        vent.setVisible(true);
    }
}