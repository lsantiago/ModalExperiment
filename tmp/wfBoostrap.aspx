<%@ Page Language="VB" AutoEventWireup="false" CodeFile="wfBoostrap.aspx.vb" Inherits="wfExperimento" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <!-- CSS de Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet" media="screen" />
    <link href="css/bootstrap.css" rel="stylesheet" media="screen" />
    
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="panel-group">
                            <div class="panel panel-default">
                                <div class="panel-body">Panel Content</div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-body">Panel Content</div>
                            </div>
                            <asp:RadioButtonList ID="rbModelo" runat="server">
                                <asp:ListItem>Modelo 1</asp:ListItem>
                                <asp:ListItem>Modelo 2</asp:ListItem>
                                <asp:ListItem>Modelo 4</asp:ListItem>
                                <asp:ListItem>Modelo 5</asp:ListItem>
                                <asp:ListItem>Modelo 6</asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:Button ID="btnTest" runat="server" Text="Run File" CssClass="btn btn-info" />
                        </div>
            
            <div class="input-group">
                <h1>Con Bootstrap</h1>
                <br />
                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" Width="250px" placeholder="Nombre a buscar"></asp:TextBox>&nbsp;
            <asp:Button ID="Button1" runat="server" Text="Buscar" CssClass="btn btn-info" />
            </div>
            <fieldset>
                <legend>Alta en el servicio</legend>

                <label for="nombre">Nombre</label>
                <input type="text" id="nombre" />

                <label for="apellidos">Apellidos</label>
                <input type="text" id="apellidos" size="50" />

                <label for="dni">DNI</label>
                <input type="text" id="dni" size="10" maxlength="9" />

                <label for="contrasena">Contraseña</label>
                <input type="password" id="contrasena" />

                <input class="btn" type="submit" value="Darme de alta" />
            </fieldset>
        </div>
    </form>


    <script src="http://code.jquery.com/jquery.js"></script>


    <script src="js/bootstrap.min.js"></script>
</body>
</html>
