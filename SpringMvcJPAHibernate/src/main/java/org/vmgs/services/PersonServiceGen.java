package org.vmgs.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.vmgs.concreteDao.IPersonDao;
import org.vmgs.entities.Person;

/**
 * @author Victor Guerrero.
 * @copy Todos los derechos reservados.
 * @version 1.0
 */
@Service("personServiceGen")
@Transactional
public class PersonServiceGen implements IPersonServiceGen {

    @Autowired
    private IPersonDao dao;

    // @Override
    public void createUser(Person p) {
        dao.create(p);
    }

    // @Override
    public List<Person> getAll() {
        return dao.all();
    }

}
