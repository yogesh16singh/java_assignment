<%@ page isELIgnored="false" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
      <%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>





        <!doctype html>
        <html lang="en">

        <head>
          <!-- Required meta tags -->
          <meta charset="utf-8">
          <meta name="viewport" content="width=device-width, initial-scale=1">

          <!-- Bootstrap CSS -->
          <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
          <link rel="stylesheet" href="./css/style.css">
          <title>Hello, world!</title>
        </head>

        <body>
          <%@include file="WEB-INF/jspf/signupheader.jspf" %>
            <div class="container">
              <h1 class="Y_L_h1">Enter Your Details</h1>
              <form>
                <div class="mb-3">
                  <label for="exampleInputEmail1" class="form-label">Email address</label>
                  <input type="email" name="email" class="form-control" id="exampleInputEmail1"
                    aria-describedby="emailHelp">
                  <!-- <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div> -->
                </div>
                <div class="mb-3">
                  <label for="exampleInputPassword1" class="form-label">Password</label>
                  <input type="password" name="password" class="form-control" id="exampleInputPassword1">
                </div>

                <button type="submit" class="btn btn-primary">Submit</button>
              </form>



            </div>

            <sql:setDataSource driver="com.mysql.jdbc.Driver" var="db" url="jdbc:mysql://localhost:3306/student"
              user="root" password="8209" />
            <sql:query var="rs" dataSource="${db}">select * from data</sql:query>

            <c:forEach items="${rs.rows}" var="row">

              <c:choose>
                <c:when test="${row.email == param.email && row.password == param.password}">
                  <c:set var="email" scope="session" value="${row.email}"></c:set>
                  <c:set var="first_name" scope="session" value="${row.firstname}"></c:set>
                  <c:set var="last_name" scope="session" value="${row.lastname}"></c:set>
                  <c:set var="email" scope="session" value="${row.email}"></c:set>
                  <c:set var="registertime" scope="session" value="${row.registredtime}"></c:set>
                  <c:redirect url="index.jsp"></c:redirect>
                </c:when>
                <c:otherwise>
                </c:otherwise>
              </c:choose>

            </c:forEach>


            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
              integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
              crossorigin="anonymous"></script>

            <!-- Option 2: Separate Popper and Bootstrap JS -->
            <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    -->
        </body>

        </html>