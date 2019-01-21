package connection;

import java.sql.Connection;
import java.sql.DriverManager;


public class ConnectDB {
	private Connection dbConn;
	public ConnectDB(){
		String driverName = "com.microsoft.sqlserver.jdbc.SQLServerDriver";//����JDBC����
		String dbURL = "jdbc:sqlserver://localhost:1433; DatabaseName=bookmis";//���ӷ����������ݿ�
		String userName = "sa";//Ĭ���û���
		String userPwd = "123456";//����
		try {
			Class.forName(driverName);
		    dbConn = DriverManager.getConnection(dbURL, userName, userPwd);
		    System.out.println("Connection Successful!");//������ӳɹ�����̨���Connection Successful!
		} 
		catch (Exception e) {
		    System.out.println("���ݿ�����ʧ�ܣ�");
			e.printStackTrace();
		    
		}
	}
	public Connection getdbConn(){
		return this.dbConn;
	}
}

