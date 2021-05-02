package com.xhu.utils;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.util.Map;

public class JsonUtils {
    public static Map<String, Boolean> JsonToMap(String jsonString) {
        //json字符串转为Map对象
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Boolean> map = null;
        try {
            map = mapper.readValue(jsonString, Map.class);
        } catch (JsonProcessingException e) {
            System.out.println("Failed : JsonToMap");
        }
        return map;
    }

    public static String MapToJson(Map<String,Boolean> map){
        ObjectMapper mapper = new ObjectMapper();
        try {
            return mapper.writeValueAsString(map);
        } catch (JsonProcessingException e) {
            System.out.println("Failed : MapToJson");
        }
        return null;
    }

}
