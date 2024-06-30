/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author BKC
 */
public class Account {
    private int accountId;
    private String username;
    private String password;
    private int roleId;
    
    private String fullname;
    private String phoneNumber;
    private String email;

    public Account() {
    }
    
    //basic information missing account id
    public Account(String username, String password, int roleId) {
        this.username = username;
        this.password = password;
        this.roleId = roleId;
    }
    
    //basic information
    public Account(int accountId, String username, String password, int roleId) {
        this.accountId = accountId;
        this.username = username;
        this.password = password;
        this.roleId = roleId;
    }

    //full information, missing id
    public Account(String username, String password, int roleId, String fullname, String phoneNumber, String email) {
        this.username = username;
        this.password = password;
        this.roleId = roleId;
        this.fullname = fullname;
        this.phoneNumber = phoneNumber;
        this.email = email;
    }
    
    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
    
    
    
}
