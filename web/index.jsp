<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="css/estilo.css" rel = "stylesheet">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<%
   Connection con = null;
   Statement st = null;
   ResultSet rs = null;
%>

<body>
    <div id="login">

        <div class="container">
            <div id="login-row" class="row justify-content-center align-items-center">
                <div id="login-column" class="col-md-6">
                    <div id="login-box" class="col-md-12">
                        <form id="login-form" class="form" action="" method="post">
                            <h3 class="text-center text-info">Login</h3>
                            <div class="form-group">
                                <label for="username" class="text-info">Usuário:</label><br>
                                <input type="text" name="txtusuario" id="txtusuario" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label for="password" class="text-info">Senha:</label><br>
                                <input type="text" name="txtsenha" id="txtsenha" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label for="remember-me" class="text-info"><span>Lembrar-me</span> <span><input id="remember-me" name="remember-me" type="checkbox"></span></label><br>
                                <input type="submit" name="submit" class="btn btn-info btn-md" value="Logar">
                            </div>
                            <div id="register-link" class="text-right">
                                <a href="#" class="text-info">Cadastre-se</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <p align = "center" class="text-light mt-2">
                <%
                    String usuario = request.getParameter("txtusuario");
                    String senha = request.getParameter("txtsenha");
                    
                    String user = "", pass = "";
                    
                    try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost/javaweb?useTimezone=true&serverTimezone=UTC&user=root&password=");
                    st = con.createStatement();
                    rs = st.executeQuery("SELECT * FROM usuarios = '"+usuario+"' and senha  = '"+senha+"' ");
                    
                    while(rs.next()){
                    
                    user = rs.getString(3);
                    pass = rs.getString(4);
                    out.print(user);
                    }
                        } catch (Exception e) {
                        out.print(e);
                    }
                        
                    
                    

                    if (usuario == null || senha == null) {
                        out.print("Preencha os dados");
                    } else {
                        if (usuario.equals(user) && senha.equals(pass)) {
                            response.sendRedirect("usuarios.jsp");
                        } else {
                            out.print("Dados incorretos");
                        }

                    }
                %>
            </p>
        </div>
    </div>
</body>
