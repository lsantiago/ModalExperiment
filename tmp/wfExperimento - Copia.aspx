<%@ Page Language="VB" AutoEventWireup="false" CodeFile="wfExperimento - Copia.aspx.vb" Inherits="wfExperimento" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <!-- CSS de Bootstrap -->
     <link href="css/bootstrap.min.css" rel="stylesheet" media="screen" /> 
    <link rel="stylesheet" href="css/formulario.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <section id="contenedor">
                <header>
                    <h1>
                        <!-- <img src="" alt="logo.png" />-->

                    </h1>
                </header>
                <section id="configuracion">


                    <article id="datos_iniciales">
                        <fieldset>
                            <legend>Choose category</legend>
                            <asp:RadioButtonList ID="rbCategoria" runat="server" Width="300px">
                                <asp:ListItem>Modal Analysis VLNA</asp:ListItem>
                                <asp:ListItem>Modal Analyisis VLA</asp:ListItem>
                                <asp:ListItem>Modal Analysis VASNEE</asp:ListItem>
                                <asp:ListItem>Modal Analysis VASAEE</asp:ListItem>

                            </asp:RadioButtonList>
                            
                        </fieldset>

                    </article>


                    <article id="datos_iniciales2">
                        <fieldset>
                            <legend>Initial Data</legend>
                            <asp:Label ID="lblNCL" runat="server" Text="NCL" CssClass="etiqueta"></asp:Label>
                        <asp:TextBox ID="tbNCL" runat="server"></asp:TextBox>
                        <br/>
                        <asp:Label ID="lblTO" runat="server" Text="to"  CssClass="etiqueta"></asp:Label>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        <br/>
                        <asp:Label ID="Label2" runat="server" Text="&#916;pa"  CssClass="etiqueta"></asp:Label>
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                        <br/>
                        <asp:Label ID="Label3" runat="server" Text="tf"  CssClass="etiqueta"></asp:Label>
                        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                        </fieldset>
                        
                        

                    </article>

                    <article id="datos_iniciales3">
                        <fieldset>
                            <legend>Graphic</legend>
                        </fieldset>
                    </article>

                </section>
                <section id="resultado">
                </section>
                <footer>
                </footer>
            </section>
            <!-- contenedor -->
        </div>
    </form>

    
    <script src="http://code.jquery.com/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    
</body>
</html>
