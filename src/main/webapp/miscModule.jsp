<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>Student Mark Filling (MISC)</title>
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
<div class="container">
    <c:if test="${not empty studentModules}">
        <table class="table table-striped table-hover" id="adminTable">
            <thead>
            <tr>
                <th>Student Name</th>
                <th>Address</th>
                <th>Module ID</th>
                <th>Module Name</th>
                <th>Academic Year</th>
                <th>Mark</th>
                <th>Pass/Fail</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="studentModule" items="${studentModules}">
                <tr>
                    <c:if test="${studentModule.moduleId == 'CT_6036'}">
                        <td>${studentModule.stuName} (${studentModule.stuId})</td>
                        <td>${studentModule.stuAddr}</td>
                        <td>${studentModule.moduleId}</td>
                        <td>${studentModule.moduleName}</td>
                        <td>${studentModule.academicYear}</td>
                        <td>
                            <c:choose>
                                <c:when test="${studentModule.mark == 0}">
                                    <span class="text-secondary">N/A</span>
                                </c:when>
                                <c:otherwise>
                                    <span>${studentModule.mark}</span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${studentModule.mark == 0}">
                                    <span class="text-secondary">N/A</span>
                                </c:when>
                                <c:when test="${studentModule.mark >= 40}">
                                    <span class="text-success">Pass</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="text-danger">Fail</span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </c:if>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:if>
</div>
<div class="wrapper">
    <form action="MiscModule" method="post">
        <div class="field">
            <input class="form-control" type="text" name="studentId" placeholder="Enter Student ID" aria-label="default input example">
            </br>
            <input class="form-control" type="text" name="studentMark" placeholder="Enter Student Mark" aria-label="default input example">
            </br>
            <input class="form-check-input" type="checkbox" value="" id="flexCheckCheckedDisabled" checked disabled>
            <label class="form-check-label" for="flexCheckCheckedDisabled">
                Managing Information Systems Change
            </label>
            </br>
            </br>
            <input type="submit" value="Submit" class="btn btn-secondary" />
        </div>
    </form>
</div>
</body>
</html>
