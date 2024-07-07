/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Timestamp;

/**
 *
 * @author BKC
 */
public class Order {

    private String orderId;
    private int accountId;
    private String receiverFullname;
    private String receiverPhoneNumber;
    private String receiverEmail;
    private String deliveryAddress;
    private Timestamp orderDate;
    private Timestamp shipDate;
    private String customerNote;
    private String orderStatus;

    public Order() {
    }

    //for create order
    public Order(String orderId, int accountId, String receiverFullname, String receiverPhoneNumber, String receiverEmail, String deliveryAddress, Timestamp orderDate, String customerNote, String orderStatus) {
        this.orderId = orderId;
        this.accountId = accountId;
        this.receiverFullname = receiverFullname;
        this.receiverPhoneNumber = receiverPhoneNumber;
        this.receiverEmail = receiverEmail;
        this.deliveryAddress = deliveryAddress;
        this.orderDate = orderDate;
        this.customerNote = customerNote;
        this.orderStatus = orderStatus;
    }

    //for updating order
    public Order(String receiverFullname, String receiverPhoneNumber, String receiverEmail, String deliveryAddress, Timestamp shipDate, String customerNote, String orderStatus) {
        this.receiverFullname = receiverFullname;
        this.receiverPhoneNumber = receiverPhoneNumber;
        this.receiverEmail = receiverEmail;
        this.deliveryAddress = deliveryAddress;
        this.shipDate = shipDate;
        this.customerNote = customerNote;
        this.orderStatus = orderStatus;
    }

    public Order(String orderId, int accountId, String receiverFullname, String receiverPhoneNumber, String receiverEmail, String deliveryAddress, Timestamp orderDate, Timestamp shipDate, String customerNote, String orderStatus) {
        this.orderId = orderId;
        this.accountId = accountId;
        this.receiverFullname = receiverFullname;
        this.receiverPhoneNumber = receiverPhoneNumber;
        this.receiverEmail = receiverEmail;
        this.deliveryAddress = deliveryAddress;
        this.orderDate = orderDate;
        this.shipDate = shipDate;
        this.customerNote = customerNote;
        this.orderStatus = orderStatus;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
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

    public String getReceiverPhoneNumber() {
        return receiverPhoneNumber;
    }

    public void setReceiverPhoneNumber(String receiverPhoneNumber) {
        this.receiverPhoneNumber = receiverPhoneNumber;
    }

    public String getReceiverEmail() {
        return receiverEmail;
    }

    public void setReceiverEmail(String receiverEmail) {
        this.receiverEmail = receiverEmail;
    }

    public String getDeliveryAddress() {
        return deliveryAddress;
    }

    public void setDeliveryAddress(String deliveryAddress) {
        this.deliveryAddress = deliveryAddress;
    }

    public Timestamp getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Timestamp orderDate) {
        this.orderDate = orderDate;
    }

    public Timestamp getShipDate() {
        return shipDate;
    }

    public void setShipDate(Timestamp shipDate) {
        this.shipDate = shipDate;
    }

    public String getCustomerNote() {
        return customerNote;
    }

    public void setCustomerNote(String customerNote) {
        this.customerNote = customerNote;
    }

    public String getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }

}
