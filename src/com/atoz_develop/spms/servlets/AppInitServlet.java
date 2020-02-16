package com.atoz_develop.spms.servlets;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class AppInitServlet extends HttpServlet {
    // init() : 서블릿 객체가 생성될때 최초로 호출
    @Override
    public void init(ServletConfig config) throws ServletException {
        System.out.println("AppInitServlet.init() called");
        super.init(config);

        // 모든 서블릿이 사용할 수 있도록 ServletContext 인스턴스에 저장
        ServletContext sc = this.getServletContext();

        try {
            Class.forName(sc.getInitParameter("driver"));
            Connection conn = DriverManager.getConnection(
                    sc.getInitParameter("url"),
                    sc.getInitParameter("username"),
                    sc.getInitParameter("password")
            );

            sc.setAttribute("conn", conn);
        } catch (Throwable e) {
            throw new ServletException(e);
        }
    }

    // destroy() : 서블릿이 언로드될때(서버 종료, 웹 어플리케이션 종료, 서블릿 재로딩) 호출
    @Override
    public void destroy() {
        System.out.println("AppInitServlet.destroy() called");
        super.destroy();

        Connection conn = (Connection) this.getServletContext().getAttribute("conn");

        try {
            if(conn != null && !conn.isClosed()) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
