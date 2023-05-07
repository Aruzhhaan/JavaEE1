package servlet;

import db.DBManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Tasks;

import java.io.IOException;

@WebServlet(value="/details")
public class DetailsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        Long taskId = null;
        try {
         taskId = Long.parseLong(id);
        }catch(Exception e) {
            e.printStackTrace();
        }
        Tasks task = DBManager.getTask(taskId);
        req.setAttribute("detailsTask", task);

        if(task !=null){
            req.getRequestDispatcher("details.jsp").forward(req,resp);
        }
    }
}
