<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CargasPuntuales.aspx.cs" Inherits="laboratorios_cargas_puntuales_CargasPuntuales" %>

<%@ Import Namespace="System.Web.Optimization" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">



<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Cargas Puntuales</title>
    <webopt:BundleReference runat="server" Path="~/Content/oneclick/Content/css" />
    <webopt:BundleReference runat="server" Path="~/Content/assets/css/cargasPuntuales" />
    <%--<webopt:BundleReference runat="server" Path="~/Content/adicionales/css" />--%>

</head>

<body>
    <form id="formCargasPuntuales" runat="server">
        <div class="wrapper row-offcanvas row-offcanvas-left">
            <!-- BEGIN MAIN CONTENT -->
            <aside class="right-side">

                <!-- BEGIN CONTENT HEADER -->
                <div style="padding-left: 28px; background-color: #ffffff;">
                    <img src="../../Content/oneclick/Content/Images/Portal/barraPosicion.jpg" />
                    
                </div>
                <section class="content-header">
                    <i class="fa fa-align-left"></i>
                    <span><b>CARGAS PUNTUALES</b></span>
                    <ol class="breadcrumb">
                        <li>Cargas Puntuales</li>
                    </ol>

                    <!-- 
                    <h5><b>Description:</b> Time history analysis of two degrees of freedom systems</h5>
                    <h5><b>Authors:</b> Duque, E.; Quiñones, S.; Pelaéz, D.</h5>
                    <h5><b>Info:</b> CargasPuntuales.pdf</h5>
                    <h5>This application is avalible for registered users only</h5>
                    <h5>If you experience any problem or if you need assistance running this program please contact epduque@utpl.edu.ec</h5>    
                    -->

                    <h5><b>Descripción:</b> Cargas Puntuales</h5>
                    <h5><b>Autores:</b> Duque, E.; Quiñones, S.; Pelaéz, D.</h5>
                    <h5><b>Información:</b> CargasPuntuales.pdf</h5>
                    
                    <h5>Si experimenta algún problema o si necesita ayuda para ejecutar este programa, póngase en contacto con epduque@utpl.edu.ec</h5>
                    <br />
                </section>
                <!-- END CONTENT HEADER -->

                <!-- BEGIN SECTION CONTENT -->
                <section class="content">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="panel-group" style="margin-bottom: 0px;">
                                <div class="panel panel-primary" style="border-bottom: none;">
                                    <div class="panel-heading">
                                        <h4 class="panel-title text-center">INPUT</h4>
                                    </div>
                                    <div class="panel-body">
                                        <div class="row">

                                            <!-- BEGIN CONTENT LEFT -->
                                            <div class="col-md-4" style="border-right: 1.0pt solid #dddddd;">
                                                <div class="grid">
                                                    <div class="grid-header">
                                                        <i class="fa fa-bar-chart-o"></i>
                                                        <asp:Label ID="lblEsquemaMain" runat="server" class="grid-title lead" Text="ESQUEMA"></asp:Label>
                                                        <div class="pull-right grid-tools">
                                                            <%--<input id="btnEjemplo_" class="btn btn-warning btn-radius btn-xs button-Carga-Ejemplo fa fa-play" type="button" value="button" />
                                                            <i class="fa fa-play"></i>--%>
                                                             
                                                            <button id="btnRun"  type="submit" class="btn btn-warning btn-radius btn-xs button-Carga-Ejemplo">
                                                                Ejecutar <i class="fa fa-play"></i> 
                                                            </button>
                                                        </div>
                                                    </div>
                                                    <div class="grid-body text-center">
                                                        <div id="chart-line" style="width: 100%; height: 100%;" class="espacioImagen">
                                                            <%--<asp:Image ID="FigMain" runat="server" ImageUrl="~/Images/CargaPuntual/Tramo 3-min.png" Width="290px" Height="220px" />--%>
                                                            
                                                            <img id="FigMain" alt="tramo3" src="../../Images/CargaPuntual/Tramo3-min.png" style="width: 100%; height: 100%;"  />


                                                            <span id="spanZoom" class="glyphicon glyphicon-plus-sign zoom-btn fa fa-plus-circle"></span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- END CONTENT LEFT -->

                                            <!-- BEGIN CONTENT RIGHT -->
                                            <div class="col-md-8">
                                                <div class="row">
                                                    <div class="col-sm-3 control-label label-one">
                                                        Número de tramos:
                                                    </div>
                                                    
                                                </div>
                                                <div class="row" style="padding-bottom: 20px;">
                                                    <div class="col-md-3">
                                                        <asp:DropDownList ID="ddlNroTramos" runat="server" CssClass="form-control input-xs">
                                                            <asp:ListItem Value="1">1</asp:ListItem>
                                                            <asp:ListItem Value="2">2</asp:ListItem>
                                                            <asp:ListItem Value="3">3</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>

                                                    <div class="col-md-9">
                                                        <input type="button" id="btnEjemplo" value="Ejemplo" class="btn btn-warning btn-radius btn-xs button-Carga-Ejemplo"/>
                                                        
                                                    </div>
                                                    
                                                </div>

                                                <div class="panel with-nav-tabs">
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
                                                                            <td></td>
                                                                            
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
                                                                           
                                                                        </tr>

                                                                        <tr>
                                                                            <td>HLAB</td>
                                                                            <td>
                                                                                <asp:TextBox ID="tbHLAB" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
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
                                                                            <td></td>
                                                                           
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
                                                                    <div class="col-md-2">
                                                                        Número de cargas:
                                                                    </div>
                                                                    <div class="col-sm-2">
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
                                                                            <td></td>
                                                                           
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
                                            <!-- END CONTENT RIGHT -->
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="panel-group" style="margin-bottom: 0px;">
                                <div class="panel panel-primary" style="border-bottom: none;">
                                    <div class="panel-heading">
                                        <h4 class="panel-title text-center">OUPUT</h4>
                                    </div>
                                    <div class="panel-body">
                                        <div class="row">
                                            <!-- BEGIN SECTION GRAPHICS -->
                                            <div class="col-md-4" style="border-right: 1.0pt solid #dddddd;">
                                                <div class="grid">
                                                    <div class="grid-header">
                                                        <i class="fa fa-bar-chart-o"></i>
                                                        <asp:Label ID="lblGraficas" runat="server" class="grid-title lead" Text="GRAFICAS"></asp:Label>
                                                        <div class="pull-right grid-tools"></div>
                                                    </div>
                                                    <div class="grid-body">
                                                        <div class="form-horizontal" role="form">
                                                            <div class="form-group">
                                                                <asp:Label ID="Label11" runat="server" class="col-sm-3 control-label label-one" Text="Seleccionar:"></asp:Label>
                                                                <div class="col-sm-7">
                                                                    <select id="graphics" class="form-control" onchange="setImageGraphics(this, 'graphics');">
                                                                        <option>Posición inicial del cable</option>
                                                                        <option>Deformada del cable</option>

                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <div class="col-md-12 text-center">
                                                                    <div id="graphics0" style="width: 100%; height: 100%;">
                                                                        <div class="form-group">
                                                                            <div class="col-sm-12 text-center">
                                                                                <canvas id="chartCable" width="500" height="198" />
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <div class="col-sm-12 text-center">
                                                                                
                                                                                <input id="save-cable" disabled="disabled" class="btn btn-danger btn-radius btn-xs button-Carga-Ejemplo" type="button" value="Descargar" />
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div id="graphics1" style="width: 100%; height: 100%;">
                                                                        <div class="form-group">
                                                                            <div class="col-sm-12 text-center">
                                                                                <canvas id="chartDeformada" width="500" height="198" />
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <div class="col-sm-12 text-center">
                                                                                <input id="save-deformada" disabled="disabled" class="btn btn-danger btn-radius btn-xs button-Carga-Ejemplo" type="button" value="Descargar" />
                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                            <!-- END SECTION GRAPHICS -->


                                            <!-- BEGIN SECTION RESULT -->
                                            <div class="col-md-8" >
                                                <div class="grid">
                                                    <div class="grid-header">
                                                        <i class="fa fa-align-left"></i>
                                                        <asp:Label ID="lblRespMax" runat="server" class="grid-title lead" Text="RESULTADOS"></asp:Label>
                                                        <div class="pull-right grid-tools"></div>
                                                    </div>
                                                    <div class="grid-body">
                                                        <div class="form-horizontal" role="form">


                                                            <div class="form-group">
                                                                <div class="panel-heading">
                                                                    <ul class="nav nav-tabs" id="tabsResultados">
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
                                                                    <input id="btnDecargarResultados" disabled="disabled" type="button" class="btn btn-danger btn-radius btn-xs button-Carga-Ejemplo" value="Descargar" />
                                                                </div>
                                                            </div>
                                                            
                                                        </div>
                                                        
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- END SECTION RESULT -->


                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- END SECTION CONTENT -->
            </aside>
            <!-- END MAIN CONTENT -->

            <!-- IMAGEN MODAL -->
            <div class="modal fade bd-example-modal-lg" id="imagemodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg" data-dismiss="modal">
                    <div class="modal-content">
                        <div class="modal-body">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                            <img src="" class="imagepreview" style="width: 100%;" />
                        </div>
                        <%--<div class="modal-footer">
                            <div class="col-xs-12">
                                <p class="text-left">1. line of description<br>
                                    2. line of description
                                    <br>
                                    3. line of description</p>

                            </div>

                        </div>--%>


                    </div>
                </div>
            </div>
            <!--END IMAGEN MODAL -->
            
        </div>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:PlaceHolder runat="server">
            <%--<%: Scripts.Render("~/Content/assets/js") %>
            <%: Scripts.Render("~/Content/assets/js/2GDL1") %>
            <%: Styles.Render("~/Content/assets/css") %>--%>

            <%: Scripts.Render("~/Content/oneclick/Content/js") %>
            <%: Scripts.Render("~/Content/assets/js/cargasPuntuales") %>
            <%: Scripts.Render("~/Content/adicionales/js") %>
            <%--<%: Styles.Render("~/Content/oneclick/Content/css") %>--%>
            
        </asp:PlaceHolder>
    </form>
    <!-- BEGIN JS PLUGIN -->
    <script type="text/javascript">
        /**
         * Seteamos con index cero el combo y la imagen
         * Autor: OneClick
        */

        //Hide all Graphics
        var arrGraphics = ["graphics0", "graphics1", "graphics2", "graphics3", "graphics4", "graphics5", "graphics6", "graphics7", "graphics8", "graphics9", "graphics10", "graphics11", "graphics12", "graphics13", "graphics14", "graphics15"];
        jQuery.each(arrGraphics, function (i, val) {
            $("#" + val).hide();
        });
        $("#graphics")[0].selectedIndex = 0;
        $("#graphics0").show();

        /**
         * Show and Hide Graphics
         * Autor: OneClick
         * @param {select}: Elemento select
         * @param {imgName}: Tipo imagen
        */
        function setImageGraphics(select, imgName) {
            //Disabled all Graphics
            jQuery.each(arrGraphics, function (i, val) {
                $("#" + val).hide();
            });
            $("#" + imgName + select.selectedIndex).show();
        }
    </script>
    <!-- END JS PLUGIN -->
</body>
</html>
