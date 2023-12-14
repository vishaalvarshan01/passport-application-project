<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Change Password Page</title>
    <style>
      body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        padding: 20px;
      }
      main {
        max-width: 450px;
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
      .form-group {
        margin-bottom: 15px;
      }
      label {
        display: block;
        margin-bottom: 5px;
        font-weight: bold;
      }
      input[type="email"],
      input[type="password"] {
        width: 100%;
        padding: 8px;
        border-radius: 4px;
        margin-left: -10px;
        border: 1px solid #ccc;
      }
      button[type="submit"] {
        display: block;
        width: 100%;
        padding: 10px;
        background-color: #4caf50;
        color: #fff;
        border: none;
        border-radius: 4px;
        cursor: pointer;
      }
      button[type="submit"]:hover {
        background-color: #45a049;
      }
      .msg {
          margin-top: 20px;
          text-align: center;
          color: #ff0000;
          font-weight: bold;
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
      <h1>Change Password</h1>
      <div class="msg">${msg}</div>
      <form action="changePassword" method="POST">
        <div class="form-group">
          <label for="email">Email:</label>
          <input type="email" id="email" name="email" required>
        </div>
        <div class="form-group">
          <label for="new-password">New Password:</label>
          <input type="password" id="new-password" name="newPassword" required>
        </div>
        <div class="form-group">
          <label for="confirm-password">Confirm Password:</label>
          <input type="password" id="confirm-password" name="confirmPassword" required>
        </div>
        <button type="submit">Change Password</button>
      </form>
    </main>
  </body>
</html>
