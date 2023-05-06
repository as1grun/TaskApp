package servlets;

import db.DBManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(value = "/delete")
public class DeleteServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String id = request.getParameter("id");
        Long taskId = null;
        try {
            taskId = Long.parseLong(id);
        }catch (Exception e){
            e.printStackTrace();
        }

        DBManager.deleteTask(taskId);
        response.sendRedirect("/home");

    }
}
