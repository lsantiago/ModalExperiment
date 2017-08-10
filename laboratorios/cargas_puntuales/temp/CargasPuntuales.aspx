<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CargasPuntuales.aspx.cs" Inherits="laboratorios_cargas_puntuales_CargasPuntuales" %>
<%@ Import Namespace="System.Web.Optimization" %> 

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Cargas Puntuales</title>
</head>
<body>
    <form id="formCargasPuntuales" runat="server">
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-2">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>

                    <p class="navbar-brand">CARGAS PUNTUALES</p>
                </div>

                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-2">


                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="#">Ayuda</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <%--<div class="container-fluid">

            <p>
                Descripción: Cargas puntuales....
              <br />
                Autor: Daniela Pelaez
              <br />
                Información: CargasPuntuales.pdf
              <br />
                <br />

            </p>

        </div>--%>
        <!— /container —>
         

        <%--INPUT--%>
        <fieldset>
            <%--<legend>
                <h5><b>Configuración del modelo</b></h5>
            </legend>--%>
            <div class="row equal-height-panels">
                <div class="col-md-6 sinespacios">
                    <div class="panel panel-default">
                        <div class="panel-heading">Datos de entrada</div>
                        <div class="panel-body">


                            <div class="row">
                                <div class="col-md-3">
                                    Número de tramos:
                                </div>
                                <div class="col-md-3">
                                    Valor:   
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-3">

                                    <asp:DropDownList ID="ddlNroTramos" runat="server" CssClass="form-control input-xs">
                                        <asp:ListItem Value="1">1</asp:ListItem>
                                        <asp:ListItem Value="2">2</asp:ListItem>
                                        <asp:ListItem Value="3">3</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="col-md-3">
                                    <asp:TextBox ID="tbValor" runat="server" CssClass="form-control input-xs" placeholder="Valor.."></asp:TextBox>
                                </div>
                            </div>



                            <br />


                            <div class="row">
                                <div class="col-md-12">
                                    <div class="panel with-nav-tabs panel-default">
                                        <div class="panel-heading">
                                            <ul class="nav nav-tabs" id="myTab">
                                                <li class="active"><a href="#tab1default" data-toggle="tab">TRAMO AB</a></li>
                                                <li><a href="#tab2default" data-toggle="tab">TRAMO BC</a></li>
                                                <li><a href="#tab3default" data-toggle="tab">TRAMO CD</a></li>

                                            </ul>
                                        </div>
                                        <div class="panel-body">
                                            <div class="tab-content">
                                                <div class="tab-pane fade in active" id="tab1default">
                                                    <div class="form-group" style="padding-bottom: 20px;">
                                                        <div class="col-md-3">
                                                            Número de cargas:
                                                        </div>
                                                        <div class="col-sm-3">
                                                            <asp:DropDownList ID="ddlNroCargasAB" runat="server" CssClass="form-control input-xs">
                                                                <asp:ListItem Value="0">Seleccione</asp:ListItem>
                                                                <asp:ListItem Value="1">1</asp:ListItem>
                                                                <asp:ListItem Value="2">2</asp:ListItem>
                                                                <asp:ListItem Value="3">3</asp:ListItem>
                                                                <asp:ListItem Value="4">4</asp:ListItem>
                                                                <asp:ListItem Value="5">5</asp:ListItem>
                                                                <asp:ListItem Value="6">6</asp:ListItem>
                                                                <asp:ListItem Value="7">7</asp:ListItem>
                                                                <asp:ListItem Value="8">8</asp:ListItem>
                                                                <asp:ListItem Value="9">9</asp:ListItem>
                                                                <asp:ListItem Value="10">10</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                    
                                                    <table id="tablaTramoAB" class="table table-borderless table-hover table-responsive table-bordered table-condensed ">
                                                        <thead>
                                                            <tr>
                                                                <th></th>
                                                                <th>
                                                                    <h6>1</h6>
                                                                </th>
                                                                <th>
                                                                    <h6>2</h6>
                                                                </th>
                                                                <th>
                                                                    <h6>3</h6>
                                                                </th>
                                                                <th>
                                                                    <h6>4</h6>
                                                                </th>
                                                                <th>
                                                                    <h6>5</h6>
                                                                </th>
                                                                <th>
                                                                    <h6>6</h6>
                                                                </th>
                                                                <th>
                                                                    <h6>7</h6>
                                                                </th>
                                                                <th>
                                                                    <h6>8</h6>
                                                                </th>
                                                                <th>
                                                                    <h6>9</h6>
                                                                </th>
                                                                <th>
                                                                    <h6>10</h6>
                                                                </th>
                                                                <th>
                                                                    <h6>11</h6>
                                                                </th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <%--<tr>
                                                                <td>
                                                                    <h6>NWAB</h6>
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="tbNWAB_AB" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>--%>

                                                            <tr>
                                                                <td>WAB</td>
                                                                <td>
                                                                    <asp:TextBox ID="tbWAB_1" runat="server" CssClass="form-control input-sm "></asp:TextBox></td>
                                                                <td>
                                                                    <asp:TextBox ID="tbWAB_2" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                                <td>
                                                                    <asp:TextBox ID="tbWAB_3" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                                <td>
                                                                    <asp:TextBox ID="tbWAB_4" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                                <td>
                                                                    <asp:TextBox ID="tbWAB_5" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                                <td>
                                                                    <asp:TextBox ID="tbWAB_6" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                                <td>
                                                                    <asp:TextBox ID="tbWAB_7" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                                <td>
                                                                    <asp:TextBox ID="tbWAB_8" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                                <td>
                                                                    <asp:TextBox ID="tbWAB_9" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                                <td>
                                                                    <asp:TextBox ID="tbWAB_10" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                                <td>
                                                                    </td>
                                                                <%--<td>
                                            <asp:TextBox ID="tbH2" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>--%>
                                                            </tr>

                                                            <tr>
                                                                <td>DAB</td>
                                                                <td>
                                                                    <asp:TextBox ID="tbDAB_1" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                                <td>
                                                                    <asp:TextBox ID="tbDAB_2" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                                <td>
                                                                    <asp:TextBox ID="tbDAB_3" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                                <td>
                                                                    <asp:TextBox ID="tbDAB_4" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                                <td>
                                                                    <asp:TextBox ID="tbDAB_5" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                                <td>
                                                                    <asp:TextBox ID="tbDAB_6" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                                <td>
                                                                    <asp:TextBox ID="tbDAB_7" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                                <td>
                                                                    <asp:TextBox ID="tbDAB_8" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                                <td>
                                                                    <asp:TextBox ID="tbDAB_9" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                                <td>
                                                                    <asp:TextBox ID="tbDAB_10" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                                <td>
                                                                    <asp:TextBox ID="tbDAB_11" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                                <%--<td>
                                            <asp:TextBox ID="tbH3" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>--%>
                                                            </tr>

                                                            <tr>
                                                                <td>HLAB</td>
                                                                <td>
                                                                    <asp:TextBox ID="tbHLAB" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                                <td>
                                                                    </td>
                                                                <td>
                                                                    </td>
                                                                <td>
                                                                    </td>
                                                                <td>
                                                                    </td>
                                                                <td>
                                                                    </td>
                                                                <td>
                                                                    </td>
                                                                <td>
                                                                    </td>
                                                                <td>
                                                                    </td>
                                                                <td>
                                                                    </td>
                                                                <td>
                                                                    </td>

                                                            </tr>

                                                            <tr>
                                                                <td>YB</td>
                                                                <td>
                                                                    <asp:TextBox ID="tbY_AB" runat="server" CssClass="form-control input-sm "></asp:TextBox></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>

                                                            </tr>






                                                        </tbody>
                                                    </table>

                                                </div>
                                                <div class="tab-pane fade" id="tab2default">
                                                    <div class="form-group" style="padding-bottom: 20px;">
                                                        <div class="col-md-3">
                                                            Número de cargas:
                                                        </div>
                                                        <div class="col-sm-3">
                                                            <asp:DropDownList ID="ddlNroCargasBC" runat="server" CssClass="form-control input-xs">
                                                                <asp:ListItem Value="0">Seleccione</asp:ListItem>
                                                                <asp:ListItem Value="1">1</asp:ListItem>
                                                                <asp:ListItem Value="2">2</asp:ListItem>
                                                                <asp:ListItem Value="3">3</asp:ListItem>
                                                                <asp:ListItem Value="4">4</asp:ListItem>
                                                                <asp:ListItem Value="5">5</asp:ListItem>
                                                                <asp:ListItem Value="6">6</asp:ListItem>
                                                                <asp:ListItem Value="7">7</asp:ListItem>
                                                                <asp:ListItem Value="8">8</asp:ListItem>
                                                                <asp:ListItem Value="9">9</asp:ListItem>
                                                                <asp:ListItem Value="10">10</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                    <table id="tablaTramoBC" class="table table-borderless table-hover table-responsive table-bordered table-condensed ">
                                                        <thead>
                                                            <tr>
                                                                <th></th>
                                                                <th class="M">
                                                                    <h6>1</h6>
                                                                </th>
                                                                <th class="K">
                                                                    <h6>2</h6>
                                                                </th>
                                                                <th class="C">
                                                                    <h6>3</h6>
                                                                </th>
                                                                <th class="U">
                                                                    <h6>4</h6>
                                                                </th>
                                                                <th class="I">
                                                                    <h6>5</h6>
                                                                </th>
                                                                <th class="F">
                                                                    <h6>6</h6>
                                                                </th>
                                                                <th class="W">
                                                                    <h6>7</h6>
                                                                </th>
                                                                <th class="W">
                                                                    <h6>8</h6>
                                                                </th>
                                                                <th class="W">
                                                                    <h6>9</h6>
                                                                </th>
                                                                <th class="W">
                                                                    <h6>10</h6>
                                                                </th>
                                                                <th class="W">
                                                                    <h6>11</h6>
                                                                </th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                           <%-- <tr>
                                                                <td>
                                                                    <h6>NWBC</h6>
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="tbNWBC" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>--%>

                                                            <tr>
                                                                <td>WBC</td>
                                                                <td>
                                                                    <asp:TextBox ID="tbWBC_1" runat="server" CssClass="form-control input-sm "></asp:TextBox></td>
                                                                <td>
                                                                    <asp:TextBox ID="tbWBC_2" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                                <td>
                                                                    <asp:TextBox ID="tbWBC_3" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                                <td>
                                                                    <asp:TextBox ID="tbWBC_4" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                                <td>
                                                                    <asp:TextBox ID="tbWBC_5" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                                <td>
                                                                    <asp:TextBox ID="tbWBC_6" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                                <td>
                                                                    <asp:TextBox ID="tbWBC_7" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                                <td>
                                                                    <asp:TextBox ID="tbWBC_8" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                                <td>
                                                                    <asp:TextBox ID="tbWBC_9" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                                <td>
                                                                    <asp:TextBox ID="tbWBC_10" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                                <td>
                                                                    </td>
                                                                <%--<td>
                                            <asp:TextBox ID="tbH2" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>--%>
                                                            </tr>

                                                            <tr>
                                                                <td>DBC</td>
                                                                <td>
                                                                    <asp:TextBox ID="tbDBC_1" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                                <td>
                                                                    <asp:TextBox ID="tbDBC_2" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                                <td>
                                                                    <asp:TextBox ID="tbDBC_3" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                                <td>
                                                                    <asp:TextBox ID="tbDBC_4" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                                <td>
                                                                    <asp:TextBox ID="tbDBC_5" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                                <td>
                                                                    <asp:TextBox ID="tbDBC_6" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                                <td>
                                                                    <asp:TextBox ID="tbDBC_7" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                                <td>
                                                                    <asp:TextBox ID="tbDBC_8" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                                <td>
                                                                    <asp:TextBox ID="tbDBC_9" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                                <td>
                                                                    <asp:TextBox ID="tbDBC_10" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                                <td>
                                                                    <asp:TextBox ID="tbDBC_11" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                                <%--<td>
                                            <asp:TextBox ID="tbH3" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>--%>
                                                            </tr>

                                                            <tr>
                                                                <td>HLBC</td>
                                                                <td>
                                                                    <asp:TextBox ID="tbHLBC" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>

                                                            </tr>

                                                            <tr>
                                                                <td>YB</td>
                                                                <td>
                                                                    <asp:TextBox ID="tbY_BC" runat="server" CssClass="form-control input-sm "></asp:TextBox></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>

                                                            </tr>






                                                        </tbody>
                                                    </table>
                                                </div>
                                                <div class="tab-pane fade" id="tab3default">
                                                    <div class="form-group" style="padding-bottom: 20px;">
                                                        <div class="col-md-3">
                                                            Número de cargas:
                                                        </div>
                                                        <div class="col-sm-3">
                                                            <asp:DropDownList ID="ddlNroCargasCD" runat="server" CssClass="form-control input-xs">
                                                                <asp:ListItem Value="0">Seleccione</asp:ListItem>
                                                                <asp:ListItem Value="1">1</asp:ListItem>
                                                                <asp:ListItem Value="2">2</asp:ListItem>
                                                                <asp:ListItem Value="3">3</asp:ListItem>
                                                                <asp:ListItem Value="4">4</asp:ListItem>
                                                                <asp:ListItem Value="5">5</asp:ListItem>
                                                                <asp:ListItem Value="6">6</asp:ListItem>
                                                                <asp:ListItem Value="7">7</asp:ListItem>
                                                                <asp:ListItem Value="8">8</asp:ListItem>
                                                                <asp:ListItem Value="9">9</asp:ListItem>
                                                                <asp:ListItem Value="10">10</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                    <table id="tablaTramoCD" class="table table-borderless table-hover table-responsive table-bordered table-condensed ">
                                                        <thead>
                                                            <tr>
                                                                <th></th>
                                                                <th class="M">
                                                                    <h6>1</h6>
                                                                </th>
                                                                <th class="K">
                                                                    <h6>2</h6>
                                                                </th>
                                                                <th class="C">
                                                                    <h6>3</h6>
                                                                </th>
                                                                <th class="U">
                                                                    <h6>4</h6>
                                                                </th>
                                                                <th class="I">
                                                                    <h6>5</h6>
                                                                </th>
                                                                <th class="F">
                                                                    <h6>6</h6>
                                                                </th>
                                                                <th class="W">
                                                                    <h6>7</h6>
                                                                </th>
                                                                <th class="W">
                                                                    <h6>8</h6>
                                                                </th>
                                                                <th class="W">
                                                                    <h6>9</h6>
                                                                </th>
                                                                <th class="W">
                                                                    <h6>10</h6>
                                                                </th>
                                                                <th class="W">
                                                                    <h6>11</h6>
                                                                </th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <%--<tr>
                                                                <td>
                                                                    <h6>NWCD</h6>
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="tbNWCD" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>--%>

                                                            <tr>
                                                                <td>WCD</td>
                                                                <td>
                                                                    <asp:TextBox ID="tbWCD_1" runat="server" CssClass="form-control input-sm "></asp:TextBox></td>
                                                                <td>
                                                                    <asp:TextBox ID="tbWCD_2" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                                <td>
                                                                    <asp:TextBox ID="tbWCD_3" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                                <td>
                                                                    <asp:TextBox ID="tbWCD_4" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                                <td>
                                                                    <asp:TextBox ID="tbWCD_5" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                                <td>
                                                                    <asp:TextBox ID="tbWCD_6" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                                <td>
                                                                    <asp:TextBox ID="tbWCD_7" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                                <td>
                                                                    <asp:TextBox ID="tbWCD_8" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                                <td>
                                                                    <asp:TextBox ID="tbWCD_9" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                                <td>
                                                                    <asp:TextBox ID="tbWCD_10" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                                <td>
                                                                    </td>
                                                                <%--<td>
                                            <asp:TextBox ID="tbH2" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>--%>
                                                            </tr>

                                                            <tr>
                                                                <td>DCD</td>
                                                                <td>
                                                                    <asp:TextBox ID="tbDCD_1" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                                <td>
                                                                    <asp:TextBox ID="tbDCD_2" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                                <td>
                                                                    <asp:TextBox ID="tbDCD_3" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                                <td>
                                                                    <asp:TextBox ID="tbDCD_4" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                                <td>
                                                                    <asp:TextBox ID="tbDCD_5" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                                <td>
                                                                    <asp:TextBox ID="tbDCD_6" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                                <td>
                                                                    <asp:TextBox ID="tbDCD_7" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                                <td>
                                                                    <asp:TextBox ID="tbDCD_8" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                                <td>
                                                                    <asp:TextBox ID="tbDCD_9" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                                <td>
                                                                    <asp:TextBox ID="tbDCD_10" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                                <td>
                                                                    <asp:TextBox ID="tbDCD_11" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                                                    </td>
                                                                <%--<td>
                                            <asp:TextBox ID="tbH3" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>--%>
                                                            </tr>

                                                            <tr>
                                                                <td>HLCD</td>
                                                                <td>
                                                                    <asp:TextBox ID="tbHLCD" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>

                                                            </tr>

                                                            <tr>
                                                                <td>YB</td>
                                                                <td>
                                                                    <asp:TextBox ID="tbY_CD" runat="server" CssClass="form-control input-sm "></asp:TextBox></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>

                                                            </tr>






                                                        </tbody>
                                                    </table>
                                                </div>

                                            </div>
                                        </div>
                                    </div>


                                </div>

                            </div>

                            <br />
                            <br />

                            <div class="form-group">
                                <div class="col-md-12 sinespacios">
                                    <button id="btnRun" type="submit" class="btn btn-warning btn-xs">Ejecutar</button>
                                    <button id="btnEjemplo" type="button" class="btn btn-default btn-xs">Ejemplo</button>
                                    <button id="btnCatalogo" type="button" data-toggle="modal" data-target="#myModal" class="btn btn-default btn-xs">Catalogo</button>
                                    <button id="btnTablaFactores" type="button" data-toggle="modal" data-target="#myModalFactores" class="btn btn-default btn-xs">Tabla de factores</button>


                                </div>

                            </div>
                        </div>
                    </div>



                </div>

                <%-- RESULTADOS --%>
                <div class="col-md-6">
                    <div class="panel panel-success">

                        <div class="panel-heading">Resultados</div>
                        <div class="panel-body  ">
                            <div class="panel-heading">
                                <ul class="nav nav-tabs">
                                    <li class="active"><a href="#tabFuerzas" data-toggle="tab">Fuerzas resultantes</a></li>
                                    <li><a href="#tabTensiones" data-toggle="tab">Tensiones y longitudes en tramos</a></li>
                                    <li><a href="#tabTramoAB" data-toggle="tab">Tensiones y desniveles</a></li>

                                </ul>
                            </div>
                            <div class="panel-body">
                                <div class="tab-content">
                                    <div class="tab-pane fade in active" id="tabFuerzas">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <table id="tablaPuntoA" class="table table-borderless table-hover table-responsive table-bordered table-condensed ">
                                                    <thead>
                                                        <tr>

                                                            <th>
                                                                <h6></h6>
                                                            </th>
                                                            <th>
                                                                <h6>PUNTO A</h6>
                                                            </th>
                                                            <th>
                                                                <h6></h6>
                                                            </th>

                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>
                                                                <h6>A</h6>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="tbNFuerzaA" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                            <td>
                                                                <h6>KN</h6>
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td>
                                                                <h6>AX</h6>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="tbNFuerzaAX" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                            <td>
                                                                <h6>KN</h6>
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td>
                                                                <h6>AY</h6>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="tbNFuerzaAY" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                            <td>
                                                                <h6>KN</h6>
                                                            </td>
                                                        </tr>


                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="col-md-3">
                                                <table id="tablaPuntoB" class="table table-borderless table-hover table-responsive table-bordered table-condensed ">
                                                    <thead>
                                                        <tr>

                                                            <th>
                                                                <h6></h6>
                                                            </th>
                                                            <th>
                                                                <h6>PUNTO B</h6>
                                                            </th>
                                                            <th>
                                                                <h6></h6>
                                                            </th>

                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>
                                                                <h6>B</h6>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="tbNFuerzaB" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                            <td>
                                                                <h6>KN</h6>
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td>
                                                                <h6>BX</h6>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="tbNFuerzaBX" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                            <td>
                                                                <h6>KN</h6>
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td>
                                                                <h6>BY</h6>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="tbNFuerzaBY" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                            <td>
                                                                <h6>KN</h6>
                                                            </td>
                                                        </tr>


                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="col-md-3">
                                                <table id="tablaPuntoC" class="table table-borderless table-hover table-responsive table-bordered table-condensed ">
                                                    <thead>
                                                        <tr>

                                                            <th>
                                                                <h6></h6>
                                                            </th>
                                                            <th>
                                                                <h6>PUNTO C</h6>
                                                            </th>
                                                            <th>
                                                                <h6></h6>
                                                            </th>

                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>
                                                                <h6>C</h6>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="tbNFuerzaC" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                            <td>
                                                                <h6>KN</h6>
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td>
                                                                <h6>CX</h6>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="tbNFuerzaCX" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                            <td>
                                                                <h6>KN</h6>
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td>
                                                                <h6>CY</h6>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="tbNFuerzaCY" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                            <td>
                                                                <h6>KN</h6>
                                                            </td>
                                                        </tr>


                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="col-md-3">
                                                <table id="tablaPuntoD" class="table table-borderless table-hover table-responsive table-bordered table-condensed ">
                                                    <thead>
                                                        <tr>

                                                            <th>
                                                                <h6></h6>
                                                            </th>
                                                            <th>
                                                                <h6>PUNTO D</h6>
                                                            </th>
                                                            <th>
                                                                <h6></h6>
                                                            </th>

                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>
                                                                <h6>D</h6>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="tbNFuerzaD" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                            <td>
                                                                <h6>KN</h6>
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td>
                                                                <h6>DX</h6>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="tbNFuerzaDX" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                            <td>
                                                                <h6>KN</h6>
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td>
                                                                <h6>DY</h6>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="tbNFuerzaDY" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                            <td>
                                                                <h6>KN</h6>
                                                            </td>
                                                        </tr>


                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="tab-pane fade" id="tabTensiones">
                                        <div class="row">
                                            <div class="col-md-4">
                                                <table id="tablaTensionesAB" class="table table-borderless table-hover table-responsive table-bordered table-condensed ">
                                                    <thead>
                                                        <tr>

                                                            <th>
                                                                <h6></h6>
                                                            </th>
                                                            <th>
                                                                <h6>TRAMO AB</h6>
                                                            </th>
                                                            <th>
                                                                <h6></h6>
                                                            </th>

                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>
                                                                <h6>TMAX</h6>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="tb_TMAX_AB" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                            <td>
                                                                <h6>KN</h6>
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td>
                                                                <h6>TMIN</h6>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="tb_TMIN_AB" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                            <td>
                                                                <h6>KN</h6>
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td>
                                                                <h6>L</h6>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="tb_L_AB" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                            <td>
                                                                <h6>KN</h6>
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td>
                                                                <h6>S</h6>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="tb_S_AB" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                            <td>
                                                                <h6>KN</h6>
                                                            </td>
                                                        </tr>


                                                    </tbody>
                                                </table>
                                            </div>

                                            <div class="col-md-4">
                                                <table id="tabla_Tensiones_BC" class="table table-borderless table-hover table-responsive table-bordered table-condensed ">
                                                    <thead>
                                                        <tr>

                                                            <th>
                                                                <h6></h6>
                                                            </th>
                                                            <th>
                                                                <h6>TRAMO BC</h6>
                                                            </th>
                                                            <th>
                                                                <h6></h6>
                                                            </th>

                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>
                                                                <h6>TMAX</h6>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="tb_TMAX_BC" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                            <td>
                                                                <h6>KN</h6>
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td>
                                                                <h6>TMIN</h6>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="tb_TMIN_BC" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                            <td>
                                                                <h6>KN</h6>
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td>
                                                                <h6>L</h6>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="tb_L_BC" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                            <td>
                                                                <h6>KN</h6>
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td>
                                                                <h6>S</h6>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="tb_S_BC" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                            <td>
                                                                <h6>KN</h6>
                                                            </td>
                                                        </tr>


                                                    </tbody>
                                                </table>
                                            </div>

                                            <div class="col-md-4">
                                                <table id="tabla_Tensiones_CD" class="table table-borderless table-hover table-responsive table-bordered table-condensed ">
                                                    <thead>
                                                        <tr>

                                                            <th>
                                                                <h6></h6>
                                                            </th>
                                                            <th>
                                                                <h6>TRAMO CD</h6>
                                                            </th>
                                                            <th>
                                                                <h6></h6>
                                                            </th>

                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>
                                                                <h6>TMAX</h6>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="tb_TMAX_CD" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                            <td>
                                                                <h6>KN</h6>
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td>
                                                                <h6>TMIN</h6>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="tb_TMIN_CD" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                            <td>
                                                                <h6>KN</h6>
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td>
                                                                <h6>L</h6>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="tb_L_CD" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                            <td>
                                                                <h6>KN</h6>
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td>
                                                                <h6>S</h6>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="tb_S_CD" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                            <td>
                                                                <h6>KN</h6>
                                                            </td>
                                                        </tr>


                                                    </tbody>
                                                </table>
                                            </div>
                                            
                                        </div>

                                    </div>
                                    <div class="tab-pane fade" id="tabTramoAB">
                                        <table id="tablaResultadosTramoAB" class="table table-borderless table-hover table-responsive table-bordered table-condensed ">
                                                        <thead>
                                                            <tr>
                                                                <th></th>
                                                                <th>
                                                                    <h6>1</h6>
                                                                </th>
                                                                <th>
                                                                    <h6>2</h6>
                                                                </th>
                                                                <th>
                                                                    <h6>3</h6>
                                                                </th>
                                                                <th>
                                                                    <h6>4</h6>
                                                                </th>
                                                                <th>
                                                                    <h6>5</h6>
                                                                </th>
                                                                <th>
                                                                    <h6>6</h6>
                                                                </th>
                                                                <th>
                                                                    <h6>7</h6>
                                                                </th>
                                                                <th>
                                                                    <h6>8</h6>
                                                                </th>
                                                                <th>
                                                                    <h6>9</h6>
                                                                </th>
                                                                <th>
                                                                    <h6>10</h6>
                                                                </th>
                                                                <th>
                                                                    <h6>11</h6>
                                                                </th>
                                                                
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            
                                                            <tr>
                                                                <td>T</td>
                                                                <td>
                                                                    <asp:TextBox ID="tbT_1" runat="server" CssClass="form-control input-sm "></asp:TextBox></td>
                                                                <td>
                                                                    <asp:TextBox ID="tbT_2" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                                <td>
                                                                    <asp:TextBox ID="tbT_3" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                                <td>
                                                                    <asp:TextBox ID="tbT_4" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                                <td>
                                                                    <asp:TextBox ID="tbT_5" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                                <td>
                                                                    <asp:TextBox ID="tbT_6" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                                <td>
                                                                    <asp:TextBox ID="tbT_7" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                                <td>
                                                                    <asp:TextBox ID="tbT_8" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                                <td>
                                                                    <asp:TextBox ID="tbT_9" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                                <td>
                                                                    <asp:TextBox ID="tbT_10" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                            
                                                                <td></td>
                                                            </tr>

                                                            <tr>
                                                                <td>H</td>
                                                                <td>
                                                                    <asp:TextBox ID="tbH_1" runat="server" CssClass="form-control input-sm "></asp:TextBox></td>
                                                                <td>
                                                                    <asp:TextBox ID="tbH_2" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                                <td>
                                                                    <asp:TextBox ID="tbH_3" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                                <td>
                                                                    <asp:TextBox ID="tbH_4" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                                <td>
                                                                    <asp:TextBox ID="tbH_5" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                                <td>
                                                                    <asp:TextBox ID="tbH_6" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                                <td>
                                                                    <asp:TextBox ID="tbH_7" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                                <td>
                                                                    <asp:TextBox ID="tbH_8" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                                <td>
                                                                    <asp:TextBox ID="tbH_9" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                                <td>
                                                                    <asp:TextBox ID="tbH_10" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                                <td>
                                                                    <asp:TextBox ID="tbH_11" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                                
                                                                
                                                            </tr>

                                                            






                                                        </tbody>
                                                    </table>
                                    </div>

                                </div>
                            </div>

                            <div class="panel panel-default">
                                <div class="panel-heading">Fuerza resultantes</div>
                                <div class="panel-body">
                                </div>
                            </div>



                        </div>


                    </div>
                </div>
                <%-- END RESULTADOS --%>
            </div>
        </fieldset>

        <%--OUTPUT--%>
        <fieldset>
            <legend>
                <h5><b>Resultados</b></h5>
            </legend>
            <div class="row col-condensed">
                <%--Valores--%>
                <div class="col-md-3 sinespacios">
                    <div class="panel panel-default">
                        <div class="panel-body">

                            <ul class="list-group">
                                <%--Ho y Hf son de la opción longitud--%>
                                <li id="resHo" class="list-group-item">
                                    <span id="spResHo" class="badge badge-light">m</span>
                                    Flecha del eje al punto (O)
                                </li>
                            </ul>
                        </div>
                        <div class="panel-footer">
                            <input id="btnDecargarResultados" type="button" class="btn btn-danger btn-xs" value="Descargar" />
                        </div>
                    </div>
                </div>
                <%--Gráficos--%>
                <div class="col-md-9">
                     <div class="row">
                                <div class="col-md-6">
                                    <div class="panel panel-default">
                                        <div class="panel-body">
                                            <canvas id="chartCable" width="500" height="198" />

                                        </div>
                                       
                                        <div class="panel-footer">
                                            <div class="form-group">
                                                <div class="col-md-6">
                                                    Posición inicial del cable
                                                </div>
                                                <div class="col-md-6">
                                                    <input id="save-cable" class="btn btn-danger btn-xs pull-right" type="button" value="Descargar"/>
                                                </div>
                                                
                                                
                                            </div>

                                            
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="panel panel-default">
                                        <div class="panel-body">
                                            <canvas id="chartDeformada" width="500" height="198" />

                                        </div>
                                        
                                        <div class="panel-footer">
                                            <div class="form-group">
                                                <div class="col-md-6">
                                                    Deformada del cable
                                                </div>
                                                <div class="col-md-6">
                                                    <input id="save-deformada" class="btn btn-danger btn-xs pull-right" type="button" value="Descargar"/>
                                                </div>
                                                
                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                </div>
                <%--Fin Gráficos--%>
            </div>
        </fieldset>
        <asp:PlaceHolder runat="server">
            <%: Scripts.Render("~/Content/assets/js") %>
            <%: Scripts.Render("~/Content/assets/js/cargasPuntuales") %>
            <%: Styles.Render("~/Content/assets/css") %>
            <%: Styles.Render("~/Content/assets/css/cargasPuntuales") %>
        </asp:PlaceHolder>
    </form>



</body>
</html>
