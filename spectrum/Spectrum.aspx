<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Spectrum.aspx.cs" Inherits="experimento_Spectrum" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../js/jquery.js"></script>
    <script src="../js/jquery-ui.js"></script>
    <link href="../css/jquery-ui.css" rel="stylesheet" />

    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" />
    <link rel="stylesheet" href="../css/change-boostrap.css" />
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <!-- Libreria para gráficar -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.1.4/Chart.min.js"></script>

    <%--angular--%>
     <script src= "http://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script>
    <script src="../js/Validacion.js"></script>

    <%--para ventana modal de espera--%>
    <script src="../js/waitingfor.js"></script>



    <%--Leyendas--%>
    <script src="../js/legend.js"></script>
    <script type="text/javascript">
        function graficarRegistro(file, chart, etiquetaEjeY) {
            console.log("Leyendo registros...");


            var actionData = "{'file': '" + file + "'}";


            $.ajax({
                type: "POST",
                url: "Spectrum.aspx/getRegistrosDesplazamiento",
                data: actionData,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    console.log("Amortiguamiento registrado.");

                    var aData = msg.d;

                    lineChartData = {}; //declare an object
                    lineChartData.labels = []; //add 'labels' element to object (X axis)
                    lineChartData.datasets = []; //add 'datasets' array element to object

                    var colors = ["#0000FF", "#FF0000", "#808080", "#000080", "#800080", "#800000", "#808000", "#008000", "#008080",
                                  "#000000"
                                 ];



                    // El último arreglo corresponde al tiempo
                    var numDesplazamientos = aData.length;
                    var numColTiempo = aData.length - 1;

                    for (line = 0; line < numDesplazamientos - 1; line++) {
                        dataPoints = [];
                        lineChartData.datasets.push({}); //create a new line dataset
                        dataset = lineChartData.datasets[line]
                        dataset.fillColor = "rgba(0,0,0,0)";
                        dataset.strokeColor = "rgba(200,200,200,1)";
                        dataset.borderColor = colors[line];
                        
                        dataset.lineTension = 0;
                        dataset.pointRadius = 0;
                        dataset.borderWidth = 0.4;

                        //dataset.borderColor = "rgb("+(line*10)+",23, 0)";

                        if (line == numDesplazamientos - 2) {
                            dataset.borderWidth = 1.4;
                            dataset.borderColor = "rgb(255, 0, 0)";
                            dataset.borderCapStyle = 'butt';
                        }


                        dataset.fill = false;
                        dataset.data = []; //contains the 'Y; axis data
                        dataset.label = "Desplazamiento " + (line + 1);

                        for (x = 0; x < aData[0].length; x++) {
                            dataPoints.push({ x: parseFloat(aData[numColTiempo][x]), y: parseFloat(aData[line][x]) });

                        } //for x

                        lineChartData.datasets[line].data = dataPoints; //send new line data to dataset
                    } //for line

                    var ctx = document.getElementById(chart).getContext("2d");
                    ctx.canvas.height = 70;  // setting height of canvas
                    ctx.canvas.width = 300; // setting width of canvas

                    var scatterChart = new Chart(ctx, {
                        type: 'line',
                        data: lineChartData,
                        
                        options: {
                            legend: {
                                display: true,
                                position: 'bottom'
                            },
                            
                            scales: {
                                xAxes: [{
                                    type: 'linear',
                                    position: 'bottom',
                                    scaleLabel: {
                                        display: true,
                                        labelString: 'Periodo (s)'
                                    }
                                }],
                                yAxes: [{
                                    scaleLabel: {
                                        display: true,
                                        labelString: etiquetaEjeY,
                                        stacked: true
                                    }
                                }]

                            }
                        }
                    });

                    legend(document.getElementById("legendDiv"), lineChartData);
                    



                }
            });

        }



        // ejecución de análisis
        $(document).ready(function () {
            




            // ejecuta modelo
            $("#btnRun").click(function (event) {

                var dataAmortiguamienoto = $('#tbAmortiguamiento').val();
                console.log("Escribiendo amortiguamiento..." + dataAmortiguamienoto);

                var actionData = "{'value': '" + dataAmortiguamienoto + "'}";

                // abre ventana modal de espera
                waitingDialog.show('Procesando registros sísmicos.', { dialogSize: 'md', progressType: 'warning' });


                $.ajax({
                    type: "POST",
                    url: "Spectrum.aspx/escribirAmortiguamiento",
                    data: actionData,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (msg) {
                        console.log("Amortiguamiento registrado.");
                        graficarRegistro("MatrizLeer(Sd).txt", "chartSD", "Desplazamiento (mm)");
                        graficarRegistro("MatrizLeer(Psv).txt", "chartPSV", "Velocidad (cm/s^2)");
                        graficarRegistro("MatrizLeer(Psa).txt", "chartPSA", "Aceleración (g)");

                        // cierra ventana modal de espera
                        waitingDialog.hide();
                    }
                });


            });


            // sube archivos al servidor
            $("#btnUpload").click(function (event) {
                var files = $("#FileUpload1")[0].files;
                if (files.length > 0) {
                    var formData = new FormData();
                    for (var i = 0; i < files.length; i++) {
                        formData.append(files[i].name, files[i]);
                    }

                    var progressbarLabel = $('#progressBar-label');
                    var progressbarDiv = $('#progressbar');

                    $.ajax({
                        url: 'UploadHandler.ashx',
                        method: 'post',
                        data: formData,
                        contentType: false,
                        processData: false,
                        success: function () {
                            progressbarLabel.text('Complete');
                            progressbarDiv.fadeOut(2000);
                        },
                        error: function (err) {
                            alert(err.statusText);
                        }
                    });

                    progressbarLabel.text('Uploading...');
                    progressbarDiv.progressbar({
                        value: false
                    }).fadeIn(500);
                }
            });
        });
    </script>
</head>
<body style="font-family: Arial">
    <form id="registrationForm" runat="server" ng-app="validationApp" ng-controller="validateCtrl">

        <div class="page-header">
            <h3>Spectrum</h3>
        </div>
       

        
        <div class="container-fluid">
            <%--INPUT--%>
            <div class="col-md-3">
                <div class="panel panel-success">
                    <div class="panel-heading">ENTRADA</div>
                    <div class="panel-body">

                        <div class="form-group">

                            <asp:FileUpload ID="FileUpload1" runat="server" AllowMultiple="true" accept=".txt,.AT2"/>

                        </div>

                        <div class="form-group">
                            <input type="button" class="btn btn-primary btn-sm" id="btnUpload" value="Subir archivos" />
                            <%--Barra de progreso--%>
                            <div style="width: 300px">
                                <div id="progressbar" style="position: relative; display: none">
                                    <span style="position: absolute; left: 35%; top: 20%" id="progressBar-label">Uploading...
                                    </span>
                                </div>
                            </div>
                        </div>

                        <%--Ingreso de amortiguamiento--%>
                        <div class="form-group">
                            <label for="amortiguamiento">Amortiguamiento:</label>
                            <input type="number"  id="tbAmortiguamiento" name="amortiguamiento" ng-model="amortiguamiento" required/>

                        </div>

                        <%--Ejecución de experimento--%>
                        <div class="form-group">
                            <%--disabled="disabled"--%>
                            <input type="button" id="btnRun"  class="btn btn-sm btn-success btn-block" value="Ejecutar" />

                            
                        </div>


                    </div>
                </div>
            </div>


            <%--OUTPUT--%>
            <div class="col-md-9">
                <div class="panel panel-default">
                    <div class="panel-heading">RESULTADOS</div>
                    <div class="panel-body">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <canvas id="chartSD" width="300" height="70" />
                                
                            </div>
                            <%--<div id="legendDiv"></div>--%>
                            <div class="panel-footer">
                                
                                Espectro de P. Desplazamiento (Sd)</div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <canvas id="chartPSV" width="300" height="70" />

                            </div>
                            <div class="panel-footer">Espectro de P. Velocidad (Psv)</div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <canvas id="chartPSA" width="300" height="70"  style='width:300px;height:70px'/>
                            </div>
                            <div class="panel-footer">Espectro de P. Aceleración (Psa)</div>
                            


                        </div>

                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
