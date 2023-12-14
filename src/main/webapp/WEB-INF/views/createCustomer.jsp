<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Customer Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }

        h1 {
            color: #333;
        }

        .form-container {
            max-width: 500px;
            margin: 0 auto;
            padding: 20px;
            background-color: #f2f2f2;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #555;
        }

        input[type="text"],
        input[type="date"],
        select {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            padding: 10px 20px;
            font-size: 16px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
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
                    }
    </style>
</head>
<body>
 <a class="return-button" href="/admin/welcome">&larr; Return</a>
<div class="form-container">
    <h1>Add Customer Details</h1>
    <form action="createCustomerAccount" method="post" modelAttribute="customerDetails">
        <div class="form-group">
            <label for="customerName">Customer Name</label>
            <input type="text" id="customerName" name="customer_name" required>
        </div>
        <div class="form-group">
            <label for="accountNumber">Account Number</label>
            <input type="text" id="accountNumber" name="customerAccountNumber" required>
        </div>
        <div class="form-group">
            <label for="accountType">Account Type</label>
            <select id="accountType" name="customer_AccountType" required>
                <option value="">Select Account Type</option>
                <option value="Savings">Savings</option>
                <option value="Checking">Checking</option>
                <option value="Investment">Investment</option>
                <option value="Loan">Loan</option>
            </select>
        </div>
        <div class="form-group">
            <label for="dob">Date of Birth</label>
            <input type="date" id="dob" name="customer_Dob" required>
        </div>
        <div class="form-group">
            <label for="bankBranch">Bank Branch</label>
            <select id="bankBranch" name="customer_BankBranch" required>
                <option value="">Select Bank Branch</option>
                <% List<String> bankBranches = (List<String>) request.getAttribute("bankCodes"); %>
                <% if (bankBranches != null && !bankBranches.isEmpty()) { %>
                    <% for (String bankBranch : bankBranches) { %>
                        <option value="<%= bankBranch %>"><%= bankBranch %></option>
                    <% } %>
                <% } %>
            </select>
        </div>

        <div class="form-group">
            <input type="submit" value="Add Customer">
        </div>
    </form>
</div>
</body>
</html>
