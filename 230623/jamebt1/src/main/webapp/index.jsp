<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Product Discount Calculator</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
</head>
<body>
<h1 class="text-center"><%= "Calculator Discount" %>
</h1>
<div class="container">
    <form action="/pdc" method="post">
        <table class="table">
            <tr>
                <td><label for="1">Product Description </label></td>
                <td><input id="1" type="text" name="Description" placeholder="Enter your word: "/></td>
            </tr>
            <tr>
                <td><label for="2">List Price</label></td>
                <td><input id="2" type="text" name="Price" placeholder="Enter Number: "/></td>
            </tr>
            <tr>
                <td><label for="3">Discount Percent</label></td>
                <td><input id="3" type="text" name="Percent" placeholder="Enter Number: "/></td>
            </tr>
            <tr>
                
            </tr>
        </table>
    </form>
</div>
</body>
</html>