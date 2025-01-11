package Util;

import java.util.ArrayList;
import java.util.List;

public class ImgsURL {
    public static List<String> getImgStr(String htmlStr) {
        List<String> list = new ArrayList<>();
        int index = 0;
        String[] urls = htmlStr.split(" ");
        while (index < urls.length) {
            if (urls[index].startsWith("src=")) {
                list.add(urls[index].substring(5,urls[index].length()-1));
            }
            index++;
        }
        return list;
    }
}
