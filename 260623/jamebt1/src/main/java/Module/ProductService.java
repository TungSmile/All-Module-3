package Module;
import java.util.List;

public interface ProductService {
    List<Product> allProduct();
    void createNew(Product p);
    Product findById(int id);
    void update(int id,Product p);
    void remove(int id);
}
