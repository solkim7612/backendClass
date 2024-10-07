package day10;

import java.util.ArrayList;

public class AcornService {
    public ArrayList<Acorn> getList(){
        ArrayList<Acorn> list = new ArrayList<>();
        list.add(new Acorn("kim", "123", "김"));
        list.add(new Acorn("lee", "234", "이"));
        list.add(new Acorn("han", "344", "한"));
        list.add(new Acorn("joe", "234", "조"));
        
        return list; // null 대신 list를 반환하도록 수정
    }
}