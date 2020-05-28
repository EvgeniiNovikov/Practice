package com.example.spring.TestSweater.model.util;

import com.example.spring.TestSweater.model.User;

public abstract class MessageHelper {
    public static String getAuthorName(User author) {
        return author != null ? author.getUsername() : "<none>";
    }
}
