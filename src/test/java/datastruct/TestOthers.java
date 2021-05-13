package datastruct;

import com.xhu.datastruct.MyQueue;
import com.xhu.datastruct.MySeqList;
import com.xhu.datastruct.MyStack;
import com.xhu.datastruct.MyTree23;
import org.junit.jupiter.api.Test;

import java.util.List;

public class TestOthers {
    // 一个一个数地插入进去，把这些数据修改顺序结果好像不变。
    // 没有更细致的检验程序的正确性，看到错误的朋友请指出。
    @Test
    public void testMyTree23() {
        MyTree23 tree = new MyTree23();
        tree.insert(80);
        tree.insert(50);
        tree.insert(40);
        tree.insert(30);
        tree.insert(20);
        tree.insert(70);
        tree.insert(60);
        tree.insert(10);
        tree.displayTree();

        List list = tree.getAllData();
        for (Object o : list) {
            System.out.println(o);
        }
    }

    @Test
    public void testStack() {
        MyStack<String> ns = new MyStack<String>();

        System.out.println("=====是否为空=====");
        System.out.println(ns.isEmpty());
        System.out.println("==========");

        System.out.println("=====压栈=====");
        ns.push("北京");
        ns.push("上海");
        ns.push("深圳");
        ns.push("广州");

        System.out.println("=====是否为空=====");
        System.out.println(ns.isEmpty());
        System.out.println("==========");

        System.out.println("=====出栈=====");
        System.out.println(ns.pop());
        System.out.println(ns.pop());
        System.out.println(ns.pop());
        System.out.println(ns.pop());

        System.out.println("=====是否为空=====");
        System.out.println(ns.isEmpty());
        System.out.println("==========");
    }

    @Test
    public void testMyQueue() {
        MyQueue<Integer> queue = new MyQueue<Integer>();

        queue.push(1);
        queue.push(2);
        queue.push(3);
        queue.push(4);

        System.out.println("size：" + queue.size());

        System.out.println("出队列：" + queue.pop());
        System.out.println("出队列：" + queue.pop());
        System.out.println("出队列：" + queue.pop());
        System.out.println("出队列：" + queue.pop());

        System.out.println("删完重新添加==============");
        queue.push(11);
        queue.push(22);
        queue.push(33);
        queue.push(44);

        System.out.println("size：" + queue.size());

        System.out.println("出队列：" + queue.pop());
        System.out.println("出队列：" + queue.pop());
        System.out.println("出队列：" + queue.pop());
        System.out.println("出队列：" + queue.pop());
    }

    @Test
    public void testMySeqList() {
        MySeqList list = new MySeqList();
        list.insert(15, 0);
        list.displayList();
        //System.out.println(list.getDataByIndex(0));

    }
}
