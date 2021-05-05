package datastruct;

import com.xhu.datastruct.MyDoubleLoopLinkedList;
import com.xhu.datastruct.MyLinkedList;
import com.xhu.datastruct.MyList;
import com.xhu.datastruct.MyStack;
import com.xhu.domain.Staff;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;
import java.util.Date;

public class TestMyList {
    public static final int id = 20190;
    public static final int numbers = 6;
    public static ArrayList<Staff> createList(){
        ArrayList<Staff> arrayList = new ArrayList<>();
        int code = id;
        arrayList.add(new Staff(code++, "李大妈", "女", "法学", "部门15", new Date().toString(), new Date().toString()));
        arrayList.add(new Staff(code++, "王二娃", "男", "软件科学", "部门19", new Date().toString(), new Date().toString()));
        arrayList.add(new Staff(code++, "派大星", "女", "吃播学", "部门2", new Date().toString(), new Date().toString()));
        arrayList.add(new Staff(code++, "章鱼哥", "男", "护发与保养", "部门22", new Date().toString(), new Date().toString()));
        arrayList.add(new Staff(code++, "海绵宝宝", "女", "电视剧学", "部门54", new Date().toString(), new Date().toString()));
        arrayList.add(new Staff(code++, "蟹老板", "男", "强买强卖学", "部门7", new Date().toString(), new Date().toString()));
        return arrayList;
    }

    public static void testMyList(MyList list){
        ArrayList<Staff> arrayList = createList();
        for (Staff s : arrayList)
            list.push(s);

        for (int i = id; i < id + numbers; i++) {
            Staff staff = list.getStaffById(i);
            System.out.println(staff);
            list.remove(staff.getId());
        }
        System.out.println("测试通过!");
    }

    @Test
    public void testMyDoubleLoopLinkedList() {
        MyDoubleLoopLinkedList list = new MyDoubleLoopLinkedList();
        testMyList(list);
    }

    @Test
    public void testLinkedList(){
        MyLinkedList list = new MyLinkedList();
        list.push(new Staff(4532452, "李大妈", "女", "法学", "部门15", new Date().toString(), new Date().toString()));
        list.push(new Staff(45324524, "李大妈", "女", "法学", "部门15", new Date().toString(), new Date().toString()));
        //testMyList(list);
    }

}
