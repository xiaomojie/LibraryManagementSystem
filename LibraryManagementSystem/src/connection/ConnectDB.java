package connection;

import java.sql.Connection;
import java.sql.DriverManager;


public class ConnectDB {
	private Connection dbConn;
	public ConnectDB(){
		String driverName = "com.microsoft.sqlserver.jdbc.SQLServerDriver";//加载JDBC驱动
		String dbURL = "jdbc:sqlserver://localhost:1433; DatabaseName=bookmis";//连接服务器和数据库
		String userName = "sa";//默认用户名
		String userPwd = "123456";//密码
		try {
			Class.forName(driverName);
		    dbConn = DriverManager.getConnection(dbURL, userName, userPwd);
		    System.out.println("Connection Successful!");//如果连接成功控制台输出Connection Successful!
		} 
		catch (Exception e) {
		    System.out.println("数据库连接失败！");
			e.printStackTrace();
		    
		}
	}
	public Connection getdbConn(){
		return this.dbConn;
	}
}

