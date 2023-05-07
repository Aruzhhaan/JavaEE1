package servlet;
import db.DBManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Tasks;

import java.io.IOException;


@WebServlet(value = "/addTask")
public class AddTaskServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("taskName");
        String desc = req.getParameter("taskDescription");
        String deadlineDate = req.getParameter("taskDeadlineDate");

        Tasks task = new Tasks();
        task.setName(name);
        task.setDescription(desc);
        task.setDeadlineDate(deadlineDate);
        task.setStatus(false);

        DBManager.addTask(task);
        resp.sendRedirect("/home");
    }
}
