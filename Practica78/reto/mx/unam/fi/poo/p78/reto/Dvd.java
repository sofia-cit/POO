package mx.unam.fi.poo.p78.reto;

public class Dvd extends Material {
    //constructor
    private int duracion;
    private String idioma;
    public Dvd(String titulo, String autor, int anio, int duracion, String idioma){
        super(titulo, autor, anio);
        setDuracion(duracion);
        setIdioma(idioma);
    }
    public int getDuracion() {
        return duracion;
    }
    public void setDuracion(int duracion) {
        if(duracion>0){
            this.duracion = duracion;
        }else{
            System.out.println("Duracion no válida");
        }
    }
    public String getIdioma() {
        return idioma;
    }
    public void setIdioma(String idioma) {
        this.idioma = idioma;
    }
    

    @Override
    public void mostrarInformacion(){
        System.out.println("---Dvd---");
        super.mostrarInformacion();
        System.out.println("Duración: " + getDuracion() + " minutos");
        System.out.println("Idioma: " + getIdioma());
    }
}
