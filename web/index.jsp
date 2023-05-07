<%@ page import="model.Tasks" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="db.DBManager" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 04.05.2023
  Time: 17:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</head>
<body>
<div class="container">
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">TASK MANAGER</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="#">Все задания</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <br>
    <!-- Button trigger modal -->
    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
        + Добавить задание
    </button>

    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Новое задание</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                 <form action="/addTask" method="post">
                    <div class="modal-body">
                        <div class="mt-2 mb-2">
                            <label class="form-label">Наименование:</label>
                            <input class="form-control" type="text" name="taskName">
                        </div>
                        <div class="mt-2 mb-2">
                            <label class="form-label">Описание:</label>
                            <textarea class="form-control"
                                      name="taskDescription">
                        </textarea>
                        </div>
                        <div class="mt-2 mb-2">
                            <label class="form-label">Крайний срок:</label>
                            <input class="form-control" type="date" name="taskDeadlineDate">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Закрыть</button>
                        <button type="submit" class="btn btn-primary">Добавить</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <br><br>

    <table class="table table-striped">
        <thead>
        <tr>
            <th scope="col">ID</th>
            <th scope="col">Наименование</th>
            <th scope="col">Крайний срок</th>
            <th scope="col">Выполнено</th>
            <th scope="col">Детали</th>
        </tr>
        </thead>
        <tbody>
        <%
            ArrayList<Tasks> tasks = DBManager.getAllTasks();
            for (int i = 0; i < tasks.size(); i++) {
        %>
        <tr>
            <td><%=tasks.get(i).getId()%></td>
            <td><%=tasks.get(i).getName()%></td>
            <td><%=tasks.get(i).getDeadlineDate()%></td>
            <td>
                <%
                    if (tasks.get(i).isStatus()==true){
                %>
                Да
                <%}else{%>
                Нет
                <%}%>
            </td>
            <td>
                <a href="/details?id=<%=tasks.get(i).getId()%>" class="btn btn-primary">Детали</a>
            </td>
        </tr>
        <%}%>
        </tbody>
    </table>
</div>
</body>
</html>