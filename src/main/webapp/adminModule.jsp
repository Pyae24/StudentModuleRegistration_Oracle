<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>All Student Information</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="studentOverviewStyle.css">
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
    <div class="container">
        <h5>Choose Year to show Students who have passed their modules!</h5>
        <!-- Creating select form to view passed students for specific academic year -->
        <select class="form-select form-select-sm" id="yearSelect" onchange="yearSearch()">
            <option value="ALL_YEARS">All Years</option>
            <option value="2021">2021</option>
            <option value="2022">2022</option>
            <option value="2023">2023</option>
        </select>
        <br>
        <!-- Creating student information table for admin view -->
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
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:if>
        <p id="resultParagraph"></p>
    </div>
</div>
<div class="wrapper">
    <div class="container">
        <h5>Total number of students passed in Each Course Each Year</h5>
<table class="table table-striped table-hover">
    <thead>
    <tr>
        <th>Course</th>
        <th>Academic Year</th>
        <th>Passed Students</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="sMmodel" items="${sMModel}">
        <tr>
            <td>BSc (Hons) Computing</td>
            <td>${sMmodel.academicYear}</td>
            <td>${sMmodel.passedStudentsCount}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
    </div>
</div>
<script type="application/javascript">
    function yearSearch() {
        let selectBox, selectedValue, table, tr, yearCell, markCell, passCell;

        selectBox = document.getElementById("yearSelect");
        selectedValue = selectBox.value.toUpperCase();
        table = document.getElementById("adminTable");
        tr = table.getElementsByTagName("tr");

        let yearPassedCount = 0;

        // Loop through all the table rows, starting from index 1 (skipping the table header row)
        for (let i = 1; i < tr.length; i++) {
            yearCell = tr[i].getElementsByTagName("td")[4]; // Academic year cell
            markCell = tr[i].getElementsByTagName("td")[5]; // Mark cell
            passCell = tr[i].getElementsByTagName("td")[6]; // Pass/Fail cell

            if (yearCell && markCell && passCell) {
                let yearValue = yearCell.textContent || yearCell.innerText;
                let markValue = markCell.textContent || markCell.innerText;

                // Check if the selected value is "All Years" or matches the academic year, and if the student passed
                if ((selectedValue === "ALL_YEARS")) {
                    tr[i].style.display = ""; // Show the row
                    if (markValue >= 40) {
                        yearPassedCount++;
                    }
                } else if ((selectedValue === "" || yearValue.toUpperCase() === selectedValue) && markValue >= 40) {
                    tr[i].style.display = ""; // Show the row
                    yearPassedCount++;
                } else {
                    tr[i].style.display = "none"; // Hide the row
                }
            }
        }
    }
</script>
</body>
</html>
