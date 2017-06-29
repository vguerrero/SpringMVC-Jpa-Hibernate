package org.vmgs.concreteDao;

import org.springframework.stereotype.Component;
import org.vmgs.entities.Person;
import org.vmgs.genericDao.GenericDaoImpl;

@Component("personDao")
public class PersonDao extends GenericDaoImpl<Person> implements IPersonDao   {

}
