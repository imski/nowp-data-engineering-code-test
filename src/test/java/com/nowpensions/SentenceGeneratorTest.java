package com.nowpensions;

import org.junit.Test;

import java.util.List;

import static org.junit.Assert.*;
import static com.nowpensions.SentenceGenerator.*;

public class SentenceGeneratorTest {
    @Test
    public void singleSentence() {
        assertEquals("James drives cars.",
                generateSentences(List.of("James"),
                        List.of("drives"),
                        List.of("cars")));
    }

    @Test
    public void multipleSentence() {
        assertEquals("James drives bikes. James drives cars. James hates bikes. James hates cars. James loves bikes. James loves cars. Steve drives bikes. Steve drives cars. Steve hates bikes. Steve hates cars. Steve loves bikes. Steve loves cars.",
                generateSentences(List.of("Steve", "James"),
                        List.of("loves", "hates", "drives"),
                        List.of("cars", "bikes")));
    }

    @Test
    public void reorderSentence() {
        assertEquals(generateSentences(List.of("Steve", "James"),
                List.of("loves", "drives", "hates"),
                List.of("bikes", "cars")),
                generateSentences(List.of("Steve", "James"),
                        List.of("loves", "hates", "drives"),
                        List.of("cars", "bikes")));
    }

}