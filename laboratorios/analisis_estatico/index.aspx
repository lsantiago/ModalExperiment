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

        <div class="panel panel-default">
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
                            <div class="panel-body highInputAnalisiEstatico">

                                

                                <div id="Ho" class="input-group input-group-sm">
                                    <span  class="input-group-addon anchoTextoEntrada">Altura o flecha del punto O (Ho)</span>
                                    <input id="tbHo" type="number" step="any" class="form-control" aria-label="Amount (to the nearest dollar)" required/>
                                    <span class="input-group-addon anchoTextoSimbolo">m</span>
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
                                    <span class="input-group-addon anchoTextoSimbolo">m</span>
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
                                    <span class="input-group-addon anchoTextoSimbolo">m</span>
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
                                    <span class="input-group-addon anchoTextoSimbolo">m</span>
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
                                    <span class="input-group-addon anchoTextoSimbolo label-xs">KN/m</span>
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
                                    <span class="input-group-addon anchoTextoSimbolo">m</span>
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

                                <br />
                                <div class="form-group">
                                    <div class="col-md-12 sinespacios">
                                        

                                       <button id="btnRun" type="submit" class="btn btn-warning btn-xs">Ejecutar</button>
                                        <button id="btnEjemplo" type="button" class="btn btn-default btn-xs">Ejemplo</button>
                                        

                                    </div>
                                    
                                </div>
                                
                            
                        </div>

                        <%--<div class="panel-footer">
                            <div class="form-group">
                                    <div class="col-md-12 sinespacios">
                                        

                                        <input id="btnValidar" type="submit" class="btn btn-warning btn-xs" value="Validar"/>
                                        

                                    </div>
                            </div>
                        </div>--%>

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

                                    <ul class="list-group">
                                        <li class="list-group-item">
                                            <span id="spMin" class="badge badge-light">KN</span>
                                            Tensión mínima (Tmin)
                                        </li>
                                        <li class="list-group-item">
                                            <span id="spTo" class="badge badge-light">KN</span>
                                            Tensión punto O (To)
                                        </li>
                                        <li class="list-group-item">
                                            <span id="spTf" class="badge badge-light">KN</span>
                                            Tensión punto F (Tf)
                                        </li>
                                         <li class="list-group-item">
                                            <span id="spTmax" class="badge badge-light">KN</span>
                                            Tensión máxima (Tmax)
                                        </li>
                                         
                                         <li class="list-group-item">
                                            <span id="spTten" class="badge badge-light">KN</span>
                                            Tensión en los Tensores (Tten)
                                        </li>
                                         <li class="list-group-item">
                                            <span id="spNten" class="badge badge-light">#</span>
                                            Número de Tensores (Nten)
                                        </li>
                                         <li class="list-group-item">
                                            <span id="spS" class="badge badge-light">m</span>
                                            Longitud del Cable (S)
                                        </li>
                                        
                                         <li class="list-group-item">
                                            <span id="spLo" class="badge badge-light">m</span>
                                            Distancia o vano punto O (Lo)
                                        </li>
                                         <li class="list-group-item">
                                            <span id="spLf" class="badge badge-light">m</span>
                                            Distancia o vano punto F (Lf)
                                        </li>

                                        <li class="list-group-item">
                                            <span id="spDTo" class="badge badge-light">m</span>
                                            Dist. punto O y Tensor (DTo)
                                        </li>

                                        <li class="list-group-item">
                                            <span id="spDTf" class="badge badge-light" >m</span>
                                            Dist. punto F y Tensor (DTf)
                                        </li>
                                    </ul>

                                    
                                </div>
                                <div class="panel-footer">
                                    <input id="btnDecargarResultados" type="button" class="btn btn-danger btn-xs" value="Descargar"/>
                                </div>
                            </div>
                        </div>

                        <%--Gráficas--%>
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
                                            <canvas id="chartTensor" width="500" height="198" />

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
                                            <canvas id="chartCarga" width="500" height="198" />

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
                                            <canvas id="chartCableTensoresCarga" width="500" height="198" />

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
