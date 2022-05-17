<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="./contents/headerTags.jsp"/>
        <title>BookStore</title>
    </head>
    <body>                              
        <div class="container">
            <jsp:include page="./contents/cabecalho.jsp"/> 
            <jsp:include page="./contents/menu.jsp"/>
            <c:if test="${book != null}">
                <form class="form-horizontal" action="update" method="post">
                </c:if>
                <c:if test="${book == null}">
                    <form class="form-horizontal" action="insert" method="post">
                    </c:if>
                    <caption>
                        <h2>
                            <c:if test="${book != null}">
                                Editar Livro
                            </c:if>
                            <c:if test="${book == null}">
                                Adicionar novo Livro
                            </c:if>
                        </h2>
                    </caption>
                    <c:if test="${book != null}">
                        <input type="hidden" name="formId" value="<c:out
                                   value='${book.id}' />" />
                    </c:if>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="titulo"><span class="glyphicon glyphicon-book"></span> Livro:</label>
                        <div class="col-sm-10">
                            <input type="text" name="formTitulo" class="form-control" value="<c:out value='${book.titulo}' />" placeholder="Informe o nome do livro"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-sm-2" for="pwd"><span class="glyphicon glyphicon-user"></span> Autor:</label>
                        <div class="col-sm-10">
                            <input type="text" name="formAutor" class="form-control" value="<c:out value='${book.autor}' />" placeholder="Informe o nome do autor"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-sm-2" for="pwd"><span class="glyphicon glyphicon-usd"></span> Preço:</label>
                        <div class="col-sm-10">
                            <input type="text" name="formPreco" class="form-control" value="<c:out value='${book.preco}' />" placeholder="Informe o preço"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" value="Enviar" ><span class="glyphicon glyphicon-send"></span>  Enviar </button>
                        </div>
                    </div>
                </form>
                <jsp:include page="./contents/rodape.jsp"/>
        </div>
    </body>
</html>