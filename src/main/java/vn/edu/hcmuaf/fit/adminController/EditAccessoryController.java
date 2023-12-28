package vn.edu.hcmuaf.fit.adminController;

import vn.edu.hcmuaf.fit.beans.UserAccount;
import vn.edu.hcmuaf.fit.dao.ProductDAO;
import vn.edu.hcmuaf.fit.services.LogService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Arrays;

@WebServlet(name = "EditAccessoryController", value = "/admin/edit-accessory")
public class EditAccessoryController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String pid = request.getParameter("id");
        String pname = request.getParameter("name");
        String pprice = request.getParameter("price");
        String PromotionalPrice = request.getParameter("PromotionalPrice");
        String pdescription = request.getParameter("description");
        String detail = request.getParameter("detail");
        String mausac = request.getParameter("mausac");
        String cateChild = request.getParameter("cateChild");
        String Promotional = request.getParameter("Promotional");
        String pquantity = request.getParameter("quantity");
        String size = request.getParameter("size");
        String status = request.getParameter("status");
        String oldImg = request.getParameter("oldImg");
        String[] imgFile = request.getParameterValues("imgFile[]");
        UserAccount admin = (UserAccount) request.getSession().getAttribute("admin");
        HttpSession session = request.getSession();
        ProductDAO dao = new ProductDAO();
        String cate = "3";
        System.out.println(pid);
        if (pid.length() < 1) {
            String id = dao.insertAccessory(admin.getId(),pname,pprice,pdescription,detail,pquantity,mausac,cateChild,status,Promotional,PromotionalPrice, imgFile, size);
            removeOldImg(oldImg, request);
            copyImage(request, imgFile);

            LogService logService= new LogService();
            UserAccount userAccount = (UserAccount) request.getSession().getAttribute("admin");
            logService.createUserLog(userAccount.getId(), "INFOR", "Admin "+userAccount.getUsername()+" đã thêm "+dao.getProductDetail(id).getProductName()+" làm sản phẩm phụ kiện mới");
        } else {
            dao.updateAccessory(pid,admin.getId(),pname,pprice,pdescription,detail,pquantity,mausac,cateChild, status,Promotional,PromotionalPrice, imgFile, size);
            removeOldImg(oldImg, request);
            copyImage(request, imgFile);

            LogService logService= new LogService();
            UserAccount userAccount = (UserAccount) request.getSession().getAttribute("admin");
            logService.createUserLog(userAccount.getId(), "INFOR", "Admin "+userAccount.getUsername()+" đã chỉnh sửa sản phẩm phụ kiện "+dao.getProductDetail(pid).getProductName());
        }
        response.sendRedirect("list-accessory");
    }
    private void removeOldImg(String oldImg, HttpServletRequest request) {
        if (oldImg.length() > 0) {
            String[] splited = oldImg.split(",");
            System.out.println(Arrays.toString(splited));
            for (String split : splited) {
                File fileInServer = new File(request.getServletContext().getAttribute("TEMPPRODUCT_DIR") + File.separator + split);
                if (fileInServer.exists())
                    fileInServer.delete();
                File fileInLocal = new File(request.getServletContext().getAttribute("FILEPRODUCT_DIR") + File.separator + split);
                if (fileInLocal.exists())
                    fileInLocal.delete();
            }
        }
    }

    public void copyImage(HttpServletRequest request, String[] imgFile) throws IOException {
        if (imgFile != null) {
            File file = new File(request.getServletContext().getAttribute("TEMPPRODUCT_DIR") + File.separator + imgFile);
            FileInputStream fis = new FileInputStream(file);
            File local = new File(request.getServletContext().getAttribute("FILEPRODUCT_DIR") + File.separator + imgFile);
            FileOutputStream fos = new FileOutputStream(local);
            byte[] bytes = new byte[1024];
            int read;
            while ((read = fis.read(bytes)) != -1) {
                fos.write(bytes, 0, read);
            }
            fis.close();
            fos.close();
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }
}
