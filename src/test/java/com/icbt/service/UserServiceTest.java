package com.icbt.service;

import com.icbt.model.User;
import org.junit.jupiter.api.*;

import static org.junit.jupiter.api.Assertions.*;

@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class UserServiceTest {

    private static UserService userService;

    @BeforeAll
    public static void setup() {
        userService = new UserService();
    }

    @Test
    @Order(1)
    public void testLoginSuccess() {
        // Use a valid username and password that exists in your DB
        String username = "Test";
        String password = "Test123";

        User user = userService.login(username, password);
        assertNotNull(user, "User should not be null for valid credentials");
        assertEquals(username, user.getName(), "Usernames should match");
    }

    @Test
    @Order(2)
    public void testLoginFailureWithWrongPassword() {
        String username = "testuser";
        String password = "wrongpass";

        User user = userService.login(username, password);
        assertNull(user, "User should be null for incorrect password");
    }

    @Test
    @Order(3)
    public void testLoginFailureWithInvalidUsername() {
        String username = "nonexistent";
        String password = "any";

        User user = userService.login(username, password);
        assertNull(user, "User should be null for nonexistent username");
    }
}

