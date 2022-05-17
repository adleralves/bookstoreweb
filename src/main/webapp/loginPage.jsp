<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="./contents/headerTags.jsp"/>
        <title>Login</title>
    </head>
    <body>
        <div class="container">
            <div class="jumbotron">
                <h1>BookStoreWeb</h1>
                <p>Admin Login</p>
            </div>
            <div style="text-align: center">
                <form action="login" method="post">
                    <label for="email">Email:</label>
                    <input name="email" size="30" />
                    <br><br>
                    <label for="password">Password:</label>
                    <input type="password" name="password" size="30" />
                    <!--
                    Esse atributo MESSAGE será utilizado como retorno de
                   mensagem ao usuário caso
                    login inválido.
                    -->
                    <br>${message}<br>
                    <a href="<%=request.getContextPath()%>/bsuser/new">Não tem uma conta? Crie uma agora!</a>
                    <br><br>
                    <button type="submit">Login</button>
                    <br><br>
                </form>
            </div>
            <jsp:include page="./contents/rodape.jsp"/>
        </div>
    </body