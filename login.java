import java.sql.*;

class MysqlCon{
  
   public static void main(String args[]){  
    
	try{
	    
  	    String username = request.getParameter("username");
	    String password = request.getParameter("password");

	    Class.forName("com.mysql.jdbc.Driver");
		  
	    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306 "canteen","root","root");  //here sonoo is database name, root is username and password  
	    
		PreparedStatement stmt=con.prepareStatement("select username from customer_login where username =? and password =?);");  
		ResultSet rs=stmt.executeQuery();  
		stmt.setString(1,username);
		stmt.setString(2,password);
		
		if(username =="admin")
		{
			while(rs.next())  
			    	System.out.println(rs.getString(0));
			 response.sendRedirect("admin/admin.html");  
	    
		}
		else if(username =="owner")
		{
			while(rs.next())  
			    	System.out.println(rs.getString(0));  
	    	response.sendRedirect("owner/owner.html");
		}
		else
		{
			while(rs.next())  
			    	System.out.println(rs.getString(0));  
	    	response.sendRedirect("customer/customer.html");
		}  	
		
		
		con.close();  
       
	}
	catch(Exception e){ System.out.println(e);}  
    }  
    }  
