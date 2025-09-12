import javax.swing.*;
import java.awt.event.*;

public class Ventana extends JFrame{

    JButton boton;
    Mensaje msj;

    //constructor

    public Ventana (Mensaje msj, Punto p1, Punto p2, Distancia d){
        this.msj=msj;
        setTitle("Practica 3 - Calculadora de distancia");
        setSize(300,200);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLocationRelativeTo(null);
        boton = new JButton("Calcular la distancia");
        boton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e){
                String mensaje = msj.mensaje(p1, p2, d);
                JOptionPane.showMessageDialog(null, mensaje);
            }
        });
        add(boton);

    }
    
}
