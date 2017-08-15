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

        function getRandomColor() {
            var letters = '0123456789ABCDEF'.split('');
            var color = '#';
            for (var i = 0; i < 6; i++) {
                color += letters[Math.floor(Math.random() * 16)];
            }
            return color;
        }


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
                    console.log("Extrayendo datos del archivo.");

                    var aData = msg.d;

                    lineChartData = {}; //declare an object
                    lineChartData.labels = []; //add 'labels' element to object (X axis)
                    lineChartData.datasets = []; //add 'datasets' array element to object

                    //var colors = ["#0000FF", "#FF0000", "#808080", "#000080", "#800080", "#800000", "#808000", "#008000", "#008080",
                    //              "#000000"
                    //];

                    var colors = ["#FFFF00", "#FFA420", "#FF7514", "#FF2301", "#FE0000", "#FDF4E3", "#FAD201", "#F8F32B", "#F80000", "#F75E25",
                        "#F6F6F6", "#F5D033", "#F54021", "#F4F4F4", "#F4A900", "#F44611", "#F3DA0B", "#F3A505", "#F39F18", "#EFA94A", "#EDFF21",
                        "#ED760E", "#EC7C26", "#EAE6CA", "#EA899A", "#E7EBDA", "#E72512", "#E6D690", "#E63244", "#E5BE01", "#E55137", "#E4A010",
                        "#E1CC4F", "#DE4C8A", "#DC9D00", "#D95030", "#D84B20", "#D7D7D7", "#D7D7D7", "#D6AE01", "#D53032", "#D36E70", "#D0D0D0",
                        "#CF3476", "#CDA434", "#CC0605", "#CB2821", "#CAC4B0", "#C93C20", "#C7B446", "#C6A664", "#C51D34", "#C35831", "#C2B078",
                        "#C1876B", "#BEBD7F", "#BDECB6", "#B8B799", "#B5B8B1", "#B44C43", "#B32821", "#B32428", "#AF2B1E", "#AEA04B", "#A98307",
                        "#A65E2E", "#A5A5A5", "#A52019", "#A2231D", "#A18594", "#A12312", "#A03472", "#9E9764", "#9DA1AA", "#9D9101", "#9C9C9C",
                        "#9B111E", "#999950", "#969992", "#955F20", "#922B3E", "#909090", "#8F8F8F", "#8F8B66", "#8E402A", "#8D948D", "#8C568A",
                        "#8B8C7A", "#8A9597", "#8A6642", "#89AC76", "#898176", "#8673A1", "#84C3BE", "#82898F", "#828282", "#826C34", "#7FB5B5",
                        "#7F7679", "#7E7B52", "#7D8471", "#7D7F7D", "#79553D", "#78858B", "#781F19", "#763C28", "#755C48", "#75151E", "#734222",
                        "#721422", "#705335", "#6F4F28", "#6D6552", "#6D3F5B", "#6C7156", "#6C7059", "#6C6960", "#6C6874", "#6C4675", "#6C3B2A",
                        "#6A5F31", "#6A5D4D", "#686C5E", "#646B63", "#642424", "#641C34", "#633A34", "#606E8C", "#5E2129", "#5D9B9B", "#5B3A29",
                        "#59351F", "#592321", "#587246", "#57A639", "#4E5754", "#4E5452", "#4E3B31", "#4D5645", "#4C9141", "#4C514A", "#4C2F27",
                        "#4A192C", "#497E76", "#49678D", "#474B4E", "#474A51", "#47402E", "#464531", "#45322E", "#434B4D", "#434750", "#424632",
                        "#412227", "#403A3A", "#3F888F", "#3E5F8A", "#3E3B32", "#3D642D", "#3B83BD", "#3B3C36", "#39352A", "#382C1E", "#35682D",
                        "#354D73", "#343E40", "#343B29", "#332F2C", "#317F43", "#316650", "#31372B", "#308446", "#2F4538", "#2F353B", "#2E3A23",
                        "#2D572C", "#2C5545", "#2A6478", "#293133", "#287233", "#282828", "#26252D", "#256D7B", "#252850", "#25221B", "#24E711",
                        "#23282B", "#231A24", "#2271B3", "#212121", "#20603D", "#20214F", "#1F3A3D", "#1F3438", "#1E5945", "#1E2460", "#1E213D",
                        "#1E1E1E", "#1D334A", "#1D1E33", "#1C542D", "#1C1C1C", "#1B5583", "#193737", "#18171C", "#102C54", "#0E294B", "#0A0A0A",
                        "#063971", "#025669", "#015D52", "#00F700"];

                    console.log(aData[0][0]);
                    console.log(aData[1].length)

                    // El último arreglo corresponde al tiempo
                    var numDesplazamientos = aData.length - 2;
                    var numColTiempo = aData.length - 1;

                    for (line = 0; line < numDesplazamientos; line++) {
                        dataPoints = [];
                        lineChartData.datasets.push({}); //create a new line dataset
                        dataset = lineChartData.datasets[line]
                        dataset.fillColor = "rgba(0,0,0,0)";
                        dataset.strokeColor = "rgba(200,200,200,1)";
                        //console.log(getRandomColor());
                        var color = colors[line+30];
                        dataset.backgroundColor = color;
                        dataset.borderColor = color;
                        
                        
                        dataset.lineTension = 0;
                        dataset.pointRadius = 0;
                        dataset.borderWidth = 0.4;

                        //dataset.borderColor = "rgb("+(line*10)+",23, 0)";

                        dataset.label = "Desplazamiento " + aData[0][line];
                        if (line == numDesplazamientos - 1) {
                            dataset.borderWidth = 1.4;
                            dataset.borderColor = "rgb(255, 0, 0)";
                            dataset.backgroundColor = "rgb(255, 0, 0)";
                            dataset.borderCapStyle = 'butt';
                            dataset.label = "Promedio";
                        }


                        dataset.fill = false;
                        dataset.data = []; //contains the 'Y; axis data
                        

                        for (x = 0; x < aData[numColTiempo].length; x++) {
                            dataPoints.push({ x: parseFloat(aData[numColTiempo][x]), y: parseFloat(aData[line+1][x]) });

                        } //for x

                        lineChartData.datasets[line].data = dataPoints; //send new line data to dataset
                    } //for line







                    var ctx = document.getElementById(chart).getContext("2d");
                    //ctx.canvas.height = 70;  // setting height of canvas
                    ctx.canvas.width = 300; // setting width of canvas

                    var scatterChart = new Chart(ctx, {
                        type: 'line',
                        data: lineChartData,
                        onAnimationComplete: function() {
                            var ctx = this.chart.ctx;
                            ctx.font = this.scale.font;
                            ctx.fillStyle = this.scale.textColor
                            ctx.textAlign = "right";
                            ctx.textBaseline = "right";
                            this.datasets.forEach(function(dataset) {
                                dataset.bars.forEach(function(bar) {
                                    ctx.fillText(bar.value, bar.x, bar.y - 5);
                                });
                            });
                        },
                        options: {
                            legend: {
                                display: true,
                                position: 'bottom',
                                hidden: true,
                                padding: 2,
                                fontSize: 5
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
                    

                    document.getElementById('js-legend').innerHTML = scatterChart.generateLegend();

                }
            });

        }

        function ejecutarModelo() {
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
        }

        
        $(document).ready(function () {

            // Validación y ejecución de modelo
            $('#formSpectrum').submit(function (event) {
                if (this.checkValidity()) {
                    event.preventDefault();

                    console.log("Ejecutando spectrum");

                    ejecutarModelo();
                }
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
    <form id="formSpectrum" runat="server">
        <nav class="navbar navbar-inverse">
          <div class="container-fluid">
            <div class="navbar-header">
              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-2">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
              
                <p class="navbar-brand">SPECTRUM</p>
            </div>

            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-2">
              
              
              <ul class="nav navbar-nav navbar-right">
                <li><a href="#">Ayuda</a></li>
              </ul>
            </div>
          </div>
        </nav>

         <div class="container-fluid">
         
          <p>Descripción: Spectrum
          <br/>Autores: Edwin Duque, Santiago Quiñones, Jhandry Ramón
          <br/>Información: VLNA.pdf</p>
               
        </div> <!— /container —>

        <div class="page-header">
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
                            <input type="number"  id="tbAmortiguamiento" name="amortiguamiento" step="any" required/>

                        </div>

                        <%--Ejecución de experimento--%>
                        <div class="form-group">
                            
                            <%--<input type="button" id="btnRun"  class="btn btn-sm btn-success btn-block" value="Ejecutar" />--%>
                            <button id="btnRun" type="submit" class="btn btn-sm btn-success btn-block">Ejecutar</button>
                            
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
                                <%--<canvas id="chartSD" width="300" height="70" />--%>
                                 <canvas id="chartSD" width="300"  />
                                
                            </div>
                           <%-- <div id="legendDiv"></div>
                            <div id="js-legend" class="chart-legend"></div>--%>
                            <div class="panel-footer">
                                
                                Espectro de P. Desplazamiento (Sd)</div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <canvas id="chartPSV" width="300"  />

                            </div>
                            <div class="panel-footer">Espectro de P. Velocidad (Psv)</div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <canvas id="chartPSA" width="300"/>
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
