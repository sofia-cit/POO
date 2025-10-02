package Reto_Version1;
import javax.swing.*;
import java.awt.event.*;
public class Ventana extends JFrame {
    //Implementacion grafica de la calculadora
    private JButton sumar, restar, multiplicar, dividir;//Botones
    private JTextField num1, num2, resultado;//Campos de texto
    private Operaciones controlador;//Objeto Operaciones

    public Ventana() {
        //Constructor de la ventana
        controlador = new Operaciones();
        setTitle("Calculadora");
        setSize(500, 300);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLayout(null);

        //Elementos de la ventana

        //titulo
        JLabel labelTitle = new JLabel("Calculadora Simple - Equipo 5");
        labelTitle.setBounds(150, 10, 200, 20);
        add(labelTitle);
  

        //etiqueta num1
        JLabel label1 = new JLabel("Número 1:");
        label1.setBounds(50, 50, 100, 30);
        add(label1);
        //campo de texto num1
        num1 = new JTextField();
        num1.setBounds(150, 50, 150, 30);
        add(num1);

        //etiqueta num2
        JLabel label2 = new JLabel("Número 2:");
        label2.setBounds(50, 90, 100, 30);
        add(label2);

        //campo de texto num2
        num2 = new JTextField();
        num2.setBounds(150, 90, 150, 30);
        add(num2);

        //Botones de operaciones
        sumar = new JButton("Sumar");
        sumar.setBounds(50, 140, 80, 30);
        add(sumar);


        restar = new JButton("Restar");
        restar.setBounds(140, 140, 80, 30);
        add(restar);

        multiplicar = new JButton("Multiplicar");
        multiplicar.setBounds(230, 140, 100, 30);
        add(multiplicar);

        dividir = new JButton("Dividir");
        dividir.setBounds(340, 140, 80, 30);
        add(dividir);

        //Resultado
        JLabel labelResultado = new JLabel("Resultado:");
        labelResultado.setBounds(50, 190, 100, 30);
        add(labelResultado);

        resultado = new JTextField();
        resultado.setBounds(150, 190, 150, 30);
        resultado.setEditable(false);
        add(resultado);

        //Acciones de los botones
        sumar.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                double a = Double.parseDouble(num1.getText());
                double b = Double.parseDouble(num2.getText());
                double res = controlador.sumar(a, b);
                resultado.setText(String.valueOf(res));
            }
        });
        restar.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                double a = Double.parseDouble(num1.getText());
                double b = Double.parseDouble(num2.getText());
                double res = controlador.restar(a, b);
                resultado.setText(String.valueOf(res));
            }
        });
        multiplicar.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                double a = Double.parseDouble(num1.getText());
                double b = Double.parseDouble(num2.getText());
                double res = controlador.multiplicar(a, b);
                resultado.setText(String.valueOf(res));
            }
        });
        dividir.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                double a = Double.parseDouble(num1.getText());
                double b = Double.parseDouble(num2.getText());
                double res = controlador.dividir(a, b);
                if (res != -1) {
                    resultado.setText(String.valueOf(res));
                } else {
                    resultado.setText("Error - División por 0");
                }
            }
        });

        //Hacer visible la ventana
        setVisible(true);
    }
}