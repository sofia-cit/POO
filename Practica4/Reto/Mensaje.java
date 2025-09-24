public class Mensaje {

    public String generarMensaje(Punto p1, Punto p2, Punto p3) {
        double lado1 = p1.distancia(p2);
        double lado2 = p2.distancia(p3);
        double lado3 = p3.distancia(p1);

        String resultado;

        //Comprobar si los tres lados son iguales
        double epsilon=0.001;//pequeña tolerancia (epsilon) para comparar doubles
        if (Math.abs(lado1 - lado2)<epsilon && Math.abs(lado2 - lado3) < epsilon) {
            resultado="El triangulo ES equilatero.";
        } else {
            resultado = "El triangulo NO es equilatero.";
        }

        return "Punto A: " + p1 + "\n"
            + "Punto B: " + p2 + "\n"
            + "Punto C: " + p3 + "\n\n"
            + "Longitud Lado AB: " + String.format("%.2f", lado1) + "\n" //acortamos a 2 decimales
            + "Longitud Lado BC: " + String.format("%.2f", lado2) + "\n"
            + "Longitud Lado CA: " + String.format("%.2f", lado3) + "\n\n"
            + resultado;
    }
}