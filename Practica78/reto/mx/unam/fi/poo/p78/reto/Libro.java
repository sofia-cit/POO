package mx.unam.fi.poo.p78.reto;

public class Libro extends Material {
    //atributo nuevo ed la clase
    private int paginas;
    //constructor
    public Libro(String titulo, String autor, int anio, int paginas){
        super(titulo, autor, anio);
        setPaginas(paginas);
    }
    //getters y setter¿s
    public void setPaginas(int paginas){
        this.paginas=paginas;
    }
    public int getPaginas(){
        return paginas;
    }

    //metodos
    @Override
    public void mostrarInformacion(){
        System.out.println("---Libro---");
        super.mostrarInformacion();
        System.out.println("Número de páginas: " + getPaginas());
    }

}
