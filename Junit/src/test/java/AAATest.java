import org.junit.Test;
import static org.junit.Assert.*;

public class AAATest {

    @Test
    public void testMultiply() {

        // Arrange
        Calculator calc = new Calculator();
        int a = 4;
        int b = 5;

        // Act
        int result = calc.multiply(a, b);

        // Assert
        assertEquals(20, result);
    }
}