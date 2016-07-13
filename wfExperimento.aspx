<%@ Page Language="VB" AutoEventWireup="false" CodeFile="wfExperimento.aspx.vb" Inherits="wfExperimento" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <!-- CSS de Bootstrap -->
    <!-- Versión compilada y comprimida del CSS de Bootstrap -->
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" />
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
                        <div class="panel panel-primary">

                            <div class="panel-heading">Modal Analysis </div>
                            <div class="panel-body">
                                <asp:RadioButtonList ID="rbCategoria" runat="server" CssClass="radio">
                                    <asp:ListItem class="radio">VLNA</asp:ListItem>
                                    <asp:ListItem class="radio">VLA</asp:ListItem>
                                    <asp:ListItem class="radio">VASNEE</asp:ListItem>
                                    <asp:ListItem class="radio">VASAEE</asp:ListItem>

                                </asp:RadioButtonList>

                            </div>

                            <table class="table">
                            </table>
                        </div>


                    </article>


                    <article id="datos_iniciales2">
                        <div class="panel panel-primary">

                            <div class="panel-heading">Initial Data</div>
                            <div class="panel-body">
                                <form class="form-horizontal" role="form">
                                    <div class="form-group">
                                        <asp:Label ID="lblNCL" runat="server" Text="NCL" class="col-lg-2 control-label"></asp:Label>
                                        <div class="col-lg-10">
                                            <asp:DropDownList ID="ddlNCL" runat="server" CssClass="form-control">
                                                <asp:ListItem Value="1"></asp:ListItem>
                                                <asp:ListItem>2</asp:ListItem>
                                                <asp:ListItem>3</asp:ListItem>
                                                <asp:ListItem>4</asp:ListItem>
                                                <asp:ListItem>5</asp:ListItem>
                                                <asp:ListItem>6</asp:ListItem>
                                                <asp:ListItem>7</asp:ListItem>
                                                <asp:ListItem>8</asp:ListItem>
                                                <asp:ListItem>9</asp:ListItem>
                                                <asp:ListItem>10</asp:ListItem>
                                                <asp:ListItem>11</asp:ListItem>
                                                <asp:ListItem>12</asp:ListItem>
                                                <asp:ListItem>13</asp:ListItem>
                                                <asp:ListItem>14</asp:ListItem>
                                                <asp:ListItem>15</asp:ListItem>
                                                <asp:ListItem>16</asp:ListItem>
                                                <asp:ListItem>17</asp:ListItem>
                                                <asp:ListItem>18</asp:ListItem>
                                                <asp:ListItem>19</asp:ListItem>
                                                <asp:ListItem>20</asp:ListItem>
                                                <asp:ListItem>21</asp:ListItem>
                                                <asp:ListItem>22</asp:ListItem>
                                                <asp:ListItem>23</asp:ListItem>
                                                <asp:ListItem>24</asp:ListItem>
                                                <asp:ListItem>25</asp:ListItem>
                                                <asp:ListItem>26</asp:ListItem>
                                                <asp:ListItem>27</asp:ListItem>
                                                <asp:ListItem>28</asp:ListItem>
                                                <asp:ListItem>29</asp:ListItem>
                                                <asp:ListItem>30</asp:ListItem>

                                            </asp:DropDownList>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <asp:Label ID="lblTO" runat="server" Text="to" class="col-lg-2 control-label"></asp:Label>
                                        <div class="col-lg-10">
                                            <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" placeholder="to"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label ID="Label2" runat="server" Text="&#916;pa" class="col-lg-2 control-label"></asp:Label>
                                        <div class="col-lg-10">
                                            <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" placeholder="&#916;pa"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label ID="Label3" runat="server" Text="tf" class="col-lg-2 control-label"></asp:Label>
                                        <div class="col-lg-10">
                                            <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" placeholder="tf"></asp:TextBox>
                                        </div>
                                    </div>
                                </form>


                            </div>


                        </div>






                    </article>

                    <article id="datos_iniciales3">

                        <div class="panel panel-success">

                            <div class="panel-heading">Graph</div>
                            <div class="panel-body">
                                <p>...</p>
                            </div>

                            <table class="table">
                            </table>
                        </div>

                    </article>

                </section>
                <section id="resultado">
                </section>
                <footer>
                </footer>
                <div class="row">
                    <div class="col-xs-12 col-sm-6 col-md-8">.col-xs-12 .col-sm-6 .col-md-8</div>
                    <div class="col-xs-6 col-md-4">.col-xs-6 .col-md-4</div>
                </div>

                <div class="row">
                    <div class="col-xs-6 col-sm-4">.col-xs-6 .col-sm-4</div>
                    <div class="col-xs-6 col-sm-4">.col-xs-6 .col-sm-4</div>

                    <!-- Código opcional para limpiar las columnas XS en caso de que el
       contenido de todas las columnas no coincida en altura -->
                    <div class="clearfix visible-xs"></div>
                    <div class="col-xs-6 col-sm-4">.col-xs-6 .col-sm-4</div>
                </div>
            </section>
            <!-- contenedor -->
        </div>
    </form>


    <script src="http://code.jquery.com/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>

</body>
</html>
