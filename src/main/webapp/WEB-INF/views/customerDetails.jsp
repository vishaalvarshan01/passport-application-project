<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="java.util.List" %>
<%@ page import="com.example.model.CustomerStatement" %>
<%@ page import="com.example.model.CustomerDetails" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Customer Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f0f0f0;
        }

        main {
            max-width: 600px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border: 1px solid #ccc;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        h1 {
            color: #333;
            margin-bottom: 20px;
            text-align: center;
        }

        .section {
            margin-bottom: 30px;
        }

        .section-title {
            font-size: 18px;
            margin-bottom: 10px;
        }

        .statement-info {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .statement-label {
            font-weight: bold;
        }

        .statement-value {
            font-size: 16px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #ccc;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #f0f0f0;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .final-balance {
            font-size: 18px;
            font-weight: bold;
            margin-top: 20px;
            text-align: right;
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
<main>
    <a class="return-button" href="/admin/welcome">&larr; Return</a>

    <h1>Customer Details : </h1>

    <div class="section">
        <h2 class="section-title">Customer Details</h2>
        <div class="statement-info">
            <span class="statement-label">Customer Name:</span>
            <span class="statement-value">${customer_details.customer_name}</span>
        </div>
        <div class="statement-info">
            <span class="statement-label">Account Type:</span>
            <span class="statement-value">${customer_details.customer_AccountType}</span>
        </div>
        <div class="statement-info">
            <span class="statement-label">Account Number:</span>
            <span class="statement-value">${customer_details.customerAccountNumber}</span>
        </div>
        <div class="statement-info">
            <span class="statement-label">Date of Birth:</span>
            <span class="statement-value">${customer_details.customer_Dob}</span>
        </div>
        <div class="statement-info">
            <span class="statement-label">Bank Branch:</span>
            <span class="statement-value">${customer_details.customer_BankBranch}</span>
        </div>
    </div>

    <div class="section">
        <h2 class="section-title">Bank Details</h2>
        <div class="statement-info">
            <span class="statement-label">Bank Branch:</span>
            <span class="statement-value">${bankBranch}</span>
        </div>
        <div class="statement-info">
            <span class="statement-label">Bank Address:</span>
            <span class="statement-value">${bankAddress}</span>
        </div>
        <div class="statement-info">
            <span class="statement-label">Manager Name:</span>
            <span class="statement-value">${managerName}</span>
        </div>
    </div>


</main>
</body>
</html>
