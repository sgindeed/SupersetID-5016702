package com.library;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class LibraryManagementApplication {

    public static void main(String[] args) {
        // Load the application context from the XML configuration
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");

        // Retrieve beans to verify if they are properly configured
        BookService bookService = context.getBean(BookService.class);
        BookRepository bookRepository = context.getBean(BookRepository.class);

        // Output to confirm that beans are correctly initialized
        System.out.println("BookService bean: " + bookService);
        System.out.println("BookRepository bean: " + bookRepository);

        // Test methods to ensure they are working
        bookService.manageBooks();
        bookRepository.saveBook();
    }
}
