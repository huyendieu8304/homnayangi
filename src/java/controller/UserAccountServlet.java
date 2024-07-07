/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AccountDAO;
import dal.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import model.Account;
import model.Order;

/**
 *
 * @author BKC
 */
public class UserAccountServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UserAccountServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UserAccountServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

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
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        AccountDAO accountdb = new AccountDAO();
        Account a = accountdb.getAccountInfromation(account.getAccountId());

        request.setAttribute("account", a);
        request.getRequestDispatcher("accountDetail.jsp").forward(request, response);

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
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        AccountDAO accountdb = new AccountDAO();
        Account a = accountdb.getAccountInfromation(account.getAccountId());

        String username = request.getParameter("username");
        String oldpass = request.getParameter("oldpass");
        String newpass = request.getParameter("newpass");
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phonenumber");

        AccountDAO accountDb = new AccountDAO();

        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");

        try (PrintWriter out = response.getWriter()) {
            //user change username
            if (!a.getUsername().equals(username)) {
                if (accountDb.isUsernameExist(username)) {
                    // Check unique username
                    out.print("error|Tên người dùng đã tồn tại");
                    return;
                }
            }

            //user change password
            if (!oldpass.isEmpty()) {
                //wrong old password
                if (!oldpass.equals(a.getPassword())) {
                    out.print("error|Mật khẩu hiện tại không đúng");
                    return;
                }
            } else {
                newpass = a.getPassword(); //keep old password
            }

            //user change email
            if (!a.getEmail().equals(email)) {
                if (accountDb.isEmailExist(email)) {
                    // Check unique username
                    out.print("error|Email đã được sử dụng để đăng kí một tài khoản khác");
                    return;
                }
            }

            Account updateAccount = new Account(username, newpass, 2, fullname, phoneNumber, email);
            accountdb.updateAccountInfor(updateAccount, account.getAccountId());
            //update account successfully
            out.print("success|Cập nhật tài khoản thành công!");
        }
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
