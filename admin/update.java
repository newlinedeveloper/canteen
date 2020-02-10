import java.io.IOException; 
import java.io.PrintWriter; 
import java.sql.Connection; 
import java.sql.PreparedStatement; 

import javax.servlet.ServletException; 
import javax.servlet.annotation.WebServlet; 
import javax.servlet.http.HttpServlet; 
import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse; 

// Import Database Connection Class file 
import code.DatabaseConnection; 

// Servlet Name 
@WebServlet("/InsertData") 
public class InsertData extends HttpServlet { 
	private static final long serialVersionUID = 1L; 

	protected void doPost(HttpServletRequest request, 
HttpServletResponse response) 
		throws ServletException, IOException 
	{ 
		try { 

			String product_id = request.getParameter("pid");
			String product_name = request.getParameter("pname");
			String session = request.getParameter("session");
			String price = request.getParameter("price");
			String quantity= request.getParameter("quantity");
			
 			// Initialize the database
			Connection con = DatabaseConnection.initializeDatabase(); 

			// Create a SQL query to insert data into demo table 
			// demo table consists of two columns, so two '?' is used 
			PreparedStatement st = con.prepareStatement("update product_details set product_name = ?,session = ?,price= ?,quantity=? where product_id = ?"); 

			// For the first parameter, 
			// get the data using request object 
			// sets the data to st pointer 
			
			st.setString(1,product_name); 
			st.setString(2,session);  
			st.setString(3,price); 
			st.setString(4,quantity); 
			st.setString(5,product_id); 

			// Execute the insert command using executeUpdate() 
			// to make changes in database 
			st.executeUpdate(); 

			// Close all the connections 
			st.close(); 
			con.close(); 

			// Get a writer pointer 
			// to display the succesful result 
			PrintWriter out = response.getWriter(); 
			out.println("<html><body><b>Successfully updated"
						+ "</b></body></html>"); 
			response.sendRedirect("admin.html");
		} 
		catch (Exception e) { 
			e.printStackTrace(); 
		} 
	} 
} 
