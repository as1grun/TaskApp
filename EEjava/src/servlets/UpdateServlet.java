package servlets;

import db.DBManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Tasks;

import java.io.IOException;

@WebServlet(value = "/update")
public class UpdateServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String name = request.getParameter("taskName");
        String desc = request.getParameter("taskDescription");
        String deadline = request.getParameter("taskDate");
        String status = request.getParameter("taskStatus");

        Tasks task = new Tasks(Long.parseLong(id),name,desc,deadline,Boolean.parseBoolean(status));

        DBManager.updateTask(Long.parseLong(id),task);
         response.sendRedirect("/home");

    }

}
