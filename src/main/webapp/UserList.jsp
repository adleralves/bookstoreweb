<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="./contents/headerTags.jsp"/>
        <title>Lista de usuarios</title>
    </head>
    <body>
                <div class="container">  
            <jsp:include page="./contents/cabecalho.jsp"/>
            <jsp:include page="./contents/menu.jsp"/>
            <div class="table-responsive">
                <table class="table table-hover">
                    <caption><h2>Lista de usuarios</h2></caption>
                    <tr>
                        <th><span class="glyphicon glyphicon-th-list"></span> ID</th>
                        <th><span class="glyphicon glyphicon-envelope"></span> E-mail</th>
                        <th><span class="glyphicon glyphicon-user"></span> Username</th>
                    </tr>

                    <c:forEach var="user" items="${listaUser}">
                        <tr>
                            <td><c:out value="${user.id}" /></td>
                            <td><c:out value="${user.email}" /></td>
                            <td><c:out value="${user.fullname}" /></td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
            <jsp:include page="./contents/rodape.jsp"/>
        </div>
    </body>
</html>
