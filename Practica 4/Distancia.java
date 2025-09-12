public class Distancia {
    double dist;
    public Distancia(Punto p1, Punto p2){
        this.dist=Math.hypot((p2.x-p1.x),(p2.y-p1.y));
    }

}
