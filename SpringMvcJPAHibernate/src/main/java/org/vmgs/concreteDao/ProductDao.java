package org.vmgs.concreteDao;



import org.springframework.stereotype.Component;
import org.vmgs.entities.Product;
import org.vmgs.genericDao.GenericDaoImpl;
@Component("productDao")
public class ProductDao extends GenericDaoImpl<Product> implements IProductDao {


}
