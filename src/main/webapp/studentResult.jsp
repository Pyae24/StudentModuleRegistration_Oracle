<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Result</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="studentResultStyle.css">
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
    <!-- Creating student information table for the inserted name from the individualResult.jsp -->
    <div class="field">
        <c:if test="${not empty studentModules}">
            <p style="font-weight: bold; margin-left: 8px">Name: ${studentModules[0].stuName} (${studentModules[0].stuId})</p>
            <div class="container">
                <table class="table table-striped">
                    <thead>
                    <tr>
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
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </c:if>
        <c:if test="${empty studentModules}">
            <p>No student found with that name.</p>
        </c:if>
    </div>
</div>
</body>
</html>