import java.util.Scanner;

public class Practica1_2 {
    
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int opcion;
        
        do {
            // Mostrar menú
            System.out.println("\nMENÚ:");
            System.out.println("1. Factorial");
            System.out.println("2. Fibonacci");
            System.out.println("3. Secuencia de Collatz");
            System.out.println("4. Salir");
            System.out.print("Seleccione una opción (1-4): ");
            
            opcion = scanner.nextInt();
            
            switch (opcion) {
                case 1:
                    System.out.println("Ingrese el número para calcular su factorial: ");
                    int numFactorial = scanner.nextInt();
                    if (numFactorial < 0) {
                        System.out.println("Error: No puede calcularse para numeros negativos");
                    } else {
                        long resultadoFactorial = factorial(numFactorial);
                        System.out.println("El factorial de " + numFactorial + " es: " + resultadoFactorial);
                    }
                    break;
                    
                case 2:
                    System.out.print("Ingrese la posición en la secuencia de Fibonacci: ");
                    int numFibonacci = scanner.nextInt();
                    
                    if (numFibonacci < 0) { // Control de excepciones:
                        System.out.println("Error: La posición debe ser un número positivo");
                    } else {
                        //Implementación de for para mostrar secuencia completa
                        for(int i=0;i<numFibonacci;i++){
                            System.out.print(fibonacci(i)+ " ");
                        }
                    }
                    break;
                    
                case 3:
                    System.out.print("Ingrese un numero para secuencia de Collatz: ");
                    int numCollatz = scanner.nextInt();
                    collatz(numCollatz);
                    System.out.println();
                    break;
                    
                case 4:
                    System.out.println("Saliendo del programa...");
                    break;
                    
                default:
                    System.out.println("Opción no válida. Por favor, seleccione una opción del 1 al 4.");
            }
            
        } while (opcion != 4);
        
        scanner.close();
    }

    public static long factorial(int n) {
        if (n == 0 || n == 1) { // Casos base 
            return 1;
        }
        return n * factorial(n - 1); // aplica recursividad con n-1
    }

    public static long fibonacci(int n) {
        // Casos base 0 y 1
        if (n == 0) {
            return 0;
        } else if (n == 1) { 
            return 1; 
        }
        //caso promedio
        return fibonacci(n - 1) + fibonacci(n - 2); // aplicando recursividad con las reglas de fibonacci
        }
    public static void collatz(int n){
        System.out.print(n + " ");
    if (n == 1) { // Caso base
            return; 
        } else if (n%2==0) { // si es par, se divide entre 2 
            collatz(n/2);
        } else { // si es impar, se mult. por 3 y se le suma 1
            collatz(3*n+1);
        }
        
        }
    }


