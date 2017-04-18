

<%@page import="tmdt.web.entity.User"%>
<%@page contentType="text/html" pageEncoding="windows-1258"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1258">
        <title>Admin Control Panel</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//code.jquery.com/jquery-1.10.2.min.js"></script>
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    </head>
    <body>
        <% User admin = (User) request.getSession().getAttribute("admin");
        if (admin == null)
        {
        %>
        <div class="col-md-12">
    <div class="modal-dialog" style="margin-bottom:0">
        <div class="modal-content">
                    <div class="panel-heading">
                        <h3 class="panel-title">Sign In</h3>
                    </div>
                    <div class="panel-body">
                        <form action="adminlogin" method="post" onsubmit="">
                                <div class="form-group">
                                    <input class="form-control" placeholder="E-mail" name="username"  autofocus="">
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Password" name="password" type="password" value="">
                                </div>
                                <!-- Change this to a button or input when using this as a form -->
                                <input type="submit" class="btn btn-sm btn-success" value="Login"/>
                        </form>
                    </div>
                </div>
    </div>
</div>
        <% } else{ %>
        <jsp:include page="adminnav.jsp"/>
        <% } %>
    </body>
</html>
