package com.atoz_develop.spms.listeners;

import com.atoz_develop.spms.dao.StudentDao;
import org.apache.commons.dbcp2.BasicDataSource;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import java.sql.SQLException;

@WebListener
public class ContextLoaderListener implements ServletContextListener {
    BasicDataSource ds;

    /**
     * 공용 자원 세팅
     * @param sce
     */
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        ServletContext sc = sce.getServletContext();

        ds = new BasicDataSource();
        ds.setDriverClassName(sc.getInitParameter("driver"));
        ds.setUrl(sc.getInitParameter("url"));
        ds.setUsername(sc.getInitParameter("username"));
        ds.setPassword(sc.getInitParameter("password"));

        // Dao 준비
        StudentDao studentDao = new StudentDao();
        studentDao.setDataSource(ds);

        // Dao 저장
        sc.setAttribute("studentDao", studentDao);
    }

    /**
     * 공용 자원 해제
     * @param sce
     */
    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        // DataSource의 모든 커넥션 해제
        try {
            if (ds != null) ds.close();
        } catch (SQLException e) { }
    }
}
