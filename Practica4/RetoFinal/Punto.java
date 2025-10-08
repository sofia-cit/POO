public class Punto {
    double x = 0;
    double y = 0;
    public Punto(double x, double y){
        this.x = x;
        this.y = y;
    }
    @Override
    public String toString() {
        return "(" + String.format("%.2f", x) + ", " + String.format("%.2f", y) + ")";
    }
    public double distancia(Punto otroPunto) {
        return Math.hypot(otroPunto.x - this.x, otroPunto.y - this.y);
    }
}