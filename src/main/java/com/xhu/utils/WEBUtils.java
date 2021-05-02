package com.xhu.utils;

public class WEBUtils {
    private WEBUtils() {
    }

    public static boolean notNullOrEmpty(String... params) {
        return notNull(params) && notEmpty(params);
    }

    public static boolean notNull(String... params) {
        for (String param : params) {
            if (param == null)
                return false;
        }
        return true;
    }

    public static boolean notEmpty(String... params) {
        for (String param : params) {
            if (param.length() <= 0)
                return false;
        }
        return true;
    }

}
