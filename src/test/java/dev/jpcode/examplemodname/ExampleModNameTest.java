package dev.jpcode.examplemodname;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertNotNull;

@DisplayName("ExampleModName")
public class ExampleModNameTest
{
    @Test
    @DisplayName("A logger is available")
    @Disabled("for demonstration purposes only")
    void shouldHaveLogger()
    {
        assertNotNull(ExampleModName.LOGGER);
    }
}
