<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.model.CustomerStatement" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Verify Checks Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            padding: 20px;
        }

        main {
            max-width: 800px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f5f5f5;
        }

        .success {
            color: #008000;
        }

        .failure {
            color: #ff0000;
        }

        .verify-button {
            display: inline-block;
            padding: 5px 10px;
            background-color: #4caf50;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .verify-button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<main>
    <h1>Verify Checks</h1>
    <table>
        <tr>
            <th>Date</th>
            <th>Account Number</th>
            <th>IFSC Code</th>
            <th>Type</th>
            <th>Amount</th>
            <th>Status</th>
            <th>Action</th>
        </tr>
        <% List<CustomerStatement> statements = (List<CustomerStatement>) request.getAttribute("statements");
           if (statements != null) {
               for (CustomerStatement statement : statements) {
                   String action = statement.getAction();
                   String statusClass = (action.equals("verified")) ? "success" : "failure";
        %>
        <tr>
            <td><%= statement.getStatementDate() %></td>
            <td><%= statement.getAccountNumber() %></td>
            <td><%= statement.getIfscCode() %></td>
            <td><%= statement.getType() %></td>
            <td><%= statement.getAmount() %></td>
            <td class="<%= statusClass %>"><%= statement.getAction() %></td>
            <td>
                <form method="POST" action="verifyCheck">
                    <input type="hidden" name="customerStatementId" value="<%= statement.getCustomerStatementId() %>">
                    <button type="submit" class="verify-button">Verify</button>
                </form>
            </td>
        </tr>
        <% } } %>
    </table>
</main
