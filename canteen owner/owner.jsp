%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>

<%
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
%>


<!DOCTYPE html>
<html>
<head>
  <title>product</title>
  
  <link rel="stylesheet" type="text/css" href="Semantic/semantic.min.css">
  <script src="jquery-3.3.1.js"></script>
  <script src="Semantic/semantic.min.js"></script>
</head>
<!-- <style type="text/css"> 

  h1{
      text-align: center;
      font-style: italic;
      color: blue;
    }
  table
  {
    border:1px solid gray;
    padding: 20px;
    margin:0px auto;
    border-radius: 15px;

  }
</style>-->
<body>
  <h1>product details</h1>

  <div class="ui container">

    <div class="ui button">product</div>
    
    <div class="ui fullscreen modal">
      
      <i class="close icon"></i>

      <div class="header">product details</div>

      <div class="scrolling content">

        <table class="ui blue striped table">
    <thead>
      <tr>
      	<th>Date</th>
        <th>Order id</th>
        <th>Username</th>
        <th>product id</th>
        <th>Product name</th>
        <th>Session</th>
        <th>Quantity</th>
        <th>price</th>
        <th>status</th>
        <th></th>
      </tr>
    </thead>
    <tbody>
      <%
      	Statement st= con.createStatement();
		ResultSet rs;
		rs= st.executeQuery("select * from cart_details");
		while(rs.next())
		{
      %>
        <tr>
        <td><%rs.getString("Date")%></td>
        <td><%rs.getString("order_id")%></td>
        <td><%rs.getString("username")%></td>
        <td><%rs.getString("product_id")%></td>
        <td><%rs.getString("product_name")%></td>
        <td><%rs.getString("session")%></td>
        <td><%rs.getString("quantity")%></td>
        <td><%rs.getString("price")%></td>
        <td><%rs.getString("status")%></td>
        <td><button class="ui inverted red compact icon button"><i class="trash alternate outline icon"></i></button></td>
        
        
        
      <%
    }
      %>
    </tbody>
    <tfoot>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
    </tfoot>
  </table>
      </div>
      <div class="actions">
        
      </div>
    </div>
  
  </div>

  <script type="text/javascript">

    $(".ui.button").click(function(){ 
    
      $(".ui.fullscreen.modal").modal("show");  
    
     });

    
  </script>
</body>
</html>