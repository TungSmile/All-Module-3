package Module;
import java.sql.Date;

public class User {
    private int id;
    private String name;
    private String acc;
    private String pass;
    private Date dateCreate;
    // date kiểu dữ liệu của sql
    private boolean status;
    // 1 property để boolean thì hơi ảo , có thể để luôn String rồi logic cho dễ

    public User(int id, String name, String acc, String pass, Date dateCreate, boolean status) {
       // constructor để input database
        this.id = id;
        this.name = name;
        this.acc = acc;
        this.pass = pass;
        this.dateCreate = dateCreate;
        this.status = status;
    }

    public User() {
        // constructor mặc định

    }

    public User(String name, String acc, String pass, Date dateCreate, boolean status) {
        //  constructor để dùng cho sign up
        this.name = name;
        this.acc = acc;
        this.pass = pass;
        this.dateCreate = dateCreate;
        this.status = status;
    }
}
