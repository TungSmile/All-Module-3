package Control;

import module.Manage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "login", urlPatterns = "/login")
public class severletLogin extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        String pass = req.getParameter("pass");
        String rs;
        if (Manage.check(id, pass)) {
            rs = "Done";
            req.setAttribute("rs", rs);
            RequestDispatcher dispatcher = req.getRequestDispatcher("/afterLogin.jsp");
            dispatcher.forward(req,resp);
        } else {
            resp.sendRedirect("/Logina.jsp");
        }

    }
}
