package com.library.repository;

import java.util.ArrayList;
import java.util.List;

public class BookRepository {

    private List<String> books = new ArrayList<>();

    public BookRepository() {
        books.add("The Great Gatsby");
        books.add("To Kill a Mockingbird");
        books.add("1984");
    }

    public List<String> findAll() {
        return books;
    }

    public void addBook(String book) {
        books.add(book);
    }

    public String findByTitle(String title) {
        for (String book : books) {
            if (book.equalsIgnoreCase(title)) {
                return book;
            }
        }
        return null;
    }
}
