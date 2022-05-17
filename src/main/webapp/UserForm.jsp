<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="./contents/headerTags.jsp"/>
        <title>Cadastro</title>
    </head>
    <body>
        <div class="container">
            <div class="jumbotron">
                <h1>BookStore</h1>
                <p>Criar uma conta.</p>
            </div>
            <form action="<%=request.getContextPath()%>/bsuser/register" method="post">
                <div class="form-group">
                    <label for="nome">Username:</label>
                    <input type="text" class="form-control" name="nome" value="<c:out value='${user.fullname}'/>">
                </div>
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" class="form-control" name="email" value="<c:out value='${user.email}'/>">
                </div>
                <div class="form-group">
                    <label for="password">Senha:</label>
                    <input type="password" class="form-control" name="password" value="<c:out value='${user.password}' />">
                </div>
                <button type="submit" value="Enviar" class="btn btn-default"><span class="glyphicon glyphicon-plus"></span> Criar</button>
                <br><br>
                <a href="<%=request.getContextPath()%>/login">Já tem uma conta? Faça o login aqui!</a>
            </form>
            <br>
            <jsp:include page="./contents/rodape.jsp"/>
        </div>
    </body>
</html>