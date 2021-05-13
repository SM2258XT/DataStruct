package com.xhu.dao;

import com.xhu.datastruct.MyDoubleLoopLinkedList;
import com.xhu.datastruct.MyList;
import com.xhu.domain.Staff;
import com.xhu.utils.DBUtils;

import java.sql.*;

public class StaffDao {
    private static final String BASE_NAME = "hr";
    private static final String TABLE_NAME = "staff";
    private static final String USER = "root";
    private static final String PWD = "zhang";

    protected Connection con = null;
    protected Statement stat = null;
    protected ResultSet res = null;

    public StaffDao() {
        con = DBUtils.getConnection(BASE_NAME, USER, PWD);
    }

    public boolean insert(Staff staff) {
        /*
            插入一条员工记录
         */
        try {
            PreparedStatement ps = con.prepareStatement("insert into " + TABLE_NAME + " values(?,?,?,?,?,?,?)");
            ps.setInt(1, staff.getId());
            ps.setString(2, staff.getName());
            ps.setString(3, staff.getSex());
            ps.setString(4, staff.getJob());
            ps.setString(5, staff.getDept());
            ps.setString(6, staff.getEntryday());
            ps.setString(7, staff.getBirthday());
            int k = ps.executeUpdate();
            ps.close();
            return k > 0;
        } catch (SQLException throwables) {
            System.out.println("JDBC:" + TABLE_NAME + "：插入失败！");
        }
        return false;
    }

    public boolean delete(final int id) {
        String sql = "delete from staff where id = '" + id + "';";
        try {
            stat = con.createStatement();
            return stat.executeUpdate(sql) > 0;
        } catch (SQLException throwable) {
            System.out.println("JDBC:删除失败！");
        }
        return false;
    }

    public MyDoubleLoopLinkedList select(String sql) {
        try {
            stat = con.createStatement();
            res = stat.executeQuery(sql);
        } catch (SQLException e) {
            System.out.println("JDBC:" + TABLE_NAME + "：查询失败！");
            return null;
        }

        MyDoubleLoopLinkedList list = new MyDoubleLoopLinkedList();
        try {
            while (res.next()) {
                Staff staff = new Staff(
                        res.getInt(1),
                        res.getString(2),
                        res.getString(3),
                        res.getString(4),
                        res.getString(5),
                        res.getString(6),
                        res.getString(7));
                list.push(staff);
            }
        } catch (SQLException e) {
            System.out.println("JDBC:" + TABLE_NAME + "：结果为空！");
        }
        return list;
    }

    public MyDoubleLoopLinkedList selectAll() {
        return select("select * from " + TABLE_NAME + ";");
    }

    public boolean clearTable() {
        try {
            stat = con.createStatement();
            String sql = "delete from " + TABLE_NAME + ";";
            int k = stat.executeUpdate(sql);
            return k > 0;
        } catch (SQLException e) {
            System.out.println("JDBC:" + TABLE_NAME + "：尝试清空失败");
            System.out.println(e.getMessage());
        }
        return false;
    }

    public void close() {
        DBUtils.close(con, stat, res);
    }

}
