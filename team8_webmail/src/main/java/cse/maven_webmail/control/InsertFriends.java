/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cse.maven_webmail.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author jihun
 */
@WebServlet(name = "InsertFriend", urlPatterns = {"/InsertFriend"})
public class InsertFriends extends HttpServlet {

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
            final String JdbcDriver = "com.mysql.cj.jdbc.Driver";
            // serverTimezone을 설정하는게 책과 다른 부분임.
            final String JdbcUrl = "jdbc:mysql:///james?serverTimezone=Asia/Seoul";
            final String User = "team1";
            final String Password = "wlgns852";

            try {
                // 1. JDBC 드라이버 적재
                Class.forName(JdbcDriver);

                // 2. Connection 객체 생성
                Connection conn = DriverManager.getConnection(JdbcUrl, User, Password);

                // 3. PreparedStatement 객체 생성
                String sql = "INSERT INTO addr_book VALUES(?, ?, ?)";
                PreparedStatement pstmt = conn.prepareStatement(sql);

                // 4. SQL 문 완성
                request.setCharacterEncoding("UTF-8");  // 한글 인식
                String owner = request.getParameter("owner_email");   // 주 키(Primary key)
                String friend = request.getParameter("friend_email");
                if (!(owner == null) && !owner.equals("") && !(friend == null) && !friend.equals("")) {

                    String nick_name = request.getParameter("nick_name");
                  
                    pstmt.setString(1, owner);
                    pstmt.setString(2, nick_name);
                    pstmt.setString(3, friend);

                    // 5. 실행 : PreparedStatement.executeUpdate()는
                    // INSERT, UPDATE,또는 DELETE시 사용 가능하다.
                    pstmt.executeUpdate();
                }else{
                   
                 
                }
                // 6. 자원 해제
                pstmt.close();
                conn.close();

                response.sendRedirect("addr_book.jsp");

            } catch (IOException | ClassNotFoundException | SQLException ex) {
                out.println("오류가 발생했습니다. (발생 오류 : " + ex.getMessage()
                        + ")");
                out.println("<br/><a href=\"main_menu.jsp\">돌아 가기</a>");
            }
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
