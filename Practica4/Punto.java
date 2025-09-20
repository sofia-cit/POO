public class Punto {

    // Atributos
    int x =0;
    int y = 0;

    //Métodos
    //Imprimirlo
    public String toString(){
        return "(" + x + ", " + y +")";
    }
    //calcular distancia
    public double distancia (Punto p1, Punto p2){
        return Math.hypot((p2.x-p1.x), (p2.y-p1.y));
    }
    //Constructores
    public Punto (){} //Inicializarlo sin argumentos (va a inicializar en los valores anteriores)
    //constructor con argumentos
    public Punto (int x, int y){
        this.x=x;
        this.y=y;
    }
}