package org.vmgs.genericDao;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author Victor Guerrero.
 * @copy Todos los derechos reservados
 * @version 1.0
 */
public abstract class GenericDaoImpl<T> implements IGenericDao<T> {

    @PersistenceContext
    protected EntityManager em;

    private Class<T> type;

    public GenericDaoImpl() {
        Type t = getClass().getGenericSuperclass();
        ParameterizedType pt = (ParameterizedType) t;
        type = (Class) pt.getActualTypeArguments()[0];
    }

    /*
     * (non-Javadoc)
     *
     * @see org.vmgs.genericDao.IGenericDao#create(java.lang.Object)
     */
    // @Override
    public T create(T t) {
        this.em.persist(t);
        return t;
    }

    /*
     * (non-Javadoc)
     *
     * @see org.vmgs.genericDao.IGenericDao#delete(java.lang.Object)
     */
    // @Override
    public void delete(Object id) {
        this.em.remove(this.em.getReference(type, id));
    }

    /*
     * (non-Javadoc)
     *
     * @see org.vmgs.genericDao.IGenericDao#find(java.lang.Object)
     */
    // @Override
    public T find(Object id) {
        return this.em.find(type, id);
    }

    /*
     * (non-Javadoc)
     *
     * @see org.vmgs.genericDao.IGenericDao#update(java.lang.Object)
     */
    // @Override
    public T update(T t) {
        return this.em.merge(t);
    }

    /*
     * (non-Javadoc)
     *
     * @see org.vmgs.genericDao.IGenericDao#all(java.lang.Object)
     */
    // @Override
    public List<T> all() {
        Query query = em.createQuery("FROM " + type.getName());
        List<T> list = query.getResultList();
        return list;
    }

}
