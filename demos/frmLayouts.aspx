<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmLayouts.aspx.cs" Inherits="demos_frmLayouts" EnableEventValidation="false" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" />
    <link rel="stylesheet" href="../css/change-boostrap.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

    <!-- Libreria para gráficar -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.1.4/Chart.min.js"></script>

    <!-- Valiation data -->
    <script>
        function HideCtrlsInput(ddlId) {
            var NUM_FIL = 30;
            var NUM_COL = 8;
            var $tbl = $("#tablaModal");
            var $tblhead = $("#tablaModal th");

            var ctrlNroPisos = document.getElementById(ddlId);
            var i;
            var nroPisos = Number(ctrlNroPisos.value);
            

            // oculta filas
            for (i = 1; i <= NUM_FIL; i++) {
                fila = document.getElementById('tablaModal').getElementsByTagName('tr')[i];
                if (i <= nroPisos) {
                    document.getElementById("tbK" + String(i)).disabled = false;
                    document.getElementById("tbM" + String(i)).disabled = false;
                    document.getElementById("tbU" + String(i)).disabled = false;
                    document.getElementById("tbI" + String(i)).disabled = false;
                    document.getElementById("tbH" + String(i)).disabled = false;
                    fila.style.display = '';
                } else {
                    document.getElementById("tbK" + String(i)).disabled = true;
                    document.getElementById("tbM" + String(i)).disabled = true;
                    document.getElementById("tbU" + String(i)).disabled = true;
                    document.getElementById("tbI" + String(i)).disabled = true;
                    document.getElementById("tbH" + String(i)).disabled = true;
                    fila.style.display = 'none';

                    document.getElementById("tbK" + String(i)).value = "";
                    document.getElementById("tbM" + String(i)).value = "";
                    document.getElementById("tbU" + String(i)).value = "";
                    document.getElementById("tbI" + String(i)).value = "";
                }
            }

            // obtiene el tipo de analísis modal
            var categoria = $('#<%= rbCategoria.ClientID %> input:checked').val();

            // habilita todas las columnas
            for (i = 2; i <= 9; i++) {
                $tbl.find('tr :nth-child(' + (i) + ')').show();
            }

            // oculta columnas dependiendo del tipo de analísis modal
            if (categoria == 3) {
                // oculta amortiguamiento
                $tbl.find('tr :nth-child(' + (4) + ')').toggle();
                // oculta fuerza
                $tbl.find('tr :nth-child(' + (7) + ')').toggle();
                // oculta frecuencia
                $tbl.find('tr :nth-child(' + (8) + ')').toggle();
            } else if (categoria == 4) {
                // oculta fuerza
                $tbl.find('tr :nth-child(' + (7) + ')').toggle();
                // oculta frecuencia
                $tbl.find('tr :nth-child(' + (8) + ')').toggle();
            } else if (categoria == 5) {
                // oculta amortiguamiento
                $tbl.find('tr :nth-child(' + (4) + ')').toggle();
                // oculta desplazamiento inicial
                $tbl.find('tr :nth-child(' + (5) + ')').toggle();
                // oculta velocidad inicial
                $tbl.find('tr :nth-child(' + (6) + ')').toggle();
            } else if (categoria == 6) {
                // oculta desplazamiento inicial
                $tbl.find('tr :nth-child(' + (5) + ')').toggle();
                // oculta velocidad inicial
                $tbl.find('tr :nth-child(' + (6) + ')').toggle();
            }
        }
    </script>
    <style type="text/css">
        #canvas-holder {
            width: 100%;
            padding-left: 5px;
            cursor: pointer;
        }
    </style>
    <script>
        function graficar() {
            $.ajax({
                type: "POST",
                url: "frmLayouts.aspx/getLineChartData",
                data: "{}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    /**
                    Generación de datasets dinámicos
                    **/

                    var datasetValue = [];
                    var count = 10;
                    for (var j = 0; j < count; j++) {
                        datasetValue[j] =
                            {
                                fillColor: 'rgba(220,220,220,0.5)',
                                strokeColor: 'rgba(220,220,220,1)',
                                title: '2013',
                                data: [Math.round(Math.random() * 100), Math.round(Math.random() * 100) - 10]
                            }
                    }
                    var mydata = {
                        datasets: datasetValue
                    }

                    //Fin de generación de datasets dinámicos

                    var aData = msg.d;

                    var aLabels = aData[0];
                    var aDatasets1 = aData[1];
                    var aDatasets2 = aData[2];
                    var aDatasets3 = aData[3];
                    var aDatasets4 = aData[4];

                    var data = {
                        labels: aLabels,
                        datasets: [{
                            label: "u",
                            //fillColor: "rgba(220,220,220,0.2)",
                            fillColor: 'rgba(0,0,0,0)',
                            strokeColor: "rgba(220,220,220,1)",
                            pointColor: "rgba(220,220,220,1)",
                            pointStrokeColor: "#fff",
                            pointHighlightFill: "#fff",
                            pointHighlightStroke: "rgba(220,220,220,1)",
                            data: aDatasets1
                        },
                         {
                             label: "up",
                             //fillColor: "rgba(151,187,205,0.2)",
                             fillColor: 'rgba(0,0,0,0)',
                             strokeColor: "rgba(151,187,205,1)",
                             pointColor: "rgba(151,187,205,1)",
                             pointStrokeColor: "#fff",
                             pointHighlightFill: "#fff",
                             pointHighlightStroke: "rgba(151,187,205,1)",
                             data: aDatasets2
                         },
                        {
                            label: "upp",
                            //fillColor: "rgba(151,187,205,0.2)",
                            fillColor: 'rgba(0,0,0,0)',
                            strokeColor: "rgba(151,187,205,1)",
                            pointColor: "rgba(151,187,205,1)",
                            pointStrokeColor: "#fff",
                            pointHighlightFill: "#fff",
                            pointHighlightStroke: "rgba(151,187,205,1)",
                            data: aDatasets3
                        },
                        {
                            label: "ek",
                            fillColor: "rgba(151,187,205,0.2)",
                            strokeColor: "rgba(151,187,205,1)",
                            pointColor: "rgba(151,187,205,1)",
                            pointStrokeColor: "#fff",
                            pointHighlightFill: "#fff",
                            pointHighlightStroke: "rgba(151,187,205,1)",
                            data: aDatasets4
                        }]
                    }


                    var data1 = {
                        labels: aLabels,
                        datasets: [{
                            label: "u",
                            fillColor: "rgba(151,187,205,0)",
                            strokeColor: "rgba(151,187,205,1)",
                            pointColor: "rgba(151,187,205,1)",
                            data: aDatasets1
                        }]
                    }

                    var data2 = {
                        labels: aLabels,
                        datasets: [{
                            label: "up",
                            fillColor: "rgba(220,220,220,0.2)",
                            strokeColor: "rgba(220,220,220,1)",
                            pointColor: "rgba(220,220,220,1)",
                            pointStrokeColor: "#fff",
                            pointHighlightFill: "#fff",
                            pointHighlightStroke: "rgba(220,220,220,1)",
                            data: mydata
                        }]
                    }

                    var data3 = {
                        labels: aLabels,
                        datasets: [{
                            label: "upp",
                            fillColor: "rgba(220,220,220,0.2)",
                            strokeColor: "rgba(220,220,220,1)",
                            pointColor: "rgba(220,220,220,1)",
                            pointStrokeColor: "#fff",
                            pointHighlightFill: "#fff",
                            pointHighlightStroke: "rgba(220,220,220,1)",
                            data: aDatasets3
                        }]
                    }

                    var ctx = document.getElementById("bar-area").getContext("2d");
                    ctx.canvas.height = 300;  // setting height of canvas
                    ctx.canvas.width = 500; // setting width of canvas
                    //var lineChart = new Chart(ctx).Line(data, {bezierCurve: false});

                    //var lineChart = new Chart(ctx).Bar(data, { responsive: true });
                    var myLineChart = new Chart(ctx, {
                        type: 'line',
                        // Fill style of the legend box
                        fillStyle: Color,
                        hidden: false,
                        fill: false,
                        legend: {
                            display: true,
                            labels: {
                                fontColor: 'rgb(255, 99, 132)'
                            }
                        },
                        data: data
                    });


                    var ctx2 = document.getElementById("bar-area2").getContext("2d");
                    ctx2.canvas.height = 300;  // setting height of canvas
                    ctx2.canvas.width = 500; // setting width of canvas
                    //var lineChart = new Chart(ctx).Line(data, {bezierCurve: false});

                    //var lineChart = new Chart(ctx).Bar(data, { responsive: true });
                    var myLineChart2 = new Chart(ctx2, {
                        type: 'line',
                        data: data1,
                        options: {
                            scales: {
                                xAxes: [{
                                    time: {
                                        unit: 'second'
                                    }
                                }]
                            }
                        }
                    });


                    var ctx3 = document.getElementById("bar-area3").getContext("2d");
                    ctx3.canvas.height = 300;  // setting height of canvas
                    ctx3.canvas.width = 500; // setting width of canvas
                    //var lineChart = new Chart(ctx).Line(data, {bezierCurve: false});

                    //var lineChart = new Chart(ctx).Bar(data, { responsive: true });
                    var myLineChart3 = new Chart(ctx3, {
                        type: 'line',
                        data: data2,
                        options: {
                            scales: {
                                xAxes: [{
                                    time: {
                                        unit: 'second'
                                    }
                                }]
                            }
                        }
                    });


                    var ctx4 = document.getElementById("bar-area4").getContext("2d");
                    ctx4.canvas.height = 300;  // setting height of canvas
                    ctx4.canvas.width = 500; // setting width of canvas
                    //var lineChart = new Chart(ctx).Line(data, {bezierCurve: false});

                    //var lineChart = new Chart(ctx).Bar(data, { responsive: true });
                    var myLineChart4 = new Chart(ctx4, {
                        type: 'line',
                        data: data3,
                        options: {
                            scales: {
                                xAxes: [{
                                    time: {
                                        unit: 'second'
                                    }
                                }]
                            }
                        }
                    });


                }
            });
        };
    </script>



</head>
<body onload="HideCtrlsInput('ddlNCL');">
    <form id="form1" runat="server">

        <div class="container">
            <div class="row">
                <p></p>
            </div>
            <div class="row">
                <div class="col-md-3">
                    <div class="panel panel-primary">

                        <div class="panel-heading">Modal Analysis </div>
                        <div class="panel-body panel-height">
                            <asp:RadioButtonList ID="rbCategoria" runat="server" CssClass="radio">
                                <asp:ListItem class="radio-inline" Value="3" Selected="True">Vibración libre no amortiguada</asp:ListItem>
                                <asp:ListItem class="radio-inline" Value="4">Vibración libre amortiguada</asp:ListItem>
                                <asp:ListItem class="radio-inline" Value="5">Vibración armónica de un sistema no amoriguado</asp:ListItem>
                                <asp:ListItem class="radio-inline" Value="6">Vibración armónica de un sitema amortiguado</asp:ListItem>

                            </asp:RadioButtonList>

                        </div>


                    </div>
                </div>
                <div class="col-md-3">
                    <div class="panel panel-primary">

                        <div class="panel-heading">Initial Data</div>
                        <div class="panel-body panel-height">
                            <form class="form-horizontal" role="form">
                                <div class="form-group">
                                    <asp:Label for="inputdefault" ID="lblNCL" runat="server" Text="NCL" class="col-md-2 control-label"></asp:Label>
                                    <div class="col-md-10">
                                        <asp:DropDownList ID="ddlNCL" runat="server" CssClass="form-control input-sm ">
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
                                            <asp:ListItem Value="11">11</asp:ListItem>
                                            <asp:ListItem Value="12">12</asp:ListItem>
                                            <asp:ListItem Value="13">13</asp:ListItem>
                                            <asp:ListItem Value="14">14</asp:ListItem>
                                            <asp:ListItem Value="15">15</asp:ListItem>
                                            <asp:ListItem Value="16">16</asp:ListItem>
                                            <asp:ListItem Value="17">17</asp:ListItem>
                                            <asp:ListItem Value="18">18</asp:ListItem>
                                            <asp:ListItem Value="19">19</asp:ListItem>
                                            <asp:ListItem Value="20">20</asp:ListItem>
                                            <asp:ListItem Value="21">21</asp:ListItem>
                                            <asp:ListItem Value="22">22</asp:ListItem>
                                            <asp:ListItem Value="23">23</asp:ListItem>
                                            <asp:ListItem Value="24">24</asp:ListItem>
                                            <asp:ListItem Value="25">25</asp:ListItem>
                                            <asp:ListItem Value="26">26</asp:ListItem>
                                            <asp:ListItem Value="27">27</asp:ListItem>
                                            <asp:ListItem Value="28">28</asp:ListItem>
                                            <asp:ListItem Value="29">29</asp:ListItem>
                                            <asp:ListItem Value="30">30</asp:ListItem>

                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <br />
                                <div class="form-group">
                                    <asp:Label ID="lblTO" runat="server" Text="to" class="col-md-2 control-label"></asp:Label>
                                    <div class="col-md-10">
                                        <asp:TextBox ID="tbTO" runat="server" CssClass="form-control input-sm" placeholder="Tiempo inicial"></asp:TextBox>
                                    </div>
                                </div>
                                <br />
                                <div class="form-group">
                                    <asp:Label ID="lblTF" runat="server" Text="tf" class="col-md-2 control-label"></asp:Label>
                                    <div class="col-md-10">
                                        <asp:TextBox ID="tbTF" runat="server" CssClass="form-control input-sm" placeholder="Tiempo final"></asp:TextBox>
                                    </div>
                                </div>
                                <br />
                                <div class="form-group">
                                    <asp:Label ID="lblPA" runat="server" Text="&#916;pa" class="col-md-2 control-label"></asp:Label>
                                    <div class="col-md-10">
                                        <asp:TextBox ID="tbPA" runat="server" CssClass="form-control input-sm" placeholder="Incremento de tiempo"></asp:TextBox>
                                    </div>
                                </div>
                                <br />
                                
                                <br />
                                <div class="form-group">

                                    <!-- Trigger the modal with a button -->
                                    <button type="button" class="col-md-5 btn btn-info btn-md" data-toggle="modal" data-target="#myModal" onclick="HideCtrlsInput('ddlNCL');">Set Vars</button>
                                    <div class="col-md-2">
                                    </div>
                                    <asp:Button ID="btnRun" class="col-md-5 btn btn-info btn-md" runat="server" Text="Run" OnClick="btnRun_Click" />

                                </div>
                            </form>


                        </div>


                    </div>
                </div>
                <div class="col-md-6">
                    <div class="panel panel-success">

                        <div class="panel-heading">Graph</div>
                        <div class="panel-body panel-height">
                            <p>...</p>
                        </div>

                        <table class="table">
                        </table>
                    </div>
                </div>
            </div>
            <div class="row">

                <div class="col-md-6">
                    <h2>Gráfico 1</h2>

                    <div id="canvas-holder">
                        <canvas id="bar-area" />
                    </div>

                </div>
                <div class="col-md-6">
                    <h2>Gráfico 2</h2>


                    <canvas id="bar-area2" />


                </div>

            </div>
            <div class="row">

                <div class="col-md-6">
                    <h2>Gráfico 3</h2>


                    <canvas id="bar-area3" />


                </div>
                <div class="col-md-6 panel-body">
                    <div class="panel-body">
                        <h2>Gráfico 4</h2>
                        <div>
                            <canvas id="bar-area4" />
                        </div>
                    </div>
                </div>

            </div>

            <!-- Modal -->
            <div id="myModal" class="modal fade" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">PROPIEDADES MECÁNICAS DEL SISTEMA</h4>
                        </div>
                        <div class="modal-body">
                            <table id="tablaModal" class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Piso</th>
                                        <th class="M">Masa</th>
                                        <th class="K">Rigidez</th>
                                        <th class="C">Amortiguamiento</th>
                                        <th class="U">Desp. inicial</th>
                                        <th class="I">Vel. incial</th>
                                        <th class="F">Fuerza</th>
                                        <th class="W">Frec. de mov.</th>
                                        <th class="H">A. piso</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>
                                            <asp:TextBox ID="tbM1" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbK1" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbC1" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbU1" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbI1" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbF1" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbW1" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbH1" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                    </tr>

                                    <tr>
                                        <td>2</td>
                                        <td>
                                            <asp:TextBox ID="tbM2" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbK2" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbC2" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbU2" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbI2" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbF2" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbW2" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbH2" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                    </tr>

                                    <tr>
                                        <td>3</td>
                                        <td>
                                            <asp:TextBox ID="tbM3" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbK3" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbC3" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbU3" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbI3" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbF3" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbW3" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbH3" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                    </tr>

                                    <tr>
                                        <td>4</td>
                                        <td>
                                            <asp:TextBox ID="tbM4" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbK4" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbC4" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbU4" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbI4" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbF4" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbW4" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbH4" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                    </tr>

                                    <tr>
                                        <td>5</td>
                                        <td>
                                            <asp:TextBox ID="tbM5" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbK5" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbC5" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbU5" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbI5" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbF5" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbW5" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbH5" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                    </tr>

                                    <tr>
                                        <td>6</td>
                                        <td>
                                            <asp:TextBox ID="tbM6" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbK6" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbC6" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbU6" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbI6" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbF6" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbW6" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbH6" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                    </tr>

                                    <tr>
                                        <td>7</td>
                                        <td>
                                            <asp:TextBox ID="tbM7" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbK7" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbC7" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbU7" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbI7" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbF7" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbW7" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbH7" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                    </tr>

                                    <tr>
                                        <td>8</td>
                                        <td>
                                            <asp:TextBox ID="tbM8" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbK8" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbC8" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbU8" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbI8" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbF8" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbW8" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbH8" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                    </tr>

                                    <tr>
                                        <td>9</td>
                                        <td>
                                            <asp:TextBox ID="tbM9" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbK9" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbC9" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbU9" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbI9" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbF9" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbW9" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbH9" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                    </tr>

                                    <tr>
                                        <td>10</td>
                                        <td>
                                            <asp:TextBox ID="tbM10" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbK10" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbC10" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbU10" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbI10" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbF10" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbW10" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbH10" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                    </tr>

                                    <tr>
                                        <td>11</td>
                                        <td>
                                            <asp:TextBox ID="tbM11" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbK11" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbC11" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbU11" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbI11" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbF11" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbW11" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbH11" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                    </tr>

                                    <tr>
                                        <td>12</td>
                                        <td>
                                            <asp:TextBox ID="tbM12" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbK12" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbC12" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbU12" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbI12" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbF12" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbW12" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbH12" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                    </tr>

                                    <tr>
                                        <td>13</td>
                                        <td>
                                            <asp:TextBox ID="tbM13" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbK13" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbC13" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbU13" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbI13" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbF13" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbW13" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbH13" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                    </tr>

                                    <tr>
                                        <td>14</td>
                                        <td>
                                            <asp:TextBox ID="tbM14" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbK14" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbC14" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbU14" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbI14" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbF14" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbW14" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbH14" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                    </tr>


                                    <tr>
                                        <td>15</td>
                                        <td>
                                            <asp:TextBox ID="tbM15" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbK15" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbC15" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbU15" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbI15" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbF15" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbW15" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbH15" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                    </tr>

                                    <tr>
                                        <td>16</td>
                                        <td>
                                            <asp:TextBox ID="tbM16" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbK16" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbC16" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbU16" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbI16" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbF16" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbW16" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbH16" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                    </tr>

                                    <tr>
                                        <td>17</td>
                                        <td>
                                            <asp:TextBox ID="tbM17" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbK17" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbC17" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbU17" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbI17" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbF17" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbW17" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbH17" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                    </tr>

                                    <tr>
                                        <td>18</td>
                                        <td>
                                            <asp:TextBox ID="tbM18" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbK18" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbC18" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbU18" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbI18" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbF18" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbW18" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbH18" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                    </tr>

                                    <tr>
                                        <td>19</td>
                                        <td>
                                            <asp:TextBox ID="tbM19" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbK19" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbC19" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbU19" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbI19" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbF19" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbW19" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbH19" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                    </tr>

                                    <tr>
                                        <td>20</td>
                                        <td>
                                            <asp:TextBox ID="tbM20" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbK20" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbC20" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbU20" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbI20" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbF20" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbW20" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbH20" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                    </tr>

                                    <tr>
                                        <td>21</td>
                                        <td>
                                            <asp:TextBox ID="tbM21" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbK21" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbC21" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbU21" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbI21" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbF21" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbW21" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbH21" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                    </tr>

                                    <tr>
                                        <td>22</td>
                                        <td>
                                            <asp:TextBox ID="tbM22" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbK22" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbC22" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbU22" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbI22" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbF22" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbW22" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbH22" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                    </tr>

                                    <tr>
                                        <td>23</td>
                                        <td>
                                            <asp:TextBox ID="tbM23" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbK23" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbC23" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbU23" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbI23" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbF23" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbW23" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbH23" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                    </tr>

                                    <tr>
                                        <td>24</td>
                                        <td>
                                            <asp:TextBox ID="tbM24" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbK24" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbC24" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbU24" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbI24" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbF24" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbW24" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbH24" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                    </tr>

                                    <tr>
                                        <td>25</td>
                                        <td>
                                            <asp:TextBox ID="tbM25" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbK25" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbC25" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbU25" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbI25" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbF25" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbW25" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbH25" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                    </tr>

                                    <tr>
                                        <td>26</td>
                                        <td>
                                            <asp:TextBox ID="tbM26" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbK26" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbC26" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbU26" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbI26" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbF26" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbW26" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbH26" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                    </tr>

                                    <tr>
                                        <td>27</td>
                                        <td>
                                            <asp:TextBox ID="tbM27" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbK27" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbC27" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbU27" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbI27" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbF27" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbW27" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbH27" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                    </tr>

                                    <tr>
                                        <td>28</td>
                                        <td>
                                            <asp:TextBox ID="tbM28" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbK28" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbC28" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbU28" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbI28" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbF28" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbW28" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbH28" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                    </tr>

                                    <tr>
                                        <td>29</td>
                                        <td>
                                            <asp:TextBox ID="tbM29" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbK29" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbC29" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbU29" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbI29" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbF29" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbW29" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbH29" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                    </tr>

                                    <tr>
                                        <td>30</td>
                                        <td>
                                            <asp:TextBox ID="tbM30" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbK30" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbC30" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbU30" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbI30" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbF30" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbW30" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="tbH30" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                    </tr>


                                </tbody>
                            </table>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                    <!-- Modal content-->

                </div>
            </div>
            <!-- Modal -->
        </div>

    </form>

</body>
</html>
