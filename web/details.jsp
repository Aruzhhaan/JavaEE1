<%@ page import="model.Tasks" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 04.05.2023
  Time: 22:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</head>
<body>
<%
    Tasks tasks = (Tasks) request.getAttribute("detailsTask");
%>
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
    <div class = "container">
        <form action ="/update" method="post">
        <div class="mt-2 mb-2">
            <input type="hidden" name="id" value="<%=tasks.getId()%>">
            <label class="form-label">Наименование:</label>
            <input class="form-control" type="text" value="<%=tasks.getName()%>" name="taskName">
        </div>
        <div class="mt-2 mb-2">
            <label class="form-label">Описание:</label>
            <textarea class ="form-control" name="taskDescription"> <%=tasks.getDescription()%> </textarea>
        </div>
        <div class="mt-2 mb-2">
            <label class="form-label">Крайний срок:</label>
            <input class="form-control" type="date" value="<%=tasks.getDeadlineDate()%>" name="taskDeadlineDate">
        </div>
        <div class="mt-2 mb-2">
            <label class="form-label">Выполнено:</label>
            <select class ="form-control" name="taskStatus">
                <option value="true" <%if (tasks.isStatus()==true){%>selected<%}%>>Да</option>
                <option value="false"<%if (tasks.isStatus()==false){%>selected<%}%>>Нет</option>
            </select>
        </div>
        <br>
        <div style="display: flex">
            <div><button class="btn btn-primary">Сохранить</button></div>
            <div style="margin-left: 15px" >
                <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal">>Удалить</button>
            </div>

    </div>
        </form>
        <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="staticBackdropLabel">Modal title</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form action="/delete" method="post">
                    <div class="modal-body">
                        <input type="hidden" name="id" value="<%=tasks.getId()%>">
                        <h3>Точно удалить?</h3>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Закрыть</button>
                        <button type="submit" class="btn btn-danger">Удалить</button>
                    </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
