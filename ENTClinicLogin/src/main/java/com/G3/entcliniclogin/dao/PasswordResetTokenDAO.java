/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.G3.entcliniclogin.dao;

import com.G3.entcliniclogin.entity.PasswordResetToken;
import com.G3.entcliniclogin.entity.User;
import com.G3.entcliniclogin.util.JPAUtil;

import jakarta.persistence.EntityManager;
import jakarta.persistence.NoResultException;
import jakarta.persistence.TypedQuery;
import java.util.UUID;

public class PasswordResetTokenDAO {
    
    public PasswordResetToken createToken(User user, int expiryMinutes) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            em.getTransaction().begin();
            
            // Xóa các token cũ chưa sử dụng của user
            em.createQuery("DELETE FROM PasswordResetToken t WHERE t.user = :user AND t.used = false")
                .setParameter("user", user)
                .executeUpdate();
            
            // Tạo token mới
            String tokenString = UUID.randomUUID().toString();
            PasswordResetToken token = new PasswordResetToken(tokenString, user, expiryMinutes);
            em.persist(token);
            
            em.getTransaction().commit();
            return token;
        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            throw new RuntimeException("Error creating reset token", e);
        } finally {
            em.close();
        }
    }
    
    public PasswordResetToken findByToken(String token) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            TypedQuery<PasswordResetToken> query = em.createQuery(
                "SELECT t FROM PasswordResetToken t WHERE t.token = :token", 
                PasswordResetToken.class);
            query.setParameter("token", token);
            return query.getSingleResult();
        } catch (NoResultException e) {
            return null;
        } finally {
            em.close();
        }
    }
    
    public boolean validateToken(String token) {
        PasswordResetToken resetToken = findByToken(token);
        return resetToken != null && !resetToken.isUsed() && !resetToken.isExpired();
    }
    
    public void markTokenAsUsed(String token) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            em.getTransaction().begin();
            PasswordResetToken resetToken = findByToken(token);
            if (resetToken != null) {
                resetToken.setUsed(true);
                em.merge(resetToken);
            }
            em.getTransaction().commit();
        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            throw new RuntimeException("Error marking token as used", e);
        } finally {
            em.close();
        }
    }
    
    public void deleteExpiredTokens() {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            em.getTransaction().begin();
            em.createQuery("DELETE FROM PasswordResetToken t WHERE t.expiryDate < CURRENT_TIMESTAMP")
                .executeUpdate();
            em.getTransaction().commit();
        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            throw new RuntimeException("Error deleting expired tokens", e);
        } finally {
            em.close();
        }
    }
}
