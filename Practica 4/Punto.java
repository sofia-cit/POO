public class Punto {
    //Atributos
    int x, y = 0; //inicializarlos en ceros

    //constructor
    public Punto(int x, int y){
        this.x=x;
        this.y=y;
    }
    public String toString (){
        return "("+x+", "+y + ")";
    }
}