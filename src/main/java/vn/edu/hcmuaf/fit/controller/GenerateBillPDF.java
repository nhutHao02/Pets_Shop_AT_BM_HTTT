package vn.edu.hcmuaf.fit.controller;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.Barcode128;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import vn.edu.hcmuaf.fit.beans.OrderDetail;
import vn.edu.hcmuaf.fit.beans.Orders;
import vn.edu.hcmuaf.fit.beans.UserAccount;
import vn.edu.hcmuaf.fit.services.OrderService;
import vn.edu.hcmuaf.fit.services.ProductService;
import vn.edu.hcmuaf.fit.services.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;
import java.text.NumberFormat;
import java.util.List;
import java.util.Locale;

@WebServlet(name = "GenerateBillPDF", value = "/admin/GenerateBillPDF")
public class GenerateBillPDF extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=\"invoice.pdf\"");
        NumberFormat format = NumberFormat.getInstance(new Locale("vn", "VN"));
        String idOrder = request.getParameter("idO");
        List<OrderDetail> listOd = OrderService.getInstance().getOrderDetailsById(idOrder);
        Orders order = OrderService.getInstance().getOrderByIdOrder(idOrder);
        UserAccount custommer = UserService.getInstance().getUserDetail(order.getCustomerID());
        Document document = new Document();
        try {
            PdfWriter writer = PdfWriter.getInstance(document, response.getOutputStream());
            document.open();
            // Add content to PDF document
            File fontFile = new File(request.getServletContext().getAttribute("FONT_DIR") + File.separator + "Arial Unicode MS.ttf");
            BaseFont unicodeFont = BaseFont.createFont(fontFile.getAbsolutePath(), BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
            Font font = new Font(unicodeFont, 12, Font.NORMAL, BaseColor.BLACK);

            Paragraph title = new Paragraph("HOÁ ĐƠN BÁN HÀNG", font);
            title.setAlignment(Element.ALIGN_CENTER);
            document.add(title);

            Chunk chunk = new Chunk(idOrder, new Font(Font.FontFamily.HELVETICA, 12, Font.NORMAL));
            Barcode128 barcode = new Barcode128();
            barcode.setCode(chunk.getContent());
            Image image = barcode.createImageWithBarcode(writer.getDirectContent(), BaseColor.BLACK, BaseColor.BLACK);
            chunk = new Chunk(image, 0, 0, true);
            document.add(chunk);

            // phần thông tin khách hàng
            Paragraph customerInfo = new Paragraph("Tên khách hàng: " + custommer.getName() + "\nSố điện thoại: " + custommer.getPhone() + "\nEmail: " + custommer.getEmail() + "\nĐịa chỉ: " + order.getAddress() + "\nNgày đặt: " + order.getOrderDate() + "\n\n", font);
            customerInfo.setSpacingBefore(20);
            document.add(customerInfo);

            // phần chi tiết hóa đơn
            float[] columnWidths = {0.75f, 1f, 4.5f, 1f, 2.75f};
            PdfPTable detail = new PdfPTable(5);
            detail.setWidths(columnWidths);
            detail.setHorizontalAlignment(Element.ALIGN_CENTER); // đặt vị trí của bảng ở giữa trang
            detail.setWidthPercentage(100);
            detail.addCell(new Phrase("STT", font));
            detail.addCell(new Phrase("Mã SP", font));
            detail.addCell(new Phrase("Tên SP", font));
            detail.addCell(new Phrase("Số lượng", font));
            detail.addCell(new Phrase("Giá", font));
            int i = 0;
            for (OrderDetail item : listOd) {
                detail.addCell(String.valueOf(i += 1));
                detail.addCell(new Phrase(item.getProductID(), font));
                detail.addCell(new Phrase(item.getProductName(), font));
                detail.addCell(new Phrase(String.valueOf(item.getQuantity()), font));
                if (ProductService.getInstance().getProductDetail(item.getProductID()).getPromotional() == 1) {
                    detail.addCell(new Phrase(String.valueOf(format.format(item.getQuantity() * (ProductService.getInstance().getProductDetail(item.getProductID()).getPrice() - (ProductService.getInstance().getProductDetail(item.getProductID()).getPrice() * ProductService.getInstance().getProductDetail(item.getProductID()).getPromotionalPrice() / 100)))), font));
                } else {
                    detail.addCell(new Phrase(String.valueOf(format.format(item.getPrice())), font));
                }
            }
            document.add(detail);

            Paragraph total = new Paragraph("Tổng số tiền: " + format.format(order.getPrice()) + "đ", font);
            total.setAlignment(Element.ALIGN_RIGHT);
            document.add(total);
        } catch (DocumentException e) {
            throw new RuntimeException(e);
        }
        document.close();
    }
}
