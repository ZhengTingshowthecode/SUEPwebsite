package Entity;

public class User {
    private String id;
    private String name;
    private String pwd;
    private int type;
    public User() {}
    public User(String id, String name, String pwd, int type) {
        this.id = id;
        this.name = name;
        this.pwd = pwd;
        this.type = type;
    }
    public void setId(String id) {
        this.id = id;
    }
    public String getId() {
        return id;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getName() {
        return name;
    }
    public void setPwd(String pwd) {
        this.pwd = pwd;
    }
    public String getPwd() {
        return pwd;
    }
    public void setType(int type) {
        this.type = type;
    }
    public int getType() {
        return type;
    }
}
