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
	private int testNum = 0;	//����18k���ļ��������ܺ�ѭ������
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
	private String currReponse = "";	//��������ʾ��ǰ�ӷ�������������ָ��
	private User user = new User();	
	public SendMail(String book_name,String date_return,String mail){
		//����frame
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
		subject.setText("ͼ�鵽������");
		p1.add(new JLabel("Subject:"));
		p1.add(subject);
		add(p1,BorderLayout.NORTH);		
		JPanel p2 = new JPanel(new GridLayout(2,1));
		message = new JTextArea();
		message.setText("�������ͼ�顶"+book_name+"���ѵ��ڣ�Ӧ������Ϊ:"+date_return+",������ʱ�黹��");
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
					send("helo " + server);	//���֣��ɹ�����220��ʾ�����λ�����߿���ʹ��ehlo����
					receive();
				}				
				if(currReponse.substring(0, 3).compareToIgnoreCase("250") == 0){
					send("AUTH LOGIN");	//���͵�½����
					receive();
					BASE64Encoder coder = new BASE64Encoder();
					send(coder.encode(user_name.getBytes()));
					receive();
					send(coder.encode(key.getBytes()));
					receive();
				}
				if(currReponse.substring(0, 3).compareToIgnoreCase("334") == 0){
					send(user.getBase64Name(),false);	//����ʾ�û���
					receive();
				}else if(currReponse.substring(0, 3).compareToIgnoreCase("535") == 0){
					JOptionPane.showMessageDialog(null, "���¼", "alert", JOptionPane.ERROR_MESSAGE); 
					return;
				}				
				if(currReponse.substring(0, 3).compareToIgnoreCase("334") == 0){
					send(user.getBase64Pass(),false);	//����ʾ����
					receive();
				}else if(currReponse.substring(0, 3).compareToIgnoreCase("535") == 0){
					JOptionPane.showMessageDialog(null, "���¼", "alert", JOptionPane.ERROR_MESSAGE); 
					return;
				}				
				if(currReponse.substring(0, 3).compareToIgnoreCase("235") == 0){
					send("MAIL FROM:<" + from + ">");	//����������
					receive();
				}				
				if(currReponse.substring(0, 3).compareToIgnoreCase("250") == 0){
					send("RCPT TO:<" + to + ">");	//�ռ�������
					receive();
				}				
				if(currReponse.substring(0, 3).compareToIgnoreCase("250") == 0){
					send("DATA");	//��ʼ�����ʼ�����
					receive();
				}				
				if(currReponse.substring(0, 3).compareToIgnoreCase("354") == 0){
					send("Subject:" + sub);
					send("From:\"\"<" + from + ">");	//����ʾ���ռ��������С������ˡ���һ��
					send("To:\"\"<" + to + ">");	//����ʾ���ռ��������С��ռ��ˡ���һ��
					//send("CC:������<chaosong@bjtu.edu.cn>");	//����, \"\"�������ǽ�������û�����ȡ�����ŵ����ʡ��д��
					send("");	//��һ�У����ֱ��������
					send(message);	//��ʽ������
					send(".");	//�����ԡ�.������
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
			//����ʾ�û����˺ź�����
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
