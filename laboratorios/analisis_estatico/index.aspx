<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="laboratorios_analisis_estatico_index" %>

<%
    HttpContext.Current.Response.SetCookie(new HttpCookie("fileDownload", "true") { Path = "/" });
%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <%--<script src="../../js/bootstrap.min.js"></script>
    <script src="../../js/jquery.js"></script>
    <script src="../../js/jquery-ui.js"></script>

    <link href="../../css/jquery-ui.css" rel="stylesheet" />
    <link href="../../css/bootstrap.min.css" rel="stylesheet" />
    <script src="../../js/Chart.min.js"></script>--%>

    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" />

    <link href="../../css/change-boostrap.css" rel="stylesheet" />
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

    <%--Libreria para descargar descargar el archivo de resultados--%>
    <script src="../../js/jquery.fileDownload.js"></script>

    <%--Ventana de espera de ejecución--%>
    <script src="../../js/waitingfor.js"></script>

    <!-- Libreria para gráficar -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.1.4/Chart.min.js"></script>

    <%--Lógica del programa--%>
    <script src="analisisEstatico.js"></script>

    <%--Librería para descargar imagenes de chart.js--%>
    <script src="../../js/FileSaver.js"></script>

</head>
<body>
    <form id="formAnalisiEstatico" runat="server">
        <div class="page-header">
            <h3>Cargas Distribuidas Uniformemente a lo largo de líneas Rectas</h3>
        </div>

        
            <%--INPUT--%>

        <div class="panel panel-success">
            <div class="panel-heading">ENTRADA</div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-md-2 sinespacios ">
                        <div class="panel panel-default">
                            <div class="panel-heading">Evaluar en: </div>
                            <div class="panel-body panel-height sinespacios highInputAnalisiEstatico">
                                <asp:RadioButtonList ID="rbCategoria" runat="server" CssClass="radio">
                                    <asp:ListItem class="radio-inline" Value="1" Selected="True">Caso 1: Ho < H<sub>F</sub> </asp:ListItem>
                                    <asp:ListItem class="radio-inline" Value="2">Caso 2: Ho > H<sub>F</sub></asp:ListItem>
                                    <asp:ListItem class="radio-inline" Value="3">Caso 3: Ho = H<sub>F</sub></asp:ListItem>
                                </asp:RadioButtonList>

                            </div>

                        </div>
                    </div>
                   
                    <div class="col-md-3 sinespacios highInputAnalisiEstatico">
                        <div class="panel panel-default ">
                            <div class="panel-heading">Datos Previos</div>
                            <div class="panel-body">

                                

                                <div id="Ho" class="input-group input-group-sm">
                                    <span  class="input-group-addon anchoTextoEntrada">Altura o flecha del punto O (Ho)</span>
                                    <input id="tbHo" type="number" step="any" class="form-control" aria-label="Amount (to the nearest dollar)" required/>
                                    <span class="input-group-addon label-default">m</span>
                                </div>

<%--                                <div  class="input-group">
                                    <div class="col-md-7">
                                        <h6>Altura o flecha del punto O</h6>
                                    </div>
                                    <div class="col-md-3 sinespacios">
                                        <asp:TextBox ID="tbHo" runat="server" CssClass="form-control input-xs" placeholder="Ho"></asp:TextBox>
                                    </div>
                                    <div class="col-md-2 sinespacios">
                                        <h6>m</h6>
                                    </div>
                                </div>--%>

                                <div id="HF" class="input-group input-group-sm">
                                    <span class="input-group-addon anchoTextoEntrada">Altura o flecha del punto F (H<sub>F</sub>)</span>
                                    <input id="tbHF" type="number" step="any" class="form-control" aria-label="Amount (to the nearest dollar)" required/>
                                    <span class="input-group-addon label-default">m</span>
                                </div>




                                <%--<div id="HF" class="form-group">
                                    <div class="col-md-7">
                                        <h6>Altura o flecha del punto F (H<sub>F</sub>):</h6>
                                    </div>

                                    <div class="col-md-3 sinespacios">
                                        <asp:TextBox ID="tbHF" runat="server" CssClass="form-control input-xs" placeholder="F"></asp:TextBox>
                                    </div>
                                    <div class="col-md-2 text-left sinespacios">
                                        <h6>m</h6>
                                    </div>
                                </div>--%>


                                <div id="H" class="input-group input-group-sm">
                                    <span class="input-group-addon anchoTextoEntrada">Altura o flecha (H)</span>
                                    <input  id="tbH" type="number" step="any" class="form-control " aria-label="Amount (to the nearest dollar)" />
                                    <span class="input-group-addon label-default">m</span>
                                </div>

                                <%--<div id="H" class="form-group">
                                    <div class="col-md-7">
                                        <h6>Altura o flecha (H):</h6>
                                    </div>

                                    <div class="col-md-3 sinespacios">
                                        <asp:TextBox ID="tbH" runat="server" CssClass="form-control input-xs" placeholder="H"></asp:TextBox>
                                    </div>
                                    <div class="col-md-2 text-left sinespacios">
                                        <h6>m</h6>
                                    </div>
                                </div>--%>





                                <div class="input-group input-group-sm">
                                    <span class="input-group-addon anchoTextoEntrada">Vano entre el punto O y F (L)</span>
                                    <input id="tbL" type="number" step="any" class="form-control" aria-label="Amount (to the nearest dollar)" required/>
                                    <span class="input-group-addon label-default">m</span>
                                </div>

                                <%--<div class="form-group">
                                    <div class="col-md-7">
                                        <h6>Vano entre el punto O y F (L):</h6>
                                    </div>

                                    <div class="col-md-3 sinespacios">
                                        <asp:TextBox ID="tbL" runat="server" CssClass="form-control input-xs" placeholder="L"></asp:TextBox>
                                    </div>
                                    <div class="col-md-2 text-left sinespacios">
                                        <h6>m</h6>
                                    </div>
                                </div>--%>



                                <div class="input-group input-group-sm">
                                    <span class="input-group-addon anchoTextoEntrada">Carga distribuida lìnea recta (Wo)</span>
                                    <input id="tbWo" type="number" step="any" class="form-control" aria-label="Amount (to the nearest dollar)" required/>
                                    <span class="input-group-addon label-default label-xs">KN/m</span>
                                </div>

                               <%-- <div class="form-group">
                                    <div class="col-md-7">
                                        <h6>Carga distribuida lìnea recta (Wo):</h6>
                                    </div>

                                    <div class="col-md-3 sinespacios">
                                        <asp:TextBox ID="tbWo" runat="server" CssClass="form-control input-xs" placeholder="Wo"></asp:TextBox>
                                    </div>
                                    <div class="col-md-2 text-left sinespacios ">
                                        <h6>KN/m</h6>
                                    </div>
                                </div>--%>

                                <div class="input-group input-group-sm">
                                    <span class="input-group-addon anchoTextoEntrada">Distancia entre tensores (DT)</span>
                                    <input id="tbDT" type="number" step="any" class="form-control" aria-label="Amount (to the nearest dollar)" required/>
                                    <span class="input-group-addon label-default">m</span>
                                </div>

                                <%--<div class="form-group">
                                    <div class="col-md-7">
                                        <h6>Distancia entre tensores (DT):</h6>
                                    </div>

                                    <div class="col-md-3 sinespacios">
                                        <asp:TextBox ID="tbDT" runat="server" CssClass="form-control input-xs" placeholder="DT"></asp:TextBox>
                                    </div>
                                    <div class="col-md-2 text-left sinespacios">
                                        <h6>m</h6>
                                    </div>
                                </div>--%>

                                
                            
                        </div>

                        <div class="panel-footer">
                            <div class="form-group">
                                    <div class="col-md-12 sinespacios">
                                        <button id="btnRun" type="submit" class="btn btn-warning btn-xs">Ejecutar</button>

                                        <%--<input id="btnValidar" type="submit" class="btn btn-warning btn-xs" value="Validar"/>--%>
                                        

                                    </div>
                            </div>
                        </div>

                    </div>
                </div>
                     <div class="col-md-7 sinespacios highInputAnalisiEstatico">
                        <div class="panel panel-default">
                            <div class="panel-heading">Esquema</div>
                            <div class="panel-body highInputAnalisiEstatico">...</div>

                        </div>
                    </div>
            </div>

        </div>



        <%--OUTPUT--%>
            <div class="panel panel-default">
                <div class="panel-heading">SALIDA</div>
                <div class="panel-body">
                    <div class="row col-condensed">
                        <div class="col-md-3 sinespacios">
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    
                                    <div class="form-horizontal ">
                                        <div class="form-group">
                                            <label class="control-label col-md-2">Tmin: </label>
                                            <div class="col-md-8">
                                                <asp:TextBox ID="tbMin" runat="server" CssClass="form-control input-sm" placeholder="Tensión mímima"></asp:TextBox>
                                            </div>
                                            <div class="col-md-2 text-left">
                                                <label class="control-label">KN</label>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="control-label col-md-2">To: </label>
                                            <div class="col-md-8">
                                                <asp:TextBox ID="tbTo" runat="server" CssClass="form-control input-sm" placeholder="Tensión punto O"></asp:TextBox>
                                            </div>
                                            <div class="col-md-2 text-left">
                                                <label class="control-label">KN</label>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="control-label col-md-2">Tf: </label>
                                            <div class="col-md-8">
                                                <asp:TextBox ID="tbTf" runat="server" CssClass="form-control input-sm" placeholder="Tensión punto F "></asp:TextBox>
                                            </div>
                                            <div class="col-md-2 text-left">
                                                <label class="control-label">KN</label>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="control-label col-md-2">Tmax: </label>
                                            <div class="col-md-8">
                                                <asp:TextBox ID="tbTmax" runat="server" CssClass="form-control input-sm" placeholder="Tensión máxima"></asp:TextBox>
                                            </div>
                                            <div class="col-md-2 text-left">
                                                <label class="control-label">KN</label>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                             <label class="control-label col-md-2">Tten: </label>
                                            <div class="col-md-8">
                                                <asp:TextBox ID="tbTten" runat="server" CssClass="form-control input-sm" placeholder="Tensión en los Tensores"></asp:TextBox>
                                            </div>
                                            <div class="col-md-2 text-left">
                                                <label class="control-label">KN</label>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                             <label class="control-label col-md-2">Nten: </label>
                                            <div class="col-md-8">
                                                <asp:TextBox ID="tbNten" runat="server" CssClass="form-control input-sm" placeholder="Número de Tensores"></asp:TextBox>
                                            </div>
                                            <div class="col-md-2 text-left">
                                                <label class="control-label">#</label>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="control-label col-md-2">S: </label>
                                            <div class="col-md-8">
                                                <asp:TextBox ID="tbS" runat="server" CssClass="form-control input-sm" placeholder="Longitud del Cable "></asp:TextBox>
                                            </div>
                                            <div class="col-md-2 text-left">
                                                <label class="control-label">m</label>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="control-label col-md-2">Lo: </label>
                                            <div class="col-md-8">
                                                <asp:TextBox ID="tbLo" runat="server" CssClass="form-control input-sm" placeholder="Distancia o vano punto O"></asp:TextBox>
                                            </div>
                                            <div class="col-md-2 text-left">
                                                <label class="control-label">m</label>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="control-label col-md-2">Lf: </label>
                                            <div class="col-md-8">
                                                <asp:TextBox ID="tbLf" runat="server" CssClass="form-control input-sm" placeholder="Distancia o vano punto F"></asp:TextBox>
                                            </div>
                                            <div class="col-md-2 text-left">
                                                <label class="control-label">m</label>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="control-label col-md-2">DTo: </label>
                                            <div class="col-md-8">
                                                <asp:TextBox ID="tbDTo" runat="server" CssClass="form-control input-sm" placeholder="Dist. punto O y Tensor"></asp:TextBox>
                                            </div>
                                            <div class="col-md-2 text-left">
                                                <label class="control-label">m</label>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="control-label col-md-2">DTf: </label>
                                            <div class="col-md-8">
                                                <asp:TextBox ID="tbDTf" runat="server" CssClass="form-control input-sm" placeholder="Dist. punto F y Tensor"></asp:TextBox>
                                            </div>
                                            <div class="col-md-2 text-left">
                                                <label class="control-label">m</label>
                                            </div>
                                        </div>


                                    
                                    </div>
                                </div>
                                <div class="panel-footer">
                                    <input id="btnDecargarResultados" type="button" class="btn btn-success" value="Descargar"/>
                                </div>
                            </div>
                        </div>

                        <%--Gráficas--%>
                        <div class="col-md-9 sinespacios ">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="panel panel-default">
                                        <div class="panel-body">
                                            <canvas id="chartCable" width="200" height="100" />

                                        </div>
                                       
                                        <div class="panel-footer">
                                            <div class="form-group">
                                                <div class="col-md-6">
                                                    Cable
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
                                            <canvas id="chartTensor" width="200" height="100" />

                                        </div>
                                        
                                        <div class="panel-footer">
                                            <div class="form-group">
                                                <div class="col-md-6">
                                                    Tensores
                                                </div>
                                                <div class="col-md-6">
                                                    <input id="save-tensor" class="btn btn-danger btn-xs pull-right" type="button" value="Descargar"/>
                                                </div>
                                                
                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="panel panel-default">
                                        <div class="panel-body">
                                            <canvas id="chartCarga" width="200" height="100" />

                                        </div>
                                        
                                        <div class="panel-footer">
                                            <div class="form-group">
                                                <div class="col-md-6">
                                                    Carga
                                                </div>
                                                <div class="col-md-6">
                                                    
                                                    <input id="save-carga" class="btn btn-danger btn-xs pull-right" type="button" value="Descargar"/>
                                                </div>
                                                
                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="panel panel-default">
                                        <div class="panel-body">
                                            <canvas id="chartCableTensoresCarga" width="200" height="100" />

                                        </div>
                                        
                                        <div class="panel-footer">
                                          
                                            <div class="form-group">
                                                <div class="col-md-6">
                                                      Cable-Tensores-Carga
                                                </div>
                                                <div class="col-md-6">
                                                    <input id="save-all" class="btn btn-danger btn-xs pull-right" type="button" value="Descargar"/>
                                                </div>
                                                
                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

        </div>
    </form>
</body>
</html>
