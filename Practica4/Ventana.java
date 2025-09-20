import javax.swing.*;
import java.awt.event.*;
public class Ventana extends JFrame {
    JButton boton;
    Mensaje msj;

    public Ventana(Mensaje msj, Punto p1, Punto p2){
        this.msj = msj;
        setTitle("Práctica 3");
        setSize(300,200);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLocationRelativeTo(null); 

        boton= new JButton("Calcular la distancia");
        boton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String mensaje = msj.mensaje(p1, p2);
                JOptionPane.showMessageDialog(null, mensaje);
            }
        });

        // Añade el botón a la ventana (JFrame)
        add(boton);

    }
    
}

