import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;


public class DBagent {
    private static final String url = "jdbc:mysql://localhost:8080/zxdb"; //если надо меняем на jdbc:postgresql://localhost:5432/myDB
    private static final String user = "root";	//или "postgres"
    private static final String password = "root";	//или "postgres"

    
	public Connection getConnection() {
	    //stmt = con.createStatement();
		String query = "select id, name from customers";
		
		try {
			Class.forName("org.mysql.Driver");	//или "org.postgresql.Driver"
			Connection conn = DriverManager.getConnection(url, user, password);
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			
			return conn;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return null;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		
		
	}
}
