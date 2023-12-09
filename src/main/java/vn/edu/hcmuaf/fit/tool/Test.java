package vn.edu.hcmuaf.fit.tool;

import java.io.File;

public class Test {
    public static void main(String[] args) {
        File file=new File("src\\main\\webapp\\WEB-INF\\Petshop_website_final_war.jar");
        if(file.exists()){
            System.out.println("tồn tại");
        }else {
            System.out.println("không tồn tại");
        }
    }
}
