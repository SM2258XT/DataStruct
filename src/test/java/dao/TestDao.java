package dao;

import com.xhu.dao.StaffDao;
import com.xhu.domain.Staff;
import org.junit.jupiter.api.Test;

import java.util.Date;

public class TestDao {
    @Test
    public void testInsert(){
        StaffDao dao = new StaffDao();
        int code = 20190;
        dao.insert(new Staff(code++, "张大爷", "男", "软件开发", "部门1", new Date().toString(), new Date().toString()));
        dao.insert(new Staff(code++, "李大妈", "女", "数据库", "部门5", new Date().toString(), new Date().toString()));
        dao.insert(new Staff(code++, "王二牛", "男", "网络", "部门3", new Date().toString(), new Date().toString()));
        dao.insert(new Staff(code++, "张小山", "女", "软件开发", "部门7", new Date().toString(), new Date().toString()));
        dao.insert(new Staff(code++, "测试", "男", "软件开发", "部门7", new Date().toString(), new Date().toString()));
        dao.insert(new Staff(code++, "测试", "男", "软件开发", "部门7", new Date().toString(), new Date().toString()));
        dao.insert(new Staff(code++, "测试", "男", "软件开发", "部门7", new Date().toString(), new Date().toString()));
        dao.insert(new Staff(code++, "测试", "男", "软件开发", "部门7", new Date().toString(), new Date().toString()));
        dao.insert(new Staff(code++, "测试", "男", "软件开发", "部门7", new Date().toString(), new Date().toString()));
        dao.insert(new Staff(code++, "测试", "男", "软件开发", "部门7", new Date().toString(), new Date().toString()));
        dao.close();
        System.out.println("插入完成！");
    }

}
