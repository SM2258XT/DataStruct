package com.xhu.utils;
import java.sql.*;
public class DBUtils {
    static {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            System.out.println("JDBC:驱动加载失败！");
        }
    }
    private DBUtils(){}
    public static Connection getConnection(String database,String user,String pwd){
        Connection con = null;
        try {
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+database,user,pwd);
        } catch (SQLException throwables) {
            System.out.println("JDBC:获取连接失败！");
        }
        return con;
    }
    public static void close(Connection con,Statement stat,ResultSet res){
        if(res != null){
            try {
                res.close();
            } catch (SQLException throwables) {
                System.out.println("JDBC:ResultSet关闭异常！");
            }
        }
        if(stat != null){
            try {
                stat.close();
            } catch (SQLException throwables) {
                System.out.println("JDBC:Statement关闭异常！");
            }
        }
        if(con != null){
            try {
                con.close();
            } catch (SQLException throwables) {
                System.out.println("JDBC:Connection关闭异常！");
            }
        }
    }
}
