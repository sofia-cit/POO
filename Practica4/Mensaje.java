public class Mensaje {
    public String mensaje(Punto p1, Punto p2){
        return ("Punto A : " + p1 + "\n"
                + "Punto B : " + p2 + "\n"
                + "La distancia entre p1 y p2 es: "+  p1.distancia(p1, p2) + "\n");
    }
}