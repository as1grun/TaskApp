package servlets;

import db.DBManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Tasks;

import java.io.IOException;

@WebServlet(value = "/details")
public class DetailsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        Long task_id = null;
        try {
            task_id = Long.parseLong(id);
        }catch (Exception e){
            e.printStackTrace();
        }
       Tasks task = DBManager.getTask(task_id);
        request.setAttribute("task",task);
        if (task!=null){
            request.getRequestDispatcher("details.jsp").forward(request,response);
        }
    }
}
