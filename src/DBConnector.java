import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnector {
    private static final String url = "jdbc:mysql://localhost:3306/auction";
    private static final String username = "root";
    private static final String password = "1234S";

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(url, username, password);
    }
}
