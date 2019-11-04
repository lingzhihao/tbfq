package com.ling.ssm.global;

import java.util.ArrayList;
import java.util.List;

public class Contant {
    //职务
    public static final String CONTACTED = "已联系";
    public static final String UNCONTACTED = "未联系";
    public static List<String> getPosts(){
        List<String> list = new ArrayList<String>();
        list.add(CONTACTED);
        list.add(UNCONTACTED);
        return list;
    }
}
