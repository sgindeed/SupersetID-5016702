package com.library;

import java.util.ArrayList;
import java.util.List;

public class BookRepository {

    private List<String> books;

    public BookRepository() {
        books = new ArrayList<>();
        books.add("Spring Framework Basics");
        books.add("Advanced Spring");
    }

    public void addBook(String book) {
        books.add(book);
    }

    public List<String> getAllBooks() {
        return books;
    }

    public boolean findBook(String title) {
        return books.contains(title);
    }

    // Additional methods for book management can be added here
}