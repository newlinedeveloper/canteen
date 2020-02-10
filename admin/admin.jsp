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

	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

	<title>admin page</title>

	<link rel="stylesheet" type="text/css" href="Semantic/semantic.min.css">

	<script src="jquery-3.3.1.js"></script>
	<script src="Semantic/semantic.min.js" ></script>

</head>

<body>  
<div class="ui container">

		<div class="ui placeholder raised segment" style="margin-top: 20px;">
			<h1 class="ui center aligned blue inverted header">newLine Developers</h1>
		</div>

		<div class="ui placeholder raised segment">

			
			<div class="ui search" style="text-align: center;">
				
					<div class="ui icon input">
						<input type="text" name="search" placeholder="#product name">
						<i class="search icon"></i>
					</div>	
				
				
			</div>
			
			<div class="ui divider"></div>
			<div class="ui green button" style="text-align: right;">Add products</div>
			<div class="ui divider"></div>

			<table class="ui blue striped table">
    			<thead>
      				<tr>
        				<th>Product id</th>
        				<th>Product name</th>
        				<th>Session</th>
        				<th>Price</th>
        				<th>Quantity</th>
        				<th>List</th>
        				<th></th>
        				<th></th>
      				</tr>
    			</thead>
    			<tbody>
      				<%
      				Statement st= con.createStatement();
					ResultSet rs;
					rs= st.executeQuery("select * from product_details");
					while(rs.next())
					{
      				%>
        					<tr>
        					<td><% rs.getString("product_id");%></td>
        					<td><% rs.getString("product_name");%></td>
        					<td><% rs.getString("session");%></td>
        					<td><% rs.getString("price");%></td>
        					<td><% rs.getString("quantity");%></td>
         					<td><button class="ui inverted green compact icon button">
         						<i class="edit outline icon"></i>
         					</button></td>
         					
         					<td><button class="ui inverted red compact icon button"><i class="trash alternate outline icon"></i></button></td>

        
      					<%
    					}
      					%>
    			</tbody>
    			
  			</table>
		</div>
	</div>
	
	<div class="ui modal">

		<i class="close icon"></i>
		<div class="ui center aligned header">
			Add Products
		</div>

		<div class="content">

		<div class="ui text container">
			
		<form class="ui form raised segment" action="connect.php" method="post" enctype="multipart/form-data">

			<div class="sixteen wide field">

			<div class="field">
				<label for="pcat">product category</label>
				<div class="ui left icon input">
					<input type="text" name="pcat" id="pcat" placeholder="product category">
					<i class="cubes icon"></i>	
				</div>	
			</div>

			<div class="field">
				<label for="pname">product name: </label>
				<div class="ui left icon input">
					<input type="text" name="pname" id="pname" placeholder="product name">
					<i class="cube icon"></i>	
				</div>
				
			</div>
				

			<div class="field">
				
				<label for="stock">stock:</label>
				<div class="ui selection dropdown">
					<input type="hidden" name="qty">
					<i class="dropdown icon"></i>
					<div class="default text">Stock</div>
					<div class="menu">
						<div class="item" data-value="1">Available</div>
						<div class="item" data-value="1">Not Available</div>
					</div>
				</div>

				
				
			</div>

			<div class="field">
				<label>format:</label>
				<div class="ui selection dropdown">
					<input type="hidden" name="format">
					<i class="dropdown icon"></i>
					<div class="default text">format</div>
					<div class="menu">
						<div class="item" data-value="kg">KG</div>
						<div class="item" data-value="grams">Grams</div>
						<div class="item" data-value="litre">Litre</div>
						<div class="item" data-value="count">Count</div>
					</div>
				</div>

				
			</div>
				
			
				
				
			
		</div>
			
		</div>
				
			
		
	</form>
	
	
	

	</div>	

	<div class="actions">
		<button name="submit" id="submit" class="ui green inverted button">submit</button> 
		<button name="display" id="display" class="ui red inverted button" value="display">Display</button>
	</div>
	</div>
	</div>
	<script type="text/javascript">

		$(document).ready(function(){
			$(".ui.button").click(function(){
				$(".ui.modal").modal("show");
				$(".ui.selection.dropdown").dropdown();	
			});
			
		});
	</script>
</html>