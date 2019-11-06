package api.entity;

import java.util.Date;

public class HonorResult {
    private Integer id;
    private String nameCn;
    private String nameEn;
    private Integer m1;
    private Integer m2;
    private Integer m3;
    private String n1;
    private String n2;
    private String n3;
    private String cname;
    private Integer ctype;
    private Date ctime;
    private Integer result;
    private String path;
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public Integer getCtype() {
        return ctype;
    }

    public void setCtype(Integer ctype) {
        this.ctype = ctype;
    }

    public Date getCtime() {
        return ctime;
    }

    public void setCtime(Date ctime) {
        this.ctime = ctime;
    }

    public Integer getResult() {
        return result;
    }

    public void setResult(Integer result) {
        this.result = result;
    }

    public Integer getM1() {
        return m1;
    }

    public Integer getM2() {
        return m2;
    }

    public Integer getM3() {
        return m3;
    }

    public String getN1() {
        return n1;
    }

    public String getN2() {
        return n2;
    }

    public String getN3() {
        return n3;
    }

    public String getNameCn() {
        return nameCn;
    }

    public String getNameEn() {
        return nameEn;
    }

    public void setM1(Integer m1) {
        this.m1 = m1;
    }

    public void setNameCn(String nameCn) {
        this.nameCn = nameCn;
    }

    public void setNameEn(String nameEn) {
        this.nameEn = nameEn;
    }

    public void setM2(Integer m2) {
        this.m2 = m2;
    }

    public String getPath() {
        return path;
    }

    public void setM3(Integer m3) {
        this.m3 = m3;
    }

    public void setN1(String n1) {
        this.n1 = n1;
    }

    public void setN2(String n2) {
        this.n2 = n2;
    }

    public void setN3(String n3) {
        this.n3 = n3;
    }

    public void setPath(String path) {
        this.path = path;
    }
}
