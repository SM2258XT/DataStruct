package dao;

import com.xhu.dao.StaffDao;
import com.xhu.datastruct.MyDoubleLoopLinkedList;
import com.xhu.domain.Staff;
import org.junit.jupiter.api.Test;

import java.util.Date;

public class TestDao {
    @Test
    public void testInsert() {
        StaffDao dao = new StaffDao();
        int code = 201900;
        dao.insert(new Staff(code++, "小李", "男", "软件开发", "软件开发部1", "2003年5月24日","1993年11月21日"));
        dao.insert(new Staff(code++, "小王", "男", "数据库", "软件开发部5", "2001年9月23日", "1991年3月2日"));
        dao.insert(new Staff(code++, "小明", "男", "项目策划", "项目管理部3", "2005年11月14日", "2000年12月24日"));
        dao.insert(new Staff(code++, "小芳", "女", "销售", "销售管理部7", "2009年2月2日", "2001年2月4日"));
        dao.insert(new Staff(code++, "小赵", "男", "销售", "销售管理部2", "2011年5月10日", "1998年2月4日"));
        dao.insert(new Staff(code++, "小芳", "女", "售后服务", "销售管理部2", "2019年5月2日", "2001年7月8日"));
        dao.insert(new Staff(code++, "小张", "男", "财务管理", "财务部1", "2011年3月15日", "2000年7月12日"));
        dao.insert(new Staff(code++, "小林", "女", "保洁清理", "后勤服务部2", "2008年8月2日", "1992年11月23日"));
        dao.close();
        System.out.println("插入完成！");
    }

    @Test
    public void testSelectAll() {
        StaffDao dao = new StaffDao();
        MyDoubleLoopLinkedList list = dao.selectAll();
        for (int i = 0; i < list.size(); i++) {
            System.out.println(list.getStaffByIndex(i));
        }
    }

    @Test
    public void testClearAllStaffs() {
        StaffDao dao = new StaffDao();
        dao.clearTable();
        dao.close();
    }
}
