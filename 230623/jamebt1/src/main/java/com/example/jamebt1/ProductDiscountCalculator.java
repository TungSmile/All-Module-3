package com.example.jamebt1;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "pdc", urlPatterns = "/pdc")
public class ProductDiscountCalculator extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ;
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String des = req.getParameter("Description");
        float price = Float.parseFloat(req.getParameter("Price"));
        float rate = Float.parseFloat(req.getParameter("Percent"));
        double discountAmount = price * rate * 00.1;
        double discountPrice = price - discountAmount;
        String str = des + " Giá :" + price + " Tỷ lệ : " + rate + " đc chiết : "
                + discountAmount + " Giá sau chiết : " + discountPrice;
        req.setAttribute("str", str);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/display-discount.jsp");
        dispatcher.forward(req, resp);
    }
}
