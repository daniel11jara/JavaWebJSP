<%-- 
    Document   : usuario
    Created on : 5 de jun. de 2024, 22:49:35
    Author     : PC
--%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="config.Conexao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css">
        <link href="css/estilos.css" rel="stylesheet">

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Usuários</title>
    </head>
    <body>

        <nav class="navbar navbar-expand-lg bg-body-tertiary">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">Lista de Usuários</a>
                <button class="navbar-toggler" type="button"  aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="#">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Link</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Dropdown
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">Action</a></li>
                                <li><a class="dropdown-item" href="#">Another action</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="#">Something else here</a></li>
                            </ul>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link disabled" aria-disabled="true">Disabled</a>
                        </li>
                    </ul>
                    <form class="d-flex" role="search">
                        <span>
                            <%
                                String nomeUsuario = (String) session.getAttribute("nomeUsuario");
                                out.print(nomeUsuario);

                                if (nomeUsuario == null) {
                                    response.sendRedirect("index.jsp");
                                }
                            %>


                        </span>

                        <a href="logout.jsp"><i class="fa-solid fa-right-from-bracket ml-1"></i></a>
                    </form>
                </div>
            </div>
        </nav>

        <div class="container">
            <div class="container mt-4 mb-4">
                <button class="btn-info btn-sm" data-bs-toggle="modal" data-bs-target="#modal">Novo Usuário</button>
                <form class="form-inline my-2 my-lg-0 text-right direita" role="search">
                    <input class="form-control form-control-sm mr-ms-2" type="search" name="txtbuscar"  placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-info btn-sm my-2 my-sm-0" type="submit">Buscar</button>
                </form>
            </div>
            <table class="table table-sm table-striped">
                <thead>
                    <tr>
                        <th scope="col">Nome:</th>
                        <th scope="col">Usuário:</th>
                        <th scope="col">Senha:</th>
                        <th scope="col">Nível:</th>
                    </tr>
                </thead>
                <tbody>

                    <%
                        Connection con = null;
                        Statement st = null;
                        ResultSet rs = null;
                        PreparedStatement pst = null;

                        String usuario = request.getParameter("txtusuario");
                        String senha = request.getParameter("txtsenha");

                        try {
                            st = new Conexao().conectar().createStatement();
                            String query = "SELECT * FROM usuario order by nome asc";

                            pst = con.prepareStatement(query);
                            pst.setString(2, usuario);
                            pst.setString(3, usuario);
                            pst.setString(4, usuario);
                            pst.setString(5, usuario);

                            rs = pst.executeQuery();

                            if (rs.next()) {
                                nomeUsuario = rs.getString("nome"); // Assumindo que o nome do usuário está na coluna 'nome'
                                session.setAttribute("nomeUsuario", nomeUsuario);
                                response.sendRedirect("usuario.jsp");
                            } else {
                                out.println("Usuário ou senha incorretos");
                            }
                        } catch (Exception e) {
                            out.print(e);
                        } finally {
                            if (rs != null) try {
                                rs.close();
                            } catch (SQLException ignore) {
                            }
                            if (pst != null) try {
                                pst.close();
                            } catch (SQLException ignore) {
                            }
                            if (con != null) try {
                                con.close();
                            } catch (SQLException ignore) {
                            }
                        }
                    %>
                    <tr>
                        <td><%= usuario%></td>
                        <td><%= usuario%></td>
                        <td><%= usuario%></td>
                        <td><%= usuario%></td>
                    </tr>

                </tbody>
            </table>



        </div>




    </body>
</html>

<!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Inserir Usuário</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="login-form" class="form" action="" method="post">
                    <h3 class="text-center text-info">Login</h3>
                    <div class="form-group">
                        <label for="username" class="text-info">Usuário</label><br>
                        <input type="text" name="txtusuario" id="txtusuario" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label for="password" class="text-info">Senha:</label><br>
                        <input type="password" name="txtsenha" id="txtsenha" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label for="remember-me" class="text-info"><span>Lembrar-me</span> <span><input id="remember-me" name="remember-me" type="checkbox"></span></label><br>
                        <input type="submit" name="submit" class="btn btn-info btn-md" value="logar">
                    </div>
                    <div id="register-link" class="text-right">
                        <a href="#" class="text-info">Cadastre-se</a>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fechar</button>
                <button type="button" class="btn btn-primary">Salvar</button>
            </div>
        </div>
    </div>
</div>
