package com.library;

import java.util.List;

public class BookService {
    private BookRepository bookRepository;

    // Constructor Injection
    public BookService(BookRepository bookRepository) {
        this.bookRepository = bookRepository;
    }

    // Setter Injection
    public void setBookRepository(BookRepository bookRepository) {
        this.bookRepository = bookRepository;
    }

    // Getter for BookRepository
    public BookRepository getBookRepository() {
        return bookRepository;
    }

    // Method to retrieve all books
    public List<String> getAllBooks() {
        return bookRepository.getAllBooks();
    }

    // Method to add a book
    public void addBook(String book) {
        bookRepository.addBook(book);
    }

    // Method to check if a book is available
    public boolean isBookAvailable(String title) {
        return bookRepository.findBook(title);
    }
}
