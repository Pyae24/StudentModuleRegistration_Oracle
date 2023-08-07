<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Student Mark Management System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="homestyle.css">
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
    <form action="SelectedModule" method="post">
        <div class="field">
            <input class="form-control" type="text" name="name" placeholder="Enter Student Name" aria-label="default input example">
            </br>
            <input class="form-control" type="text" name="address" placeholder="Enter Address" aria-label="default input example">
            </br>
            <select class="form-select" aria-label="Default select example" name="year">
                <option value="2021" selected>2021-2022</option>
                <option value="2022">2022-2023</option>
                <option value="2023">2023-2024</option>
            </select>
        </div>
        <h4 style="padding-bottom: 8px">BSc (Hons) Computing</h4>
        <div class="coursecheck">
            <input class="form-check-input" type="checkbox" name="ads" id="adscheck" value="Advanced Database Systems">
            <label class="form-check-label" for="adscheck">
                Advanced Database Systems
            </label>
        </div>
        <div class="coursecheck">
            <input class="form-check-input" type="checkbox" name="sc" id="sccheck" value="Secure Coding">
            <label class="form-check-label" for="sccheck">
                Secure Coding
            </label>
        </div>
        <div class="coursecheck">
            <input class="form-check-input" type="checkbox" name="csm" id="csmcheck" value="Cyber Security Management">
            <label class="form-check-label" for="csmcheck">
                Cyber Security Management
            </label>
        </div>
        <div class="coursecheck">
            <input class="form-check-input" type="checkbox" name="misc" id="mischeck" value="Managing Information Systems Change">
            <label class="form-check-label" for="mischeck">
                Managing Information Systems Change
            </label>
        </div>
        </br>
        <div class="btnRegister">
            <input type="submit" value="Register" class="btn btn-primary"/>
        </div>
    </form>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>
</html>