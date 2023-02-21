package neu.edu.entity;

public class Post {
    private String id;
    private String father_id;
    private String from_name;
    private String to_name;
    private String date_time;
    private String content;

    public Post(String id, String father_id, String from_name, String to_name, String date_time, String content) {
        this.id = id;
        this.father_id = father_id;
        this.from_name = from_name;
        this.to_name = to_name;
        this.date_time = date_time;
        this.content = content;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getFather_id() {
        return father_id;
    }

    public void setFather_id(String father_id) {
        this.father_id = father_id;
    }

    public String getfrom_name() {
        return from_name;
    }

    public void setfrom_name(String from_name) {
        this.from_name = from_name;
    }

    public String getto_name() {
        return to_name;
    }

    public void setto_name(String to_name) {
        this.to_name = to_name;
    }

    public String getDate_time() {
        return date_time;
    }

    public void setDate_time(String date_time) {
        this.date_time = date_time;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
