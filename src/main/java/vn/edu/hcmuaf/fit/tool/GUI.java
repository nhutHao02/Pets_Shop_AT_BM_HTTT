package vn.edu.hcmuaf.fit.tool;

import javax.swing.*;

public class GUI extends JFrame {
    public GUI() {
        setSize(500, 300);
        setDefaultCloseOperation(EXIT_ON_CLOSE);
        setLocationRelativeTo(null);
        setEnabled(true);
    }

    public static void main(String[] args) {
        GUI gui=new GUI();
    }
}
