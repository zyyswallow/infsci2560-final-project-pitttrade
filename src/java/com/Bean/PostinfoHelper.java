/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Bean;

import com.POJOs.Post;
import com.POJOs.PostSearcher;
import com.POJOs.User;
import com.Utils.Constant;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author linxiaohui
 */
public class PostinfoHelper {

    int maxPage;
    int itemsPerPage = 5;
    Session session = null;

    public PostinfoHelper() {
        this.session = HibernateUtil.getSessionFactory().openSession();
    }

    /**
     *
     * @param postInfo
     * @return
     */
    public int insertPost(Post postInfo) {
        try {
            org.hibernate.Transaction tx = session.beginTransaction();
            session.saveOrUpdate(postInfo);
            tx.commit();
            session.close();
            return Constant.POST_INSERT_SUCCESS;
        } catch (HibernateException e) {
            System.err.println(e.getMessage());
            return Constant.POST_INSERT_ERROR;
        } catch (Exception e) {
            return Constant.POST_INSERT_ERROR;
        }
    }

    public List<Post> getAllPost(int page) {
        List<Post> postList = new ArrayList<Post>();
        try {
            Query q = session.createQuery("from Post as p order by p.creationTime desc ");
            maxPage = q.list().size() / itemsPerPage;
            q.setFirstResult(page * itemsPerPage);
            q.setMaxResults(itemsPerPage);
            postList = (List<Post>) q.list();
            return postList;
        } catch (HibernateException e) {
            System.err.println(e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    //See the post sent by himself
    public List<Post> getMyPost(int page, int userid) {
        List<Post> postList = new ArrayList<Post>();
        try {
            Query q = session.createQuery("from Post as p where p.userId =" + userid + "order by p.creationTime desc");
            maxPage = q.list().size() / itemsPerPage;
            q.setFirstResult(page * itemsPerPage);
            q.setMaxResults(itemsPerPage);
            postList = (List<Post>) q.list();
            return postList;
        } catch (HibernateException e) {
            System.err.println(e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public String getPostUsername(int postid) {
        String username;
        try {
            Query q = session.createQuery("select u.username from User u, Post p where p.postId =" + postid + "and p.userId = u.uid");
            
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

    public List<Post> searchByCriteria(PostSearcher postSearcher, int page) {

        List<Post> postList = new ArrayList<Post>();
        try {
            Criteria c = session.createCriteria(Post.class);
            if (postSearcher.getTitle() != null) {
                c.add(Restrictions.like("title", "%" + postSearcher.getTitle() + "%"));
            }
            if ((postSearcher.getMinPrice() >= 0) && (postSearcher.getMaxPrice() >= 0)) {
                c.add(Restrictions.between("price", postSearcher.getMinPrice(), postSearcher.getMaxPrice()));
            } else if (postSearcher.getMinPrice() >= 0) {
                c.add(Restrictions.ge("price", postSearcher.getMinPrice()));
            } else if (postSearcher.getMaxPrice() >= 0) {
                c.add(Restrictions.le("price", postSearcher.getMaxPrice()));
            }
            if (postSearcher.getTypes() != null) {
                c.add(Restrictions.in("type", postSearcher.getTypes()));
            }
            maxPage = c.list().size() / itemsPerPage;
            c.setFirstResult(page * itemsPerPage);
            c.setMaxResults(itemsPerPage);
            postList = (List<Post>) c.list();
            return postList;
        } catch (HibernateException e) {
            System.err.println(e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public int getMaxPage() {
        return maxPage;
    }

    public int getLike(int postId) {
        try {
            Query q = session.createQuery("from Post where postId=:postId");
            q.setParameter("postId", postId);
            int count = ((Post) q.uniqueResult()).getLikeCount();
            return count;
        } catch (HibernateException e) {
            System.err.println(e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public void updateLike(int likeCount, int postId) {
        org.hibernate.Transaction tx = null;
        try {
             tx= session.beginTransaction();
             Query q = session.createQuery("Update Post set likeCount=:likeCount where postId=:postId");
             q.setParameter("likeCount", likeCount);
             q.setParameter("postId", postId);
             q.executeUpdate();
             tx.commit();
             close();
        } catch (HibernateException e) {
            System.err.println(e.getMessage());
            tx.rollback();
        } catch (Exception e) {
            System.err.println(e.getMessage());
            e.printStackTrace();
        }finally {
            if (session != null && session.isOpen()) {
                session.close();
            }
        }

    }
    public void close(){
    session.close();
    }
}
