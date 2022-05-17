/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package local.adler.bookstoreweb.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import local.adler.bookstoreweb.model.bean.User;
import local.adler.bookstoreweb.model.dao.UserDAO;

/**
 *
 * @author devsys-a
 */
public class LoginServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String auxEmail = request.getParameter("email");
        String auxPw = request.getParameter("password");

        UserDAO userDao = new UserDAO();

        try {
            User user = userDao.checkLogin(auxEmail, auxPw);
            //Define destino padrão (pagina de login)
            String destPage = "/loginPage.jsp";

            if (user != null) {
                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                destPage = "/bstore/list";
                Logger.getLogger(UserDAO.class.getName()).log(Level.INFO,
                        "Usuario Logado: {0}", user.getEmail() + " | "
                        + user.getFullname());
            } else {
                
                String msgAux = "Email ou Password inválido!!!";
                request.setAttribute("message", msgAux);
                
                Logger.getLogger(UserDAO.class.getName()).log(Level.INFO,
                        "Erro Login: {0}", auxEmail);
            }
            
            RequestDispatcher dispatcher = request.getRequestDispatcher(destPage);
            dispatcher.forward(request, response);
            
        } catch (ServletException ex){
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE,
                    "Servlet Exception na LoginServlet. {0}", ex);
            throw new ServletException(ex);
        }
    }
    
    /**
     * Explicando o código
     * Linha 40 & 41 = capturam do formulário os input's email e password.
     * 
     * Linha 46 = Carrega o metodo checkLogin enviando os dados de email e password
     * Retorna um User caso sucesso ou null caso falha de login.
     * 
     * Linha 50 = se user != null..
     * 
     * Linha 51 = cria uma session na linha 51
     * 
     * Linha 52 = "Pendura" um par de chave(key-value) nome "user" conteúdo user.
     * 
     * Linha 58 = Define mensagem de erro caso metodo checkLogin null.
     */

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
