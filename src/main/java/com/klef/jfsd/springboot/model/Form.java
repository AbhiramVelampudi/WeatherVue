package com.klef.jfsd.springboot.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "form_table")
public class Form {
  
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name="fid")
  private int id;
  @Column(name="fname",nullable=false,length = 50)
  private String name;
  @Column(name="femail",nullable=false,length = 50)
    private String email;
  @Column(name="fsubject",nullable=false,length = 50)
    private String subject;
  @Column(name="fmessage",nullable=false,length = 250)
    private String message;
  public String getName() {
    return name;
  }
  public void setName(String name) {
    this.name = name;
  }
  public String getEmail() {
    return email;
  }
  public void setEmail(String email) {
    this.email = email;
  }
  public String getSubject() {
    return subject;
  }
  public void setSubject(String subject) {
    this.subject = subject;
  }
  public String getMessage() {
    return message;
  }
  public void setMessage(String message) {
    this.message = message;
  }
  @Override
  public String toString() {
    return "Form [name=" + name + ", email=" + email + ", subject=" + subject + ", message=" + message + "]";
  }
  public int getId() {
    return id;
  }
  public void setId(int id) {
    this.id = id;
  }
}