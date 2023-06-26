package Control;

import module.Manage;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "reg",urlPatterns = "/reg")
public class severletRegister extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id= req.getParameter("id");
        String pass= req.getParameter("pass");
        String rs;
      if ( Manage.register(id,pass)){
          rs="Register Done";
      }else {
          rs="Register Fail";
      }
        req.setAttribute("rs",rs);
        RequestDispatcher dis = req.getRequestDispatcher("/afterLogin.jsp");
        dis.forward(req,resp);
    }
}
