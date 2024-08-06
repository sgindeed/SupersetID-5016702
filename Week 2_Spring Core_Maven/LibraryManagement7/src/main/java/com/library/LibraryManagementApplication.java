package com.library;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class LibraryManagementApplication {
    public static void main(String[] args) {
        // Load Spring context from the applicationContext.xml file
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");

        // Retrieve the BookService bean from the Spring context
        BookService bookService = (BookService) context.getBean("bookService");

        // Use the bookService to interact with the BookRepository
        System.out.println("All books: " + bookService.getAllBooks());
        System.out.println("Is 'Spring Framework Basics' available? " + bookService.isBookAvailable("Spring Framework Basics"));

        // Adding a new book
        bookService.addBook("New Book Title");
        System.out.println("All books after adding a new one: " + bookService.getAllBooks());
    }
}

