package com.library;

import org.springframework.stereotype.Repository;

@Repository
public class BookRepository {
    public void saveBook() {
        System.out.println("Saving book");
    }
}
