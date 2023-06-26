package module;

import java.util.ArrayList;

public class Manage {
    static ArrayList<User> list;

    static {
        list = new ArrayList<>();
        list.add(new User("test1", "123"));
        list.add(new User("test2", "123"));
        list.add(new User("test3", "123"));
    }

   static public boolean check(String id , String pass) {
        for (User user:list){
            if (id.equals(user.getId())&&pass.equals( user.getPass())){
                return true;
            }
        }
        return false;
    }
   static public boolean register(String id,String pass){
        for (User user:list){
            if (id.equals( user.getId())){
                return false;
            }
        }
        list.add(new User(id,pass));
        return true;
    }

}
