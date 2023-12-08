package vn.edu.hcmuaf.fit.tool;

import javax.swing.*;
import javax.swing.border.EmptyBorder;
import javax.swing.border.LineBorder;
import javax.swing.border.TitledBorder;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class GUI extends JFrame {
    private Color backgroundColorHex = Color.decode("#222222");//#222222
    private GUI gui;
    private JPanel jPanelControl, jPanelControlInput, jPanelKey, jPanelResult, JPanelBtnResult, JPanelViewResult, jPanelcopyright;
    private JLabel jLabelKey;
    private JTextArea jTextAreaKey, jTextAreaInputString, jTextAreaViewResult;
    private JScrollPane jScrollPaneKey, jScrollPaneInput;
    private JButton jButtonSign;


    public GUI() {
        this.gui = gui;
        ImageIcon logoIcon = new ImageIcon("src\\main\\webapp\\img\\logo.png");
        setBackground(backgroundColorHex);
        UIManager.put("Label.foreground", Color.WHITE);
/*
jPanelControl
 */
        jPanelControl = new JPanel();
        add(jPanelControl, BorderLayout.CENTER);
        jPanelControl.setLayout(new BoxLayout(jPanelControl, BoxLayout.Y_AXIS));
//        jPanelControl.setBorder(new LineBorder(Color.WHITE, 2));
        jPanelControl.setPreferredSize(new Dimension(500, 500));
        //set backgroud cho JpannelControl
        jPanelControl.setBackground(backgroundColorHex);
        //add jPanlecontrol vào frame
        add(jPanelControl, BorderLayout.CENTER);
/*
JPannelControlInput
 */
        jPanelControlInput = new JPanel();
        jPanelControlInput.setLayout(new BoxLayout(jPanelControlInput, BoxLayout.X_AXIS));
        jPanelControlInput.setBorder(new EmptyBorder(5, 0, 10, 0));
        jPanelControlInput.setBackground(backgroundColorHex);
        jPanelControlInput.setPreferredSize(new Dimension(500, 200));
        jPanelControlInput.setMinimumSize(new Dimension(500, 200));
        jPanelControlInput.setMaximumSize(new Dimension(500, 200));

        // tạo  jTextAreaInputString
        jTextAreaInputString = new JTextArea();

        jTextAreaInputString.setRows(50); // Đặt số hàng xuống dòng mà bạn muốn hiển thị
        jTextAreaInputString.setWrapStyleWord(true);
        jTextAreaInputString.setLineWrap(true);

        jScrollPaneInput = new JScrollPane(jTextAreaInputString);
        TitledBorder titledBorder = new TitledBorder("Input here");
        jScrollPaneInput.setBorder(titledBorder);

        jPanelControlInput.add(jScrollPaneInput);
        jPanelControl.add(jPanelControlInput);
/*
tạo jpannel key
 */
        jPanelKey = new JPanel();
        jPanelKey.setBackground(backgroundColorHex);
        jPanelKey.setLayout(new BoxLayout(jPanelKey, BoxLayout.X_AXIS));
        jPanelKey.setPreferredSize(new Dimension(500, 100));
        jPanelKey.setMinimumSize(new Dimension(500, 150));
        jPanelKey.setMaximumSize(new Dimension(500, 150));


        jTextAreaKey = new JTextArea();
//        jTextAreaKey.setBorder(new EmptyBorder(10, 20, 10, 20));

        jTextAreaKey.setRows(50); // Đặt số hàng xuống dòng mà bạn muốn hiển thị
        jTextAreaKey.setWrapStyleWord(true);
        jTextAreaKey.setLineWrap(true);

        jScrollPaneKey = new JScrollPane(jTextAreaKey);
        TitledBorder titledBorder1 = new TitledBorder("KEY");
        jScrollPaneKey.setBorder(titledBorder1);
//        jScrollPaneKey.setBorder(new EmptyBorder(5, 10, 5, 10));
//        jPanelKey.add(jLabelKey);
        jPanelKey.add(jScrollPaneKey);
        jPanelControl.add(jPanelKey);

/*
Tạo Jpanel jPanelResult
 */
        jPanelResult = new JPanel();
        jPanelResult.setPreferredSize(new Dimension(300, 500));
        //jPanelView.setBorder(new LineBorder(Color.WHITE));

        jPanelResult.setBackground(backgroundColorHex);
        // ad các component cho jPanelView

        //add jpannelView vào frame
        add(jPanelResult, BorderLayout.EAST);
/*
tạo jPanelViewOfBtn
 */
        JPanelBtnResult = new JPanel();
        JPanelBtnResult.setPreferredSize(new Dimension(300, 40));
        JPanelBtnResult.setMaximumSize(new Dimension(300, 40));
        JPanelBtnResult.setBackground(backgroundColorHex);


        jButtonSign = new JButton("Sign");
        jButtonSign.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                try {
                    sign();
                } catch (Exception ex) {
                    throw new RuntimeException(ex);
                }
            }
        });
        //
        jPanelResult.add(jButtonSign);
        //
        jPanelResult.add(JPanelBtnResult, BorderLayout.CENTER);
/*
tạo jPanelViewresult
 */

        JPanelViewResult = new JPanel();
        JPanelViewResult.setPreferredSize(new Dimension(300, 388));

        jTextAreaViewResult = new JTextArea("frame displays the results");
        Font customFont = new Font("Times New Roman", Font.BOLD, 14);
        jTextAreaViewResult.setFont(customFont);
        jTextAreaViewResult.setPreferredSize(new Dimension(280, 378));
        jTextAreaViewResult.setBackground(Color.black);
        jTextAreaViewResult.setForeground(Color.YELLOW);
        JPanelViewResult.add(jTextAreaViewResult);
        jTextAreaViewResult.setRows(10); // Đặt số hàng xuống dòng mà bạn muốn hiển thị
        jTextAreaViewResult.setWrapStyleWord(true);
        jTextAreaViewResult.setLineWrap(true);

        JPanelViewResult.setBorder(new LineBorder(Color.WHITE, 2));
//        JPanelViewResult.setBorder(new EmptyBorder(5,10,5,10));
        JPanelViewResult.setBackground(Color.black);
        jPanelResult.add(JPanelViewResult, BorderLayout.SOUTH);
/*
jPanelcopyright
 */
        jPanelcopyright = new JPanel();

        jPanelcopyright.setBackground(Color.LIGHT_GRAY);
        JLabel copyrightLabel = new JLabel("PetsShop Electronic Signature Version 1.0 (C) 2023 . All rights reserved.");
        jPanelcopyright.add(copyrightLabel);
        add(jPanelcopyright, BorderLayout.SOUTH);
/*

 /*
     set frame
  */
        setTitle("PetsShop Electronic Signature Version 1.0");
        setSize(840, 500);
        setIconImage(logoIcon.getImage());
        setDefaultCloseOperation(EXIT_ON_CLOSE);
        setLocationRelativeTo(null);
        setResizable(false);
        setVisible(true);
    }

    public void sign() throws Exception {
        String input = jTextAreaInputString.getText();
        System.out.println(input);
        String key = jTextAreaKey.getText();
        DSA dsa = new DSA();
        if (input == null || input.trim().isEmpty()) {
            JOptionPane.showMessageDialog(null, "input null", "Error", JOptionPane.ERROR_MESSAGE);
        }
        String text=dsa.bytesToBase64(dsa.sign(input,dsa.importKey(key,"DSA")));
        jTextAreaViewResult.setText(text);
    }

    public static void main(String[] args) {
        GUI gui = new GUI();
    }
}
