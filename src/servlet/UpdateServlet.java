package servlet;

import db.DBManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Tasks;

import java.io.IOException;

@WebServlet(value="/update")
public class UpdateServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        String name = req.getParameter("taskName");
        String desc = req.getParameter("taskDescription");
        String deadlineDate = req.getParameter("taskDeadlineDate");
        String status = req.getParameter("taskStatus");

        Tasks task = new Tasks(Long.parseLong(id),name,desc,deadlineDate,Boolean.parseBoolean(status));

        DBManager.updateTask(Long.parseLong(id),task);
        resp.sendRedirect("/home");


    }
}
