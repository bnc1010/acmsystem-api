package api.entity;

public class Members {
    private Integer id;

    private String name;

    private Integer grade;

    private String class;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getGrade() {
        return grade;
    }

    public void setGrade(Integer grade) {
        this.grade = grade;
    }

    public String getClass() {
        return class;
    }

    public void setClass(String class) {
        this.class = class;
    }
}