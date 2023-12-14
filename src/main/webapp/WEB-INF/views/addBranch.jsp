<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Add Branch Page</title>

  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f2f2f2;
      margin: 0;
      padding: 0;
    }

    main {
      max-width: 400px;
      margin: 0 auto;
      padding: 20px;
      background-color: #ffffff;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      border-radius: 5px;
      margin-top: 100px;
    }

    h1 {
      text-align: center;
      margin-bottom: 20px;
    }

    form {
      display: flex;
      flex-direction: column;
    }

    label {
      margin-bottom: 10px;
    }

    input[type="text"] {
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 5px;
      margin-bottom: 10px;
    }

    input[type="submit"] {
      padding: 10px;
      background-color: #4caf50;
      color: #ffffff;
      border: none;
      cursor: pointer;
      border-radius: 5px;
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
<main>
 <a class="return-button" href="/admin/welcome">&larr; Return</a>
  <h1>Add a bank branch</h1>
  <form action="addBankBranch" modelAttribute="bankDetails" method="POST">
    <label for="bankBranch">Branch Name:</label>
    <input type="text" id="bankBranch" name="bankBranch" required/>

    <label for="bankAddress">Branch Address:</label>
    <input type="text" id="bankAddress" name="bankAddress" required/>

    <label for="managerName">Manager Name:</label>
    <input type="text" id="managerName" name="managerName" required/>

    <input type="submit" value="Add Branch"/>
  </form>
</main>
</body>
</html>
