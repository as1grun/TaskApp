<%@ page import="java.util.ArrayList" %>
<%@ page import="db.DBManager" %>
<%@ page import="model.Tasks" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Task List</title>
    <%@include file="bootstrap.jsp"%>
</head>
<body>
<%@include file="header.jsp"%>

    <div class="container">
        <button type="button" style="color: white; background-color: #0a073b; " class="btn btn-sm" data-bs-toggle="modal" data-bs-target="#exampleModal">
            +Add task
        </button>

            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <form action="/addtask" method="post">
                            <div class="modal-body">
                                <div class="mt-2 mb-2">
                                    <label class="form-label">NAME:</label>
                                    <input class="form-control" type="text" name="task_name">
                                </div>
                                <div class="mt-2 mb-2">
                                    <label class="form-label">DESCRIPTION:</label>
                                    <textarea class="form-control"  name="task_description"></textarea>
                                </div>
                                <div class="mt-2 mb-2">
                                    <label class="form-label">DEADLINE DATE:</label>
                                    <input class="form-control" type="date" name="task_date">
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-primary">+Add new</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

    <table class="table">
        <thead>
        <tr>
            <th scope="col">ID</th>
            <th scope="col">Name</th>
            <th scope="col">Deadline</th>
            <th scope="col">Status</th>
            <th scope="col">Details</th>
        </tr>
        </thead>
        <tbody>
        <%
            ArrayList<Tasks> tasksArrayList = DBManager.getAllTasks();
            for (int i = 0; i < tasksArrayList.size(); i++) {
        %>
        <tr>
            <td><%=tasksArrayList.get(i).getId()%></td>
            <td><%=tasksArrayList.get(i).getName()%></td>
            <td><%=tasksArrayList.get(i).getDeadlineDate()%></td>
            <td>
                <%
                    if (tasksArrayList.get(i).isStatus()==true){
                %>
                YES
                <%}else {%>
                NO
                <%}%>
            </td>
            <td>
                <a href="/details?id=<%=tasksArrayList.get(i).getId()%>" style="color: white; background-color: #0a073b; " class="btn btn-sm">DETAILS</a>
            </td>
        </tr>
        <%}%>
        </tbody>
    </table>
    </div>
</body>
</html>
