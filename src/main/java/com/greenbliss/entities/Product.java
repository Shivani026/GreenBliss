
package com.greenbliss.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;


@Entity
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int pid;
    private String pname;
    @Column(length = 3000)
    private String pdetails;   
    private int pprice;    
    private int punits;
    @Column(columnDefinition = "MEDIUMBLOB")
    private String pimg;
    private String pcategory;

    public Product(String pname, String pdetails, int pprice, int punits, String pimg, String pcategory) {
        this.pname = pname;
        this.pdetails = pdetails;
        this.pprice = pprice;
        this.punits = punits;
        this.pimg = pimg;
        this.pcategory = pcategory;
    }

    public Product() {
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

    public String getPdetails() {
        return pdetails;
    }

    public void setPdetails(String pdetails) {
        this.pdetails = pdetails;
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

    public String getPimg() {
        return pimg;
    }

    public void setPimg(String  pimg) {
        this.pimg = pimg;
    }

    public String getPcategory() {
        return pcategory;
    }

    public void setPcategory(String pcategory) {
        this.pcategory = pcategory;
    }

    @Override
    public String toString() {
        return "Product{" + "pid=" + pid + ", pname=" + pname + ", pdetails=" + pdetails + ", pprice=" + pprice + ", punits=" + punits + ", pimg=" + pimg + ", pcategory=" + pcategory + '}';
    }
          
}
