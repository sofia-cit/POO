package mx.unam.fi.poo.p78.reto;

public class Revista extends Libro {
    private int dia, mes;
    //constructor
    public Revista(String titulo, String autor, int paginas, int dia, int mes, int anio){
        super(titulo, autor, anio, paginas);
        setDia(dia);
        setMes(mes);
    }

    public int getDia() {
        return dia;
    }
    public void setDia(int dia) {
        if(dia>0 && dia<32){
        this.dia = dia;
        }else{
            System.out.println("Día no válido");
        }
 
    }
    public int getMes() {
        return mes;
    }
    public void setMes(int mes) {
        if(mes>0 && mes<13){
        this.mes = mes;
        }else{
            System.out.println("mes no válido");
        }
    }

    //metodos
    @Override
    public void mostrarInformacion(){
        System.out.println("---Revista---");
        System.out.println("Nombre: " + getTitulo());
        System.out.println("Autor: " + getAutor());
        System.out.println("Fecha de publicacion: " + getDia() + "/" + getMes() +"/" + getAnio());
        System.out.println("Número de páginas: " + getPaginas());
    }
}
