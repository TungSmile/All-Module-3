<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 26-Jun-23
  Time: 2:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
  <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
  <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
  <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <link href="/styleRG.css" rel="stylesheet" >

</head>
<body>

<div class="container register-form">
  <div class="form">
    <form action="/reg" method="post" >
      <div class="note">
      <p>This is a simpleRegister Form made using Boostrap.</p>
    </div>
    <div class="form-content">
      <div class="row">
        <div class="col-md-6">
          <div class="form-group">
            <input name="id" type="text" class="form-control" placeholder="ID" value=""/>
          </div>
        </div>
        <div class="col-md-6">
          <div class="form-group">
            <input name="pass" type="text" class="form-control" placeholder="Your Password *"
                   value=""/>
          </div>
        </div>
      </div>
      <button type="submit" class="btnSubmit">Submit</button>
    </div>
    </form>
  </div>
</div>

</body>
</html>
