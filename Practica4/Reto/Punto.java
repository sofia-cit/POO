public class Punto {
    int x = 0;
    int y = 0;
    public Punto(int x, int y){
        this.x = x;
        this.y = y;
    }
    @Override//Método para representar el punto como un String
    public String toString() {
        return "(" + x + ", " + y + ")";
    }
    public double distancia(Punto otroPunto) {
        return Math.hypot(otroPunto.x - this.x, otroPunto.y - this.y);
    }
}