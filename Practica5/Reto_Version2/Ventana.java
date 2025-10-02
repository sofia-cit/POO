package Reto_Version2;
import javax.swing.*;
import java.awt.event.*;

public class Ventana extends JFrame {
    //botones
    private final JButton sumar, restar, multiplicar, dividir, igual,borrar;
    private final JButton[] numeros = new JButton[10];//arreglo de botones
    private JTextField pantalla; //pantalla de la calculadora
    private final Operaciones controlador;

    //variables de operaciones
    private double num1, num2;
    private String operador;

    public Ventana() {
        controlador = new Operaciones();
        setTitle("Calculadora");
        JLabel labelTitle = new JLabel("Calculadora Simple - Equipo 5");
        labelTitle.setBounds(150, 10, 200, 20);
        add(labelTitle);
        setSize(500, 350);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLayout(null);//no usar un layout predefinido

        //pantalla
        pantalla = new JTextField();
        pantalla.setBounds(50, 30, 310, 40);
        pantalla.setEditable(false);//Evita que el usuario escriba con el teclado
        add(pantalla);


        //botones numeros
        for (int i = 0; i < 10; i++) {
            numeros[i] = new JButton(String.valueOf(i));
            numeros[i].setBounds(50 + (i % 3) * 60, 100 + (i / 3) * 50, 50, 40);//coordenadas para botones
            add(numeros[i]);

            int num = i;
            numeros[i].addActionListener(new ActionListener() {
                public void actionPerformed(ActionEvent e) {
                    pantalla.setText(pantalla.getText() + num);
                }
            });
        }
        
        //boton borrar
        borrar = new JButton("borrar");
        borrar.setBounds(250, 250, 110, 40);
        add(borrar);
        borrar.addActionListener(e -> {
            pantalla.setText("");
            num1 = 0;
            num2 = 0;
            operador = null;
        });


        // Botones de operaciones
        sumar = new JButton("+");
        sumar.setBounds(250, 100, 50, 40);
        add(sumar);

        restar = new JButton("-");
        restar.setBounds(310, 100, 50, 40);
        add(restar);

        multiplicar = new JButton("*");
        multiplicar.setBounds(250, 150, 50, 40);
        add(multiplicar);

        dividir = new JButton("/");
        dividir.setBounds(310, 150, 50, 40);
        add(dividir);

        igual = new JButton("=");
        igual.setBounds(250, 200, 110, 40);
        add(igual);

        // Eventos de operaciones
        ActionListener operadorListener = new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                num1 = Double.parseDouble(pantalla.getText());
                operador = ((JButton) e.getSource()).getText();
                pantalla.setText("");
            
            }
        };

        sumar.addActionListener(operadorListener);
        restar.addActionListener(operadorListener);
        multiplicar.addActionListener(operadorListener);
        dividir.addActionListener(operadorListener);

        // Botón igual
        igual.addActionListener(e -> {

                num2 = Double.parseDouble(pantalla.getText());
                double res = 0;

                switch (operador) {
                    case "+": 
                        res = controlador.sumar(num1, num2); 
                        break;
                    case "-": 
                        res = controlador.restar(num1, num2); 
                        break;
                    case "*": 
                        res = controlador.multiplicar(num1, num2); 
                        break;
                    case "/":
                        res = controlador.dividir(num1, num2);
                        if (num2 == 0) {
                            pantalla.setText("Error - División por 0");
                            return;
                        }
                        break;
                }
                pantalla.setText(String.valueOf(res));
            
        });

        setVisible(true);
    }

}
