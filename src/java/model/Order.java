/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author BKC
 */
public class Order {
    private int orderId;
    private int accountId; 
    private String deliveryAddress;
    private Date orderDate;
    private Date shipDate;
    private String customerNote;
    private String orderStatus;

    public Order() {
    }

    public Order(int accountId, String deliveryAddress, Date orderDate, Date shipDate, String customerNote, String orderStatus) {
        this.accountId = accountId;
        this.deliveryAddress = deliveryAddress;
        this.orderDate = orderDate;
        this.shipDate = shipDate;
        this.customerNote = customerNote;
        this.orderStatus = orderStatus;
    }

    public Order(int orderId, int accountId, String deliveryAddress, Date orderDate, Date shipDate, String customerNote, String orderStatus) {
        this.orderId = orderId;
        this.accountId = accountId;
        this.deliveryAddress = deliveryAddress;
        this.orderDate = orderDate;
        this.shipDate = shipDate;
        this.customerNote = customerNote;
        this.orderStatus = orderStatus;
    }


    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public String getDeliveryAddress() {
        return deliveryAddress;
    }

    public void setDeliveryAddress(String deliveryAddress) {
        this.deliveryAddress = deliveryAddress;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public Date getShipDate() {
        return shipDate;
    }

    public void setShipDate(Date shipDate) {
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
