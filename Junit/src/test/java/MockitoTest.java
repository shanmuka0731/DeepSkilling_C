import org.junit.Test;
import static org.junit.Assert.*;
import static org.mockito.Mockito.*;

public class MockitoTest {

    @Test
    public void testMocking() {

        // Create mock object
        java.util.List<String> mockList = mock(java.util.List.class);

        // Stub behavior
        when(mockList.get(0)).thenReturn("Mockito");

        // Verify result
        assertEquals("Mockito", mockList.get(0));
    }
}