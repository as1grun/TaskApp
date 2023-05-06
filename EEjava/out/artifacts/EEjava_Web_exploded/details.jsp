<%@ page import="java.util.ArrayList" %>
<%@ page import="db.DBManager" %>
<%@ page import="model.Tasks" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Details</title>
    <%@include file="bootstrap.jsp" %>
</head>
<body>
<%
    Tasks tasks = (Tasks) request.getAttribute("task");

%>
<%@include file="header.jsp"%>
<br>
<form action="/update" method="post">
    <div class="container">
        <div class="mt-2 mb-2">
            <input type="hidden" name="id" value="<%=tasks.getId()%>">
            <label class="form-label">NAME:</label>
            <input class="form-control" type="text" value="<%=tasks.getName()%>" name="taskName">
        </div>
        <div class="mt-2 mb-2">
            <label class="form-label">DESCRIPTION:</label>
            <textarea class="form-control" name="taskDescription"><%=tasks.getDescription()%></textarea>
        </div>
        <div class="mt-2 mb-2">
            <label class="form-label">DEADLINE DATE:</label>
            <input class="form-control" type="date" value="<%=tasks.getDeadlineDate()%>" name="taskDate">
        </div>
        <div class="mt-2 mb-2">
            <label class="form-label">STATUS:</label>
            <select class="form-control" name="taskStatus">
                <option value="true" <% if (tasks.isStatus()==true){%>selected<%}%>>YES</option>
                <option value="false" <% if (tasks.isStatus()==false){%>selected<%}%>>NO</option>
            </select>
        </div>
        <br>
        <div style="display: flex">
            <div><button type="submit" class="btn btn-success btn-sm">UPDATE</button></div>
            <div style="margin-left: 20px;">
                <button type="button" class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    DELETE
                </button>
            </div>
        </div>
    </div>
</form>
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form action="/delete" method="post">
                <div class="modal-body">
                    <input type="hidden" name="id" value="<%=tasks.getId()%>">
                    <h1> ARE YOU SURE ?</h1>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">NO</button>
                    <button type="submit" class="btn btn-danger">YES</button>
                </div>
                </form>
            </div>
        </div>
    </div>


</body>
</html>
