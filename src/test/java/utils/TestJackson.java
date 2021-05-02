package utils;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.xhu.domain.Staff;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;
import java.util.Date;

public class TestJackson {
    @Test
    public void testJackson() {
        ObjectMapper mapper = new ObjectMapper();

        try {
            String jsonMap = mapper.writeValueAsString(new Staff(20190, "张大爷", "男", "软件开发", "部门1", new Date().toString(), new Date().toString()));
            System.out.println("jsonMap:\n" + jsonMap);

            ArrayList<String> list = new ArrayList<>();
            list.add(jsonMap);
            String jsonList = mapper.writeValueAsString(list);
            System.out.println("jsonList:\n" + jsonList);

        } catch (JsonProcessingException e) {
            System.out.println("转换失败！");
        }

    }
}
