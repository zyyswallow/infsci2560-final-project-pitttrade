/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Bean;

import com.POJOs.FeedTag;
import com.POJOs.FeedTagId;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author linxiaohui
 */
public class FeedTagHelper {

    Session session = null;

    public FeedTagHelper() {
        this.session = HibernateUtil.getSessionFactory().openSession();
    }

    public List<String> getFeedTags(int uid) {
        try {
            List<String> tags = new ArrayList<String>();
            List<FeedTag> tagList = new ArrayList<>();
            Query q = session.createQuery("from FeedTag where userId = " + uid + "");
            tagList = (List<FeedTag>) q.list();
            for (FeedTag tag : tagList) {
                tags.add(tag.getId().getTag());
            }
            return tags;
        } catch (HibernateException e) {
            System.err.println(e.getMessage());
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
        return null;
    }

    public int insertFeedTags(int uid, List<FeedTag> tagList) {
        org.hibernate.Transaction tx = null;
        try {
             tx = session.beginTransaction();
            Query q = session.createQuery("delete from FeedTag where userId=:userId");
            q.setParameter("userId", uid);
            q.executeUpdate();
            tx.commit();
            for (FeedTag tagInfo : tagList) {
                tx.begin();
                q = session.createSQLQuery("insert into FeedTag values (" + tagInfo.getId().getUserId() + ",'" + tagInfo.getId().getTag() + "')");
                q.executeUpdate();
                tx.commit();
            }
            session.close();
            return 1;
        } catch (HibernateException e) {
            System.err.println(e.getMessage());
            tx.rollback();
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }

        return -1;
    }

    public void close() {
        session.close();
    }
}
