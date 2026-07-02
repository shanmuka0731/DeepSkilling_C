# Hands-on 4: Difference Between JPA, Hibernate and Spring Data JPA

## Java Persistence API (JPA)

Java Persistence API (JPA) is a specification (JSR 338) that defines standard guidelines for persisting, retrieving, updating, and deleting Java objects from a relational database. It provides annotations such as `@Entity`, `@Table`, `@Id`, and interfaces like `EntityManager`, but it does not contain any implementation. Since JPA is only a specification, it requires an implementation such as Hibernate to perform database operations.

### Advantages of JPA

* Provides a standard API for persistence.
* Makes applications independent of a specific ORM framework.
* Improves portability between different JPA providers.
* Reduces dependency on vendor-specific code.

---

## Hibernate

Hibernate is an Object Relational Mapping (ORM) framework that implements the JPA specification. It converts Java objects into database records and database records back into Java objects automatically. Hibernate manages SQL generation, object mapping, caching, and transaction handling.

In Hibernate, developers manually manage the database session and transaction.

Example:

```java
Session session = factory.openSession();
Transaction tx = session.beginTransaction();

session.save(employee);

tx.commit();
session.close();
```

The developer is responsible for:

* Opening the session.
* Beginning the transaction.
* Saving the object.
* Committing or rolling back the transaction.
* Closing the session.

### Advantages of Hibernate

* Automatic object-relational mapping.
* Reduces SQL coding.
* Supports caching for better performance.
* Database independent.
* Implements the JPA specification.

---

## Spring Data JPA

Spring Data JPA is a Spring Framework module that simplifies database access by reducing boilerplate code. It is built on top of JPA and usually uses Hibernate as its default implementation.

Instead of manually writing session and transaction management code, developers simply create a repository interface by extending `JpaRepository`.

Example:

```java
public interface EmployeeRepository extends JpaRepository<Employee, Integer> {
}
```

Service class:

```java
@Autowired
private EmployeeRepository employeeRepository;

@Transactional
public void addEmployee(Employee employee) {
    employeeRepository.save(employee);
}
```

Spring Data JPA automatically:

* Creates the repository implementation.
* Opens and closes database sessions.
* Manages transactions.
* Generates SQL queries.
* Executes CRUD operations.

### Advantages of Spring Data JPA

* Very little code is required.
* Automatic implementation of CRUD methods.
* Transaction management using `@Transactional`.
* Easy integration with Spring Boot.
* Improved productivity and maintainability.

---

## Comparison of JPA, Hibernate and Spring Data JPA

| JPA                           | Hibernate                            | Spring Data JPA                              |
| ----------------------------- | ------------------------------------ | -------------------------------------------- |
| Specification for persistence | ORM framework implementing JPA       | Spring module built on JPA                   |
| No implementation             | Provides implementation              | Uses Hibernate internally                    |
| Defines persistence standards | Maps Java objects to database tables | Reduces boilerplate code                     |
| Database independent          | Database independent                 | Database independent                         |
| Cannot work alone             | Can work independently               | Works with JPA implementation like Hibernate |

---

## Conclusion

JPA defines the standard rules for persistence, Hibernate provides the implementation of those rules, and Spring Data JPA simplifies Hibernate by reducing boilerplate code and providing built-in repository methods. Together, they make Java database applications easier to develop, maintain, and scale.
