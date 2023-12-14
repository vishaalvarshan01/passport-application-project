<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.model.CustomerDetails" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Customers</title>
    <style>
        /* CSS styles */
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }

        main {
            padding-top: 40px; /* Add padding to the top of the main container */
        }

        h1 {
            color: #333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            text-align: center;
        }

        th, td {
            padding: 8px;
            border: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
        }

        .delete-link {
            color: #f00;
            text-decoration: none;
            border: 1px solid #f00;
            padding: 5px 10px;
            border-radius: 4px;
            background-color: #fff;
            transition: background-color 0.3s ease;
        }

        .delete-link:hover {
            background-color: #f00;
            color: #fff;
        }

        .delete-message {
            color: #f00;
            font-weight: bold;
        }

        .view-statement-link {
            display: inline-block;
            padding: 5px 10px;
            border: 1px solid #00f;
            color: #0077ff;
            text-decoration: none;
            border-radius: 4px;
            transition: background-color 0.3s ease;
        }

        .view-statement-link:hover {
            background-color: #0077ff;
            color : #fff;
        }

        .return-button {
            position: absolute;
            top: 10px;
            left: 10px;
            background-color: #f0f0f0;
            color: #333;
            padding: 8px 12px;
            border: none;
            font-size: 16px;
            cursor: pointer;
            z-index: 1; /* Add z-index to ensure the button appears above other elements */
        }
    </style>

</head>
<body>
<main>
    <a class="return-button" href="/admin/welcome">&larr; Return</a>
    <div class="form-container">
        <h1>Customer Details</h1>
        <div class="message-container">
            <span class="delete-message">${deleteMsg}</span>
        </div>
        <table>
            <tr>
                <th>Customer ID</th>
                <th>Name</th>
                <th>Account Type</th>
                <th>Date of Birth</th>
                <th>Bank Branch</th>
                <th>Action</th>
                <th>Customer Details</th>
                <th>Account Statement</th>
            </tr>

            <% List<CustomerDetails> customerDetailsList = (List<CustomerDetails>) request.getAttribute("customerDetails");
               if (customerDetailsList != null && !customerDetailsList.isEmpty()) {
                   for (CustomerDetails customerDetails : customerDetailsList) { %>
                       <tr>
                           <td><%= customerDetails.getCustomerId() %></td>
                           <td><%= customerDetails.getCustomer_name() %></td>
                           <td><%= customerDetails.getCustomer_AccountType() %></td>
                           <td><%= customerDetails.getCustomer_Dob() %></td>
                           <td><%= customerDetails.getCustomer_BankBranch() %></td>
                           <td><a href="/admin/deleteCustomer/<%= customerDetails.getCustomerId() %>" class="delete-link">Delete</a></td>
                           <td><a href="/admin/viewDetails/<%= customerDetails.getCustomerId() %>" class="view-statement-link">Details</a></td>
                           <td><a href="/admin/viewStatement/<%= customerDetails.getCustomerId()  %>" class="view-statement-link">View Account Statement</a></td>
                       </tr>
            <%      }
               } else {
            %>
                   <tr>
                       <td colspan="7"><%= request.getAttribute("msg") %></td>
                   </tr>
            <% } %>
        </table>
    </div>
</main>
</body>
</html>
