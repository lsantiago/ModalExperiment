<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Spectrum.aspx.cs" Inherits="experimento_Spectrum" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <script src="jquery.js"></script>
    <script src="jquery-ui.js"></script>
    <link href="jquery-ui.css" rel="stylesheet" />
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" />
    <link rel="stylesheet" href="../css/change-boostrap.css" />
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <!-- Libreria para gráficar -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.1.4/Chart.min.js"></script>

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

                    // El último arreglo corresponde al tiempo
                    var numDesplazamientos = aData.length;
                    var numColTiempo = aData.length - 1;

                    for (line = 0; line < numDesplazamientos - 1; line++) {
                        dataPoints = [];
                        lineChartData.datasets.push({}); //create a new line dataset
                        dataset = lineChartData.datasets[line]
                        dataset.fillColor = "rgba(0,0,0,0)";
                        dataset.strokeColor = "rgba(200,200,200,1)";
                        dataset.lineTension = 0;
                        dataset.pointRadius = 0;
                        dataset.borderWidth = 0.8;

                        //dataset.borderColor = "rgb("+(line*10)+",23, 0)";

                        if (line == numDesplazamientos - 2) {
                            dataset.borderWidth = 0.8;
                            dataset.borderColor = "rgb(255, 0, 0)";
                            dataset.borderCapStyle = 'butt';
                        }
                        
                        
                        dataset.fill = false,
                        dataset.data = []; //contains the 'Y; axis data
                        dataset.label = "Desplazamiento " + (line + 1);

                        for (x = 0; x < aData[0].length; x++) {
                            dataPoints.push({ x: parseFloat(aData[numColTiempo][x]), y: parseFloat(aData[line][x]) });

                        } //for x

                        lineChartData.datasets[line].data = dataPoints; //send new line data to dataset
                    } //for line

                    var ctx = document.getElementById(chart).getContext("2d");
                    

                    var scatterChart = new Chart(ctx, {
                        type: 'line',
                        data: lineChartData,
                        options: {
                            
                            legend: {
                                display: false,
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

                    

                    
                }
            });

        }



        // ejecución de análisis
        $(document).ready(function () {
            $("#btnRun").click(function (event) {

                var dataAmortiguamienoto = $('#tbAmortiguamiento').val();
                console.log("Escribiendo amortiguamiento..." + dataAmortiguamienoto);

                var actionData = "{'value': '" + dataAmortiguamienoto + "'}";

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

                    }
                });

                
            });

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
    <form id="form1" runat="server">
        Select Files :
        <asp:FileUpload ID="FileUpload1" runat="server" AllowMultiple="true" />
        <br />
        <br />
        Amortiguamiento:
        <input type="text" id="tbAmortiguamiento" />
        <br />
        <br />
        <input type="button" id="btnUpload" value="Subir archivos" />
        <input type="button" id="btnRun" value="Ejecutar" />
        <br />

        <br />
        <div style="width: 300px">
            <div id="progressbar" style="position: relative; display: none">
                <span style="position: absolute; left: 35%; top: 20%" id="progressBar-label">Uploading...
                </span>
            </div>
        </div>


        <div class="row">

            <div class="col-md-4">
                <h2>Espectro de Pseudo Desplazamiento (Sd)</h2>

                <canvas id="chartSD" />
                <div id="legendDiv"></div>


            </div>
            <div class="col-md-4">
                <h2>Espectro de Pseudo Velocidad (Psv)</h2>

                <canvas id="chartPSV" />


            </div>
            <div class="col-md-4">
                <h2>Espectro de Pseudo Aceleración (Psa) </h2>

                <canvas id="chartPSA" />


            </div>
           

        </div>

    </form>
</body>
</html>
