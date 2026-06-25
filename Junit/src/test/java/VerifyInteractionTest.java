import org.junit.Test;
import static org.mockito.Mockito.*;

public class VerifyInteractionTest {

    @Test
    public void testVerifyInteraction() {

        java.util.List<String> mockList = mock(java.util.List.class);

        mockList.add("Java");

        verify(mockList).add("Java");
    }
}