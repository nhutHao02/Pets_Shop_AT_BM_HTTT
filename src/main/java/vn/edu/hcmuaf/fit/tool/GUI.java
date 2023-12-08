package vn.edu.hcmuaf.fit.tool;

import javax.swing.*;
import javax.swing.border.EmptyBorder;
import javax.swing.border.LineBorder;
import javax.swing.border.TitledBorder;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;

public class GUI extends JFrame {
    private final JLabel jLabelIputString;
    private Color backgroundColorHex = Color.decode("#222222");//#222222
    private GUI gui;
    private JPanel jPanelControl, jPanelControlInput, jPanelKey, jPanelResult, JPanelBtnResult, JPanelViewResult, jPanelcopyright;
    private JLabel jLabelKey;
    private JTextArea jTextFieldKey, inputString, jTextAreaViewResult;
    private JScrollPane jScrollPaneKey,jScrollPaneInput;
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
        jPanelControlInput.setBorder(new EmptyBorder(5, 10, 5, 10));
        jPanelControlInput.setBackground(backgroundColorHex);
        jPanelControl.add(jPanelControlInput);
        jPanelControlInput.setPreferredSize(new Dimension(500, 200));
        jPanelControlInput.setMaximumSize(new Dimension(500, 200));

        // tạo jLabelIputString
        jLabelIputString = new JLabel("Input string");
        jLabelIputString.setBorder(new EmptyBorder(0, 0, 0, 50));

        // tạo  inputString
        inputString = new JTextArea();

        jScrollPaneInput = new JScrollPane(inputString);
        TitledBorder titledBorder = new TitledBorder("Input here");
        jScrollPaneInput.setBorder(titledBorder);

        jPanelControlInput.add(jScrollPaneInput);
/*
tạo jpannel key
 */
        jPanelKey = new JPanel();
        jPanelKey.setBackground(backgroundColorHex);
        jPanelKey.setLayout(new BoxLayout(jPanelKey, BoxLayout.X_AXIS));
        jPanelKey.setPreferredSize(new Dimension(500, 100));
        jPanelKey.setMinimumSize(new Dimension(500, 150));
        jPanelKey.setMaximumSize(new Dimension(500, 150));

        jLabelKey = new JLabel("Key");
//        jLabelKey.setForeground(Color.WHITE);
        jLabelKey.setBorder(new EmptyBorder(5, 0, 5, 100));
        jTextFieldKey = new JTextArea();
        jTextFieldKey.setBorder(new EmptyBorder(10, 20, 10, 20));

        jTextFieldKey.setRows(10); // Đặt số hàng xuống dòng mà bạn muốn hiển thị
        jTextFieldKey.setWrapStyleWord(true);
        jTextFieldKey.setLineWrap(true);

        jScrollPaneKey = new JScrollPane(jTextFieldKey);
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


        jButtonSign = new JButton("Very");
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
        setSize(840, 500);
        setIconImage(logoIcon.getImage());
        setDefaultCloseOperation(EXIT_ON_CLOSE);
        setLocationRelativeTo(null);
        setResizable(false);
        setVisible(true);
    }

    public static void main(String[] args) {
        GUI gui = new GUI();
    }
}
