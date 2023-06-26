package com.example.jamebt1;

import java.io.*;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "helloServlet", value = "/hello-servlet")
public class HelloServlet extends HttpServlet {
    public static ArrayList list = new ArrayList<>();


    public void init() {

    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        list.add(new client("hoàn", new Date(83, 8, 20), "hn", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWnFnnkvHeDTBUcFCIqG5rj9HuT4vcYlixZw&usqp=CAU"));
        list.add(new client("nam", new Date(83, 8, 21), "bg", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWnFnnkvHeDTBUcFCIqG5rj9HuT4vcYlixZw&usqp=CAU"));
        list.add(new client("hoà", new Date(83, 8, 22), "nd", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWnFnnkvHeDTBUcFCIqG5rj9HuT4vcYlixZw&usqp=CAU"));
        list.add(new client("khao", new Date(83, 8, 17), "ht", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWnFnnkvHeDTBUcFCIqG5rj9HuT4vcYlixZw&usqp=CAU"));
        list.add(new client("thi", new Date(83, 8, 19), "hn", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWnFnnkvHeDTBUcFCIqG5rj9HuT4vcYlixZw&usqp=CAU"));
        request.setAttribute("listClient", list);
        RequestDispatcher rd=request.getRequestDispatcher("/index");
        rd.forward(request,response);
    }

    public void destroy() {
    }
}