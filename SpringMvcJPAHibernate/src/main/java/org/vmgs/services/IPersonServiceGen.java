package org.vmgs.services;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;
import org.vmgs.entities.Person;

/**
 *
 * @author Victor Guerrero.
 * @copy Todos los derechos reservados
 * @version 1.0
 */
public interface IPersonServiceGen {

    @Transactional
    void createUser(Person p);

    List<Person> getAll();
}
