package com.greenbliss.entities;

import jakarta.persistence.*;

@Entity
public class Feedback {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    int fid;
    @Column(columnDefinition = "Text")
    String fcomment;
    int frating;
    int cid;

    public Feedback() {
    }

    public Feedback(String fcomment, int frating, int cid) {
        this.fcomment = fcomment;
        this.frating = frating;
        this.cid = cid;
    }

    public int getFid() {
        return fid;
    }

    public void setFid(int fid) {
        this.fid = fid;
    }

    public String getFcomment() {
        return fcomment;
    }

    public void setFcomment(String fcomment) {
        this.fcomment = fcomment;
    }

    public int getFrating() {
        return frating;
    }

    public void setFrating(int frating) {
        this.frating = frating;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }
}
