/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author BKC
 */
public class Delivery {
    private int deliveryId;
    private int accountId;
    private String receiverFullname;
    private String receiverPhone;
    private String city;
    private String district;
    private String ward;
    private String address;

    public Delivery() {
    }

    public Delivery(int deliveryId, int accountId, String receiverFullname, String receiverPhone, String city, String district, String ward, String address) {
        this.deliveryId = deliveryId;
        this.accountId = accountId;
        this.receiverFullname = receiverFullname;
        this.receiverPhone = receiverPhone;
        this.city = city;
        this.district = district;
        this.ward = ward;
        this.address = address;
    }

    public int getDeliveryId() {
        return deliveryId;
    }

    public void setDeliveryId(int deliveryId) {
        this.deliveryId = deliveryId;
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public String getReceiverFullname() {
        return receiverFullname;
    }

    public void setReceiverFullname(String receiverFullname) {
        this.receiverFullname = receiverFullname;
    }

    public String getReceiverPhone() {
        return receiverPhone;
    }

    public void setReceiverPhone(String receiverPhone) {
        this.receiverPhone = receiverPhone;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getWard() {
        return ward;
    }

    public void setWard(String ward) {
        this.ward = ward;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
    
    
}
