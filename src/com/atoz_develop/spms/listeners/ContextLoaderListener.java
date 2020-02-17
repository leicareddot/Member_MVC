package com.atoz_develop.spms.listeners;

import com.atoz_develop.spms.dao.StudentDao;
import com.atoz_develop.spms.utils.DBConnectionPool;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class ContextLoaderListener implements ServletContextListener {
    DBConnectionPool connPool;

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        ServletContext sc = sce.getServletContext();

        try {
            connPool = new DBConnectionPool(
                    sc.getInitParameter("driver"),
                    sc.getInitParameter("url"),
                    sc.getInitParameter("username"),
                    sc.getInitParameter("password")
            );

            // Dao 준비
            StudentDao studentDao = new StudentDao();
            studentDao.setDBConnectionPool(connPool);

            // Dao 저장
            sc.setAttribute("studentDao", studentDao);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        // Connection 해제
        connPool.closeAll();
    }
}
