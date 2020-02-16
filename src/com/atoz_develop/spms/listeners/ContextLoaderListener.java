package com.atoz_develop.spms.listeners;

import com.atoz_develop.spms.dao.StudentDao;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

@WebListener
public class ContextLoaderListener implements ServletContextListener {
    Connection conn;

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        ServletContext sc = sce.getServletContext();

        try {
            // Connection 준비
            Class.forName(sc.getInitParameter("driver"));
            conn = DriverManager.getConnection(
                    sc.getInitParameter("url"),
                    sc.getInitParameter("username"),
                    sc.getInitParameter("password")
            );

            // Dao 준비
            StudentDao studentDao = new StudentDao();
            studentDao.setConnection(conn);

            // Dao 저장
            sc.setAttribute("studentDao", studentDao);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        // Connection 해제
        try {
            conn.close();
        } catch (SQLException e) { }
    }
}
