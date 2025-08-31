package Reto;

import java.util.Scanner;

public class TrianguloPascal {
    public static void main(String[] args) {
        Scanner e=new Scanner(System.in);
	    System.out.print("Ingresa el numero de filas del triangulo de pascal que quieres ver: ");
	    int n= e.nextInt();
        int[] pascal = new int[n];
        int[] aux = new int[n];

        for (int i = 0; i < n; i++) {
            //Asignacion valores
            for (int j = 0; j <= i; j++) {      
                if (j == 0 || j == i) { //Casos base 0 y n
                    pascal[j] = 1;
                } else { //Caso promedio
                    pascal[j] = aux[j - 1] + aux[j];
                }
            }

            for (int j = 0; j <= i; j++) {
                System.out.print(pascal[j] + " ");
            }
            System.out.println();

            //Copia de pascal en arreglo auxiliar
            for (int k = 0; k <= i; k++) {
                aux[k] = pascal[k];
            }
        }
        e.close();
    }
    
}
