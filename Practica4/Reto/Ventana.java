import javax.swing.*;
import java.awt.event.*;

public class Ventana extends JFrame {
    JButton boton;
    Mensaje msj;

    public Ventana(Mensaje msj, Punto p1, Punto p2, Punto p3) {
        this.msj = msj;
        setTitle("verifcador de triángulo equilátero");
        setSize(350, 200);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLocationRelativeTo(null);

        boton = new JButton("Verificar Triángulo");
        boton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                //Genera el mensaje usando los tres puntos
                String mensaje = msj.generarMensaje(p1, p2, p3);
                JOptionPane.showMessageDialog(null, mensaje);
            }
        });
        add(boton);
    }
}