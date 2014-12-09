/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Bean;

import com.POJOs.ContactInfo;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author linxiaohui
 */
public class ContactinfoHelper {
    Session session = null;
    
    
    
     public ContactinfoHelper() {
        this.session = HibernateUtil.getSessionFactory().openSession();
    }

    public String getContactPhone(int userid) {
        String phone;
        try {
            Query q = session.createQuery("select c.call1 from ContactInfo c where c.userId =" + userid);
            
            phone = q.uniqueResult().toString();
            System.out.println(phone);
            return phone;
        } catch (HibernateException e) {
            System.err.println(e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public String getContactEmail(int userid) {
        System.out.println(userid);
        String email;
        try {
            Query q = session.createQuery("select c.email1 from ContactInfo c where c.userId =" + userid);
            System.out.print(q);
            email = q.uniqueResult().toString();
            System.out.println(email);
            return email;
        } catch (HibernateException e) {
            System.err.println(e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    
    
    
}