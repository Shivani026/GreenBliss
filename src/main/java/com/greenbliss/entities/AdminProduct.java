package com.greenbliss.entities;

public class AdminProduct {
    private int pid;
    private String pname;
    private int pprice;
    private int punits;
    private String pcategory;


    public AdminProduct(int pid, String pname, int pprice, int punits, String pcategory) {
        this.pid = pid;
        this.pname = pname;
        this.pprice = pprice;
        this.punits = punits;
        this.pcategory = pcategory;
    }

    public AdminProduct() {
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public int getPprice() {
        return pprice;
    }

    public void setPprice(int pprice) {
        this.pprice = pprice;
    }

    public int getPunits() {
        return punits;
    }

    public void setPunits(int punits) {
        this.punits = punits;
    }

    public String getPcategory() {
        return pcategory;
    }

    public void setPcategory(String pcategory) {
        this.pcategory = pcategory;
    }

    @Override
    public String toString() {
        return "AdminProduct{" +
                "pid=" + pid +
                ", pname='" + pname + '\'' +
                ", pprice=" + pprice +
                ", punits=" + punits +
                ", pcategory='" + pcategory + '\'' +
                '}';
    }
}
