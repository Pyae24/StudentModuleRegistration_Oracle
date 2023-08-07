<%--
  Created by IntelliJ IDEA.
  User: phone
  Date: 5/9/2023
  Time: 1:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Individual Result</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="moduleStyles.css">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="index.jsp">
            <img src="images/school_logo.svg" alt="Logo" width="100" height="87">
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        &nbsp;
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="lecturerLogin.jsp">Lecturer</a>
                </li>
                &nbsp;
                <li class="nav-item">
                    <a class="nav-link" href="adminLogin.jsp">Admin</a>
                </li>
                &nbsp;
                <li class="nav-item">
                    <a class="nav-link" href="individualResult.jsp">Result</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="wrapper">
    <form action="StudentResult" method="post">
        <div class="field">
            <input class="form-control" type="text" name="studentName" placeholder="Enter Student Name" aria-label="default input example">
            </br>
            <input type="submit" value="Submit" class="btn btn-secondary" />
        </div>
    </form>
</div>
</body>
</html>
