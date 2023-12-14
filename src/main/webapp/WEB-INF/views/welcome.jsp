<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Welcome Page</title>

  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f2f2f2;
      margin: 0;
      padding: 0;
    }

    main {
      max-width: 600px;
      margin: 0 auto;
      padding: 20px;
      background-color: #ffffff;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      border-radius: 5px;
      margin-top: 100px;
      text-align: center;
    }

    h1 {
      margin-bottom: 30px;
    }

    a {
      display: block;
      margin-bottom: 10px;
      text-decoration: none;
      color: #333333;
      padding: 10px 20px;
      background-color: #f2f2f2;
      border-radius: 5px;
      transition: background-color 0.3s ease;
    }

    a:hover {
      background-color: #e0e0e0;
    }
  </style>
</head>
<body>
<main>
  <h1>Welcome to SKT Bank</h1>

  <a href="${pageContext.request.contextPath}/admin/addBranch">Add Branch</a>
  <a href="${pageContext.request.contextPath}/admin/createCustomer">Create Customer</a>
  <a href="${pageContext.request.contextPath}/admin/viewCustomers">View Customers</a>
    <a href="${pageContext.request.contextPath}/admin/changePassword">Change Password</a>
  <a href="${pageContext.request.contextPath}/admin/logout">Logout</a>
</main>
</body>
</html>
