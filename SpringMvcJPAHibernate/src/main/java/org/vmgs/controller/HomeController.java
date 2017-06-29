package org.vmgs.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.vmgs.concreteDao.IPersonDao;
import org.vmgs.concreteDao.IProductDao;
import org.vmgs.entities.Person;
import org.vmgs.entities.Product;
import org.vmgs.services.IPersonServiceGen;
import org.vmgs.services.PersonService;

/**
 *
 * @author Victor Guerrero.
 * @copy Todos los derechos reservados
 * @version 1.0
 */
@Controller
@RequestMapping(value = "/home")
@Transactional
public class HomeController {

    protected static Logger logger = Logger.getLogger("PersonController");

    @Resource(name = "personService")
    private PersonService personService;

    /*
     * desde el concrete dao extends de genericos
     */
    @Autowired
    private IPersonDao personDao;

    @Autowired
    private IProductDao productDao;

    /*
     * este es un extends de generico tipo person
     */
    @Resource(name = "personServiceGen")
    private IPersonServiceGen personServiceGen;

    @RequestMapping(value = "/index")
    public String index() {

        return "index";
    }

    @RequestMapping(value = "/listPerson")
    @Transactional(readOnly = true)
    public String PersonList(Model model) {
        List<Person> list = personDao.all();
        logger.error("entro a lista de personas");
        logger.debug("Numero de Personas: " + list.size());
        model.addAttribute("persons", list);
        return "personList";
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String getAdd(Model model) {
        logger.debug("Received request to show add page");
        // Create new Person and add to model
        model.addAttribute("Person", new Person());
        return "addPerson";
    }

    /**
     * Adds a new Person @ModelAttribute("person")
     */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String postAdd(@Valid @ModelAttribute("Person") Person person, BindingResult result) {
        logger.error("entro a postAdd");

        boolean b = result.hasErrors();
        logger.error(b);
        // usamos un servicio que extiende del generico
        if (!b) {
            personServiceGen.createUser(person);
        } else {
            logger.error("error in person Add validation");
            return "addPerson";
        }

        // Redirect to url
        return "redirect:listPerson";
    }

    /**
     * Retrieves the "Edit Existing Record" page
     */
    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public String getEdit(@RequestParam("id") Integer personId, Model model) {
        logger.debug("Received request to show edit page");

        // Retrieve person by id
        Person existingPerson = personDao.find(personId);

        // Add to model
        model.addAttribute("Person", existingPerson);

        // This will resolve to /WEB-INF/jsp/edit-record.jsp
        return "editPerson";
    }

    /*
     * tambien se puede recibir el parametro de esta forma
     */
    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    @Transactional(readOnly = true)
    public String getEdit2(@PathVariable Integer id, Model model) {
        logger.error("entro por edit2");

        // Retrieve person by id
        Person existingPerson = personDao.find(id);
        // Add to model
        model.addAttribute("Person", existingPerson);
        return "editPerson";
    }

    /**
     * Edits an existing record
     */
    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public ModelAndView postEdit(@RequestParam("id") Integer personId, @Valid @ModelAttribute("Person") Person person, BindingResult result) {
        logger.error("person id" + person.getId());
        // Assign id
        person.setId(personId);
        // validate
        logger.error(result.hasErrors());
        if (result.hasErrors()) {
            return new ModelAndView("editPerson", "Person", person);

        } else {
            personService.edit(person);
            return new ModelAndView("redirect:listPerson");
        }

    }

    /**
     * Deletes a record including all the associated credit cards
     */
    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String getDelete(@RequestParam("id") Integer personId) {
        logger.debug("Received request to delete record");

        personService.delete(personId);

        // Redirect to url
        return "redirect:listPerson";
    }

    @RequestMapping(value = "/productList")
    public ModelAndView ProductList(ModelAndView model) {
        List<Product> list = productDao.all();
        model = new ModelAndView("productList", "products", list);
        return model;
    }
}
