package com.luv2code.springdemo.dao;

import com.luv2code.springdemo.entity.Customer;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public class CustomerDAOImpl implements CustomerDAO{
    // need to inject the session factory
//    @Autowired
    private SessionFactory sessionFactory;

    @Autowired
    public CustomerDAOImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public List<Customer> getCustomers() {
//         get current hibernate session
        Session currentSession = sessionFactory.getCurrentSession();
        // create a query and sort it by last name
        Query<Customer> query = currentSession.createQuery("FROM Customer ORDER BY lastName", Customer.class);
        // execute query and get result list
        // return the results
        return query.getResultList();
    }

    @Override
    public void save(Customer customer) {
        Session current = sessionFactory.getCurrentSession();
        current.saveOrUpdate(customer);
    }

    @Override
    public Customer getCustomer(int id) {
        Session current = sessionFactory.getCurrentSession();
        return current.get(Customer.class, id);
    }

    @Override
    public void deleteCustomer(int id) {
        Session current = sessionFactory.getCurrentSession();
        Query query = current.createQuery("DELETE FROM Customer WHERE id=:customerId");
        query.setParameter("customerId", id);
        query.executeUpdate();
    }
}
