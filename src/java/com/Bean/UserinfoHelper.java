/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Bean;

import com.POJOs.ContactInfo;
import com.POJOs.User;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import com.Utils.Constant;

/**
 *
 * @author linxiaohui
 */
public class UserinfoHelper {

    Session session = null;

    public UserinfoHelper() {
        this.session = HibernateUtil.getSessionFactory().openSession();
    }

    public User getUserInfo(User userinfo) {

        try {
            String password = userinfo.getPassword();
            Query q = session.createQuery("from User as userinfo where userinfo.uid="+userinfo.getUid()+"");
            userinfo = new User();
            userinfo = (User) q.uniqueResult();
            return userinfo;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public User checkUserAuth(User userinfo) {

        try {
            String password = userinfo.getPassword();
            Query q = session.createQuery("from User as userinfo where userinfo.username = '" + userinfo.getUsername() + "' and userinfo.password = '" + userinfo.getPassword() + "'");
            userinfo = new User();
            userinfo = (User) q.uniqueResult();
            return userinfo;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    public boolean checkUsernameDuplicate(String username) {

        try {
            Query q = session.createQuery("from User as userinfo where userinfo.username = '" + username + "'");
            if (q.list().size() > 0) {
                return true;
            }
        } catch (Exception e) {
            System.err.println(e.getMessage());
            e.printStackTrace();
        }
        return false;
    }

    public int insertOrUpdateUser(String method, User userinfo) {
        org.hibernate.Transaction tx = null;
        try {
            tx = session.beginTransaction();
            if (checkUsernameDuplicate(userinfo.getUsername()) && method.equals("register")) {
                return Constant.USERNAME_DUPLICATE;
            }
            if (method.equals("update")) {
                String hql = "update User set username=:username, gender=:gender,details=:details where uid=:uid ";
                Query q = session.createQuery(hql);
                q.setParameter("username", userinfo.getUsername());
                q.setParameter("gender", userinfo.getGender());
                q.setParameter("details", userinfo.getDetails());
                q.setParameter("uid", userinfo.getUid());
                int result =q.executeUpdate();
                tx.commit();
            session.close();
                return result;
            }
            
            session.saveOrUpdate(userinfo);
            tx.commit();
            session.close();
            return Constant.REG_SUCCESS;
        } catch (HibernateException e) {
            System.err.println(e.getMessage());
            tx.rollback();
            return Constant.USER_INSERT_ERROR;
        } catch (Exception e) {
            tx.rollback();
            return Constant.UNKNOWN_ERROR;
        }
    }

    public ContactInfo getContactinfo(int uid) {
        org.hibernate.Transaction tx = null;
        try {
            tx = session.beginTransaction();
            ContactInfo contactInfo = new ContactInfo();
            Query q = session.createQuery("from ContactInfo as contactinfo where contactinfo.userId = " + uid + "");
            contactInfo = (ContactInfo) q.uniqueResult();
            tx.commit();
            return contactInfo;
        } catch (HibernateException e) {
            System.err.println(e.getMessage());
            tx.rollback();
        } catch (Exception e) {
            System.err.println(e.getMessage());
            tx.rollback();
        }
        return null;
    }

    public void insertOrUpdateContactinfo(ContactInfo contactInfo) {
        org.hibernate.Transaction tx = null;
        try {
            tx = session.beginTransaction();
            session.saveOrUpdate(contactInfo);
            tx.commit();
        } catch (HibernateException e) {
            System.err.println(e.getMessage());
            tx.rollback();
        } catch (Exception e) {
            System.err.println(e.getMessage());
            tx.rollback();
        }
    }

    public void close() {
        session.close();
    }
}
