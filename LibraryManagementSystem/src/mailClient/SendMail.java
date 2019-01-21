package mailClient;

import java.awt.BorderLayout;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.net.Socket;
import java.util.Scanner;
import org.apache.commons.codec.binary.Base64; 
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JPasswordField;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import sun.misc.*;
public class SendMail extends JFrame{
	private static final long serialVersionUID = 1L;
	private int testNum = 0;	//测试18k的文件经过加密后循环次数
	private JTextField from;
	private JTextField to;
	private JTextField subject;
	private JTextField server;
	private JTextArea message;
	private JTextArea comm;
	private Scanner in;
	private PrintWriter out;
	private JTextField userName;
	private JPasswordField userPass;
	private String currReponse = "";	//辅助性显示当前从服务器传回来的指令
	private User user = new User();	
	public SendMail(String book_name,String date_return,String mail){
		//设置frame
		setSize(600,400);
		setTitle("My SMTP Client");
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		this.setLocationRelativeTo(null);		
		// add to frame
		JPanel p1 = new JPanel(new GridLayout(3,4));
		p1.add(new JLabel("from:"));
		from = new JTextField(20);
		from.setText("13281069@bjtu.edu.cn");
		p1.add(from);		
		p1.add(new JLabel("userPass:"));
		userName = from;
		userPass = new JPasswordField(20);
		userPass.setText("132435");
		String name = userName.getText().toString().trim();
		String pass = new String(userPass.getPassword());
		if(name != null && pass != null && !name.equalsIgnoreCase("") && !pass.equalsIgnoreCase("")){
			user.setNameAndPass(name, pass);
		}
		p1.add(userPass);
		p1.add(new JLabel("to:"));
		to = new JTextField(20);
		p1.add(to);
		to.setText(mail);
		
		p1.add(new JLabel("SMTP server:"));
		server = new JTextField(20);
		server.setText("mail.bjtu.edu.cn");
		p1.add(server);
		subject = new JTextField(20);
		subject.setText("图书到期提醒");
		p1.add(new JLabel("Subject:"));
		p1.add(subject);
		add(p1,BorderLayout.NORTH);		
		JPanel p2 = new JPanel(new GridLayout(2,1));
		message = new JTextArea();
		message.setText("您所借的图书《"+book_name+"》已到期，应还日期为:"+date_return+",请您及时归还！");
		p2.add(new JScrollPane(message));		
		comm = new JTextArea();
		comm.setEditable(false);
		comm.setText("Waiting...");
		p2.add(new JScrollPane(comm));
		add(p2,BorderLayout.CENTER);
		
		JPanel p3 = new JPanel();
		JButton sendButton = new JButton("send");
		p3.add(sendButton);
		add(p3,BorderLayout.SOUTH);
		comm.setText("");
		sendMail(server.getText().trim(),from.getText().trim(),to.getText().trim(),message.getText(),subject.getText(),userName.getText(),userPass.getText());
	}
		

	private void sendMail(String server, String from, String to, String message, String sub,String user_name,String key) {
		try{
			Socket s = new Socket(server,25);			
			try{
				in = new Scanner(s.getInputStream());
				out = new PrintWriter(s.getOutputStream());
							
				currReponse = in.nextLine();
				if(currReponse.substring(0, 3).compareToIgnoreCase("220") == 0){
					send("helo " + server);	//握手，成功返回220表示服务就位，或者可以使用ehlo命令
					receive();
				}				
				if(currReponse.substring(0, 3).compareToIgnoreCase("250") == 0){
					send("AUTH LOGIN");	//发送登陆命令
					receive();
					BASE64Encoder coder = new BASE64Encoder();
					send(coder.encode(user_name.getBytes()));
					receive();
					send(coder.encode(key.getBytes()));
					receive();
				}
				if(currReponse.substring(0, 3).compareToIgnoreCase("334") == 0){
					send(user.getBase64Name(),false);	//不显示用户名
					receive();
				}else if(currReponse.substring(0, 3).compareToIgnoreCase("535") == 0){
					JOptionPane.showMessageDialog(null, "请登录", "alert", JOptionPane.ERROR_MESSAGE); 
					return;
				}				
				if(currReponse.substring(0, 3).compareToIgnoreCase("334") == 0){
					send(user.getBase64Pass(),false);	//不显示密码
					receive();
				}else if(currReponse.substring(0, 3).compareToIgnoreCase("535") == 0){
					JOptionPane.showMessageDialog(null, "请登录", "alert", JOptionPane.ERROR_MESSAGE); 
					return;
				}				
				if(currReponse.substring(0, 3).compareToIgnoreCase("235") == 0){
					send("MAIL FROM:<" + from + ">");	//发件人邮箱
					receive();
				}				
				if(currReponse.substring(0, 3).compareToIgnoreCase("250") == 0){
					send("RCPT TO:<" + to + ">");	//收件人信箱
					receive();
				}				
				if(currReponse.substring(0, 3).compareToIgnoreCase("250") == 0){
					send("DATA");	//开始发送邮件内容
					receive();
				}				
				if(currReponse.substring(0, 3).compareToIgnoreCase("354") == 0){
					send("Subject:" + sub);
					send("From:\"\"<" + from + ">");	//会显示在收件人邮箱中“发件人”那一栏
					send("To:\"\"<" + to + ">");	//会显示在收件人邮箱中“收件人”那一栏
					//send("CC:抄送人<chaosong@bjtu.edu.cn>");	//抄送, \"\"的作用是将后面的用户名提取出来放到这里，省的写了
					send("");	//换一行，区分标题和内容
					send(message);	//正式的内容
					send(".");	//最终以‘.’结束
					receive();
				}			
				if(currReponse.substring(0, 3).compareToIgnoreCase("250") == 0){
					send("QUIT");
					receive();
				}
			}finally{
				s.close();
			}
		}catch(IOException e){
			comm.append("Error: " + e);
		}
		
	}
	private void send(String s) {
		comm.append("C:\t" + s + "\n");
		out.print(s);
		out.print("\r\n");
		out.flush();		
	}
	
	private void send(String s, boolean f) {
		if(f){
			comm.append("C:\t" + s + "\n");
			out.print(s);
			out.print("\r\n");
			out.flush();
		}else{
			//不显示用户的账号和密码
			comm.append("C:\t" + "*******" + "\n");
			out.print(s);
			out.print("\r\n");
			out.flush();
		}
	}

	private void receive() {
		currReponse = in.nextLine();
		comm.append("S:\t" + currReponse + "\n");
	}

}
