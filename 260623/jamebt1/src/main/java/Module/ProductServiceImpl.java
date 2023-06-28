package Module;

import java.util.ArrayList;
import java.util.List;

public class ProductServiceImpl implements ProductService {
    private static ArrayList<Product> list;

    static {
        list = new ArrayList<>();
        list.add(new Product(1,"iphone",500,"táo cắn dở","Apple"));
        list.add(new Product(2,"galaxy note",450,"3 sao","Samsung"));
        list.add(new Product(3,"redmi",300,"tàu cựa","Xaomi"));
    }

    @Override
    public List<Product> allProduct() {
        //List<T> newList = new ArrayList<T>(oldList);: Sử dụng constructor của lớp ArrayList để tạo một đối tượng mới từ đối tượng cũ.
        return new ArrayList<Product>(list);
    }

    @Override
    public void createNew(Product p) {
        list.add(p);
    }

    @Override
    public Product findById(int id) {
        for (Product p : list) {
            if (p.getId() == id) {
                return p;
            }
        }
        return null;
    }

    @Override
    public void update(int id, Product p) {
        if (findById(id) != null){
            list.add(findById(id));}
    }

    @Override
    public void remove(int id) {
        if (findById(id) != null){
            list.remove(findById(id));
        }
    }
}
