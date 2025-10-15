package mx.unam.fi.poo.p78.reto;

public abstract class Material{
    //atributos
    private String titulo;
    private String autor;
    private int anio;
    //constructor
    public Material(String titulo, String autor, int anio){
        setAutor(autor);
        setTitulo(titulo);
        setAnio(anio);
    }
    //getters y setters

    public void setTitulo(String titulo){
        this.titulo=titulo;
    }
    public String getTitulo(){
        return titulo;
    }
    public void setAutor(String autor){
        this.autor=autor;
    }
    public String getAutor(){
        return autor;
    }
    public void setAnio(int anio){
        this.anio=anio;
    }
    public int getAnio(){
        return anio;
    }

    //metodos
    public void mostrarInformacion(){
        System.out.println("Nombre: " + getTitulo());
        System.out.println("Autor: " + getAutor());
        System.out.println("Año de publicacion: " + getAnio());
    }
}