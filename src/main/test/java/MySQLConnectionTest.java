import org.junit.Test;

import java.sql.Connection;
import java.sql.DriverManager;

public class MySQLConnectionTest {

    private static final String DRIVER = "org.mariadb.jdbc.Driver";
    private static final String URL = "jdbc:mariadb://121.190.105.11:3306/jnpsolution_wms?serverTimezone=Asia/Seoul";
    private static final String USER = "jnpsolution_wms";
    private static final String PW = "ujJQ3gc0NBJgpUci";

    @Test
    public void testConnection() throws Exception {
        Class.forName(DRIVER);

        try (Connection con = DriverManager.getConnection(URL, USER, PW)) {
            System.out.println(con);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
