package com.POJOs;
// Generated Dec 7, 2014 1:12:51 AM by Hibernate Tools 4.3.1


import java.util.Date;

/**
 * User generated by hbm2java
 */
public class User  implements java.io.Serializable {


     private Integer uid;
     private String email;
     private String username;
     private String password;
     private Date creationDate;
     private String gender;
     private String details;
     private Integer reputation;

    public User() {
    }

	
    public User(String email, String username, String password, Date creationDate) {
        this.email = email;
        this.username = username;
        this.password = password;
        this.creationDate = creationDate;
    }
    public User(String email, String username, String password, Date creationDate, String gender, String details, Integer reputation) {
       this.email = email;
       this.username = username;
       this.password = password;
       this.creationDate = creationDate;
       this.gender = gender;
       this.details = details;
       this.reputation = reputation;
    }
   
    public Integer getUid() {
        return this.uid;
    }
    
    public void setUid(Integer uid) {
        this.uid = uid;
    }
    public String getEmail() {
        return this.email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    public String getUsername() {
        return this.username;
    }
    
    public void setUsername(String username) {
        this.username = username;
    }
    public String getPassword() {
        return this.password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }
    public Date getCreationDate() {
        return this.creationDate;
    }
    
    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }
    public String getGender() {
        return this.gender;
    }
    
    public void setGender(String gender) {
        this.gender = gender;
    }
    public String getDetails() {
        return this.details;
    }
    
    public void setDetails(String details) {
        this.details = details;
    }
    public Integer getReputation() {
        return this.reputation;
    }
    
    public void setReputation(Integer reputation) {
        this.reputation = reputation;
    }




}


