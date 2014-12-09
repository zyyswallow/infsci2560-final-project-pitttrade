/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Bean;

import com.POJOs.Comment;
import com.POJOs.Post;
import com.POJOs.User;
import com.Utils.Constant;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author huge
 */
public class CommentinfoHelper {
    Session session = null;

    public CommentinfoHelper() {
        this.session = HibernateUtil.getSessionFactory().openSession();
    }
    
    public int insertComment(Comment commentInfo) {
        org.hibernate.Transaction tx = null;
        try {
            tx = session.beginTransaction();
            session.saveOrUpdate(commentInfo);
            tx.commit();
            session.close();
            return Constant.POST_INSERT_SUCCESS;
        } catch (HibernateException e) {
            System.err.println(e.getMessage());
            tx.rollback();
            return Constant.POST_INSERT_ERROR;
        } catch (Exception e) {
            tx.rollback();
            return Constant.POST_INSERT_ERROR;
        }
    }

    public List<Comment> getComment(int postid) {
        List<Comment> postList = new ArrayList<Comment>();
        try {
            Query q = session.createQuery("from Comment as c where c.postId =" + postid + "order by c.creationTime desc");
            
            postList = (List<Comment>) q.list();
            return postList;
        } catch (HibernateException e) {
            System.err.println(e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public String getCommentUsername(int commentid) {
        String username;
        try {
            Query q = session.createQuery("select u.username from User u, Comment c where c.cmtId =" + commentid + "and c.userId = u.uid");           
            username = q.uniqueResult().toString();
//            System.out.println(username);
            return username;
        } catch (HibernateException e) {
            System.err.println(e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }











}
