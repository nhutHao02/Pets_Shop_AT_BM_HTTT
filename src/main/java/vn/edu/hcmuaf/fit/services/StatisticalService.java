package vn.edu.hcmuaf.fit.services;

import vn.edu.hcmuaf.fit.beans.Orders;
import vn.edu.hcmuaf.fit.beans.Product;
import vn.edu.hcmuaf.fit.dao.OrderDAO;

import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.Map;

public class StatisticalService {
    OrderDAO dao = new OrderDAO();
    public int totalCustomer() {
        return dao.totalCustomer();
    }

    public int totalRevenue() {
        return dao.totalRevenue();
    }
    public int totalOrder() {
        return dao.totalOrder();
    }
    public int totalProduct() {
        return dao.totalProduct();
    }

    public int totalProSold() {
        return dao.totalProSold();
    }

    public int totalOrderCancel() { return dao.totalOrderCancel();}
    public List<Orders> Last5Order() {
        return dao.Last5Order();
    }

    public List<Product> Top10ProductBestSeller() {
        return dao.Top10ProductBestSeller();
    }

    public List<Map<String, Integer>> StatisticalComment() {
        return dao.StatisticalComment();
    }
    public List<Map<String, Object>> MonthlyChart() {
        return dao.MonthlyChart();
    }

    public List<Map<String, Object>> SaleChartinWeek() {
        return dao.SaleChartinWeek();
    }
}
