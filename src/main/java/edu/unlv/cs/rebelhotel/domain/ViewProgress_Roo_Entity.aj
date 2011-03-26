// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package edu.unlv.cs.rebelhotel.domain;

import edu.unlv.cs.rebelhotel.domain.ViewProgress;
import java.lang.Integer;
import java.lang.Long;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityManager;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PersistenceContext;
import javax.persistence.Version;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ViewProgress_Roo_Entity {
    
    declare @type: ViewProgress: @Entity;
    
    @PersistenceContext
    transient EntityManager ViewProgress.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long ViewProgress.id;
    
    @Version
    @Column(name = "version")
    private Integer ViewProgress.version;
    
    public Long ViewProgress.getId() {
        return this.id;
    }
    
    public void ViewProgress.setId(Long id) {
        this.id = id;
    }
    
    public Integer ViewProgress.getVersion() {
        return this.version;
    }
    
    public void ViewProgress.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void ViewProgress.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void ViewProgress.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            ViewProgress attached = ViewProgress.findViewProgress(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void ViewProgress.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void ViewProgress.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public ViewProgress ViewProgress.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        ViewProgress merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
    public static final EntityManager ViewProgress.entityManager() {
        EntityManager em = new ViewProgress().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long ViewProgress.countViewProgresses() {
        return entityManager().createQuery("select count(o) from ViewProgress o", Long.class).getSingleResult();
    }
    
    public static List<ViewProgress> ViewProgress.findAllViewProgresses() {
        return entityManager().createQuery("select o from ViewProgress o", ViewProgress.class).getResultList();
    }
    
    public static ViewProgress ViewProgress.findViewProgress(Long id) {
        if (id == null) return null;
        return entityManager().find(ViewProgress.class, id);
    }
    
    public static List<ViewProgress> ViewProgress.findViewProgressEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from ViewProgress o", ViewProgress.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
