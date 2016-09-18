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

    
    <script src="../js/jquery.matchHeight.js" type="text/javascript"></script>
    <%--<script src="../js/waitingfor.js"></script>--%>
    
    <!-- Valiation data -->
    <script>

        $(document).ready(function () {
            //$("#gradoLibertad").on('click', graficarPropiedad("bar-area", "Un1", "1"));
            console.log("Página cargada.");
            loadConfiguracionCtrlsGraficos();
            
            // solo para mostrar los espacios gráficos
            //borrarResultadoAnterior();
            //graficarResultados();
            //graficarModosVibracion();

            // ajusta el tamaño de las columnaas
            $('.equal-height-panels .panel').matchHeight();
        });


        function borrarResultadoAnterior() {
            $.ajax({
                type: "POST",
                url: "frmLayouts.aspx/borrarResultados",
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    console.log(msg.d);
                }
            });
        }

        function graficarModosVibracion() {
            console.log("Graficando los modos de vibración.");
            var linea = [];

            $.ajax({
                type: "POST",
                url: "frmLayouts.aspx/getModosVibracion",
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    // captura los datos de la propiedad desde el archivo de resultados
                    var aData = msg.d;
                    var ejeY = [];
                    var lineas = [];

                    for (var i = 0; i < aData.length; i++) {
                        console.log("Dimension de vibración " + i + " " + aData[i].length)
                    }


                   var ctx = document.getElementById('chartModosVibracion').getContext("2d");

                   lineChartData = {}; //declare an object
                    lineChartData.labels = []; //add 'labels' element to object (X axis)
                    lineChartData.datasets = []; //add 'datasets' array element to object

                    for (line = 0; line < aData.length; line++) {
                        dataPoints = [];
                        lineChartData.datasets.push({}); //create a new line dataset
                        dataset = lineChartData.datasets[line]
                        dataset.fillColor = "rgba(0,0,0,0)";
                        dataset.strokeColor = "rgba(200,200,200,1)";
                        // Para lineas rectas 0
                        dataset.lineTension = 0;
                        dataset.backgroundColor = "rgba(75,192," + (line * 10) + ",0.4)";
                        dataset.fill = false,
                        dataset.data = []; //contains the 'Y; axis data
                        dataset.label = "Modo de vibración " + (line + 1);

                        for (x = 0; x < aData[0].length; x++) {
                            dataPoints.push({ x: parseFloat(aData[line][x]), y: parseFloat(x * 3) });
                        } //for x

                        lineChartData.datasets[line].data = dataPoints; //send new line data to dataset
                    } //for line

                    ctx = document.getElementById("chartModosVibracion").getContext("2d");



                    var scatterChart = new Chart(ctx, {
                        type: 'line',
                        data: lineChartData,
                        options: {
                            elements: {
                                rectangle: {
                                    borderWidth: 2,
                                    borderColor: 'rgba(20,50,125,0.5)',
                                }
                            },
                            legend: {
                                display: true,
                            },

                            scaleFontColor: "#FF5972",
                            lineTension: 10,
                            scales: {
                                xAxes: [{
                                    type: 'linear',
                                    id: 'Tiempo',
                                    position: 'bottom',
                                    scaleLabel: {
                                        display: true,
                                        labelString: 'Desplazamiento (m)'
                                    },
                                    ticks: {
                                        beginAtZero: true
                                    }
                                }],
                                yAxes: [{
                                    scaleLabel: {
                                        display: true,
                                        labelString: 'Altura de piso (m)',
                                        stacked: true
                                    },
                                    ticks: {
                                        beginAtZero: true
                                    }
                                }]

                            }
                        }
                    });

                    //*************************************************************************





                }
            });
        }

        function getMaxPropiedad(ctrlPropiedad, ctrlGradoLibertad) {
            var data_Propiedad = obtenerSimboloPropiedad($("#" + ctrlPropiedad).val());
            var data_GradoLibertad = $("#" + ctrlGradoLibertad).val();

            console.log("Obteniendo la propiedad máxima de  " + data_Propiedad);

            var actionData = "{'propiedad': '" + data_Propiedad + "', 'gradoLibertad': '" + data_GradoLibertad + "'}";

            $.ajax({
                type: "POST",
                url: "frmLayouts.aspx/getMaxPropiedad",
                data: actionData,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    // captura los datos de la propiedad desde el archivo de resultados
                    var aData = msg.d;

                    console.log("Valor máximo " + aData);
                    $("#tbMaxPropiedad").val(aData);

                }
            });


        }

        function obtenerSimboloPropiedad(txtPropiedad) {
            console.log("Propiedad a buscar: " + txtPropiedad);

            // lista de propiedades
            var propiedades = [];
            var significadoPropiedades = [];

            // siglas de propiedades                                               
            //                                              Ctte.
            propiedades[0] = ['u', 'up', 'upp', 'Ek', 'Es', 'Ei', 'Fs', 'Un1'];
            propiedades[1] = ['u', 'up', 'upp', 'Ek', 'Es', 'Ei', 'Ed', 'Fs', 'Fd', 'Ft', 'Un1'];
            propiedades[2] = ['Un1'];
            propiedades[3] = ['Un1'];

            significadoPropiedades[0] = ['Desplazamiento u(t)', 'Velocidad ů(t)', 'Aceleración ü(t)', 'E. Cinética Ek(t)', 'E. Potencial Es(t)', 'E. Total EI(t)', 'Fuerza Elástica fs', 'Desplazamiento Nodal Total u(t)'];
            significadoPropiedades[1] = ['Desplazamiento u(t)', 'Velocidad ů(t)', 'Aceleración ü(t)', 'E. Cinética Ek(t)', 'E. Potencial Es(t)', 'E. Total EI(t)', 'Energía de Disipación ED(t)', 'Fuerza Elástica', 'Fuerza Externa', 'Fuerza Total', 'Desplazamiento Nodal Total u(t)'];
            significadoPropiedades[2] = ['Desplazamiento Nodal Total u(t)'];
            significadoPropiedades[3] = ['Desplazamiento Nodal Total u(t)'];


            // obtiene el tipo de analísis modal
            var categoria = $('#<%= rbCategoria.ClientID %> input:checked').val() - 3;
            console.log("Categoria " + categoria);
            var posicionPropiedad = -1;
            for (var i = 0; i < significadoPropiedades[categoria].length; i++) {
                if (significadoPropiedades[categoria][i] == txtPropiedad) {
                    posicionPropiedad = i;
                }
            }

            console.log("Posicion de la propiedad " + posicionPropiedad);
            return propiedades[categoria][posicionPropiedad];
        }

        function graficarResultados(){
            graficarPropiedad('chartPrimerGrafico', 'propiedad', 'gradoLibertad');
            graficarPropiedad('chartSegundoGrafico', 'propiedadSegundoGrafico', 'gradoLibertadSegundoGrafico');
            graficarPropiedad('chartTercerGrafico', 'propiedadTercerGrafico', 'gradoLibertadTercerGrafico');
            graficarPropiedad('chartCuartoGrafico', 'propiedadCuartoGrafico', 'gradoLibertadCuartoGrafico');
        }


        var primerChart = null;
        var segundoChart = null;
        var tercerChart = null;
        var cuartoChart = null;
        function graficarPropiedad(idControl, ctrlPropiedad, ctrlGradoLibertad) {
            console.log(idControl);
            console.log("Propiedad " + ctrlPropiedad);

            var nombrePropiedad = $("#" + ctrlPropiedad).val();

            var data_Propiedad = obtenerSimboloPropiedad(nombrePropiedad);
            var data_GradoLibertad = $("#" + ctrlGradoLibertad).val();

            console.log("Obteniendo la propiedad " + data_Propiedad);


           

            var actionData = "{'propiedad': '" + data_Propiedad + "', 'gradoLibertad': '" + data_GradoLibertad + "'}";

            //console.log(jsonData);


            $.ajax({
                type: "POST",
                url: "frmLayouts.aspx/getTiempoAndPropiedad",
                data: actionData,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    // captura los datos de la propiedad desde el archivo de resultados
                    var aData = msg.d;


                    var aLabels = aData[0];
                    var aDatasets = aData[1];

                    console.log(aDatasets[0]);

                    var dataPoints = [];
                    for (var i = 0; i <= aData[0].length - 1; i++) {
                        dataPoints.push({ x: parseFloat(aData[0][i]), y: parseFloat(aData[1][i]) });
                    }

                    var puntos = {
                        datasets: [{
                            label: nombrePropiedad + ' vs Tiempo',
                            fillColor: "rgba(151,249,190,0.5)",
                            strokeColor: "rgba(255,255,255,1)",
                            pointColor: "rgba(220,220,220,1)",
                            pointStrokeColor: "#fff",
                            pointRadius: 0.1,
                            lineTension: 0,
                            fill: false,
                            data: dataPoints
                        }]
                    }

                    Chart.defaults.global.tooltipFillColor = "rgba(0,160,0,0.8)";
                    Chart.defaults.global.scaleLineColor = "black";

                    
                    var ctx = document.getElementById(idControl).getContext("2d");
                    ctx.canvas.height = 300;  // setting height of canvas
                    ctx.canvas.width = 500; // setting width of canvas
                    
                    
                    if (idControl == "chartPrimerGrafico") {
                        console.log("Accediendo al control del primer gráfico.");
                        if (primerChart != null) {
                            console.log("Eliminando datos del primer gráfico");
                            primerChart.destroy();
                        }

                        primerChart = new Chart(ctx, {
                        type: 'line',
                        data: puntos,
                        options: {
                            scales: {
                                xAxes: [{
                                    type: 'linear',
                                    id: 'Tiempo',
                                    position: 'bottom',
                                    scaleLabel: {
                                        display: true,
                                        labelString: 'Tiempo (s)'
                                    }
                                }],
                                yAxes: [{
                                    scaleLabel: {
                                        display: true,
                                        labelString: $("#" + ctrlPropiedad).val()
                                    }
                                }]

                            }
                        }
                    });

                    } else if (idControl == "chartSegundoGrafico") {
                        if (segundoChart != null) {
                            console.log("Eliminando datos del segundo gráfico");
                            segundoChart.destroy();
                        }

                        segundoChart = new Chart(ctx, {
                        type: 'line',
                        data: puntos,
                        options: {
                            scales: {
                                xAxes: [{
                                    type: 'linear',
                                    id: 'Tiempo',
                                    position: 'bottom',
                                    scaleLabel: {
                                        display: true,
                                        labelString: 'Tiempo (s)'
                                    }
                                }],
                                yAxes: [{
                                    scaleLabel: {
                                        display: true,
                                        labelString: $("#" + ctrlPropiedad).val()
                                    }
                                }]

                            }
                        }
                    });
                    } else if (idControl == "chartTercerGrafico") {
                        if (tercerChart != null) {
                            console.log("Eliminando datos del tercer gráfico");
                            tercerChart.destroy();
                        }

                        tercerChart = new Chart(ctx, {
                        type: 'line',
                        data: puntos,
                        options: {
                            scales: {
                                xAxes: [{
                                    type: 'linear',
                                    id: 'Tiempo',
                                    position: 'bottom',
                                    scaleLabel: {
                                        display: true,
                                        labelString: 'Tiempo (s)'
                                    }
                                }],
                                yAxes: [{
                                    scaleLabel: {
                                        display: true,
                                        labelString: $("#" + ctrlPropiedad).val()
                                    }
                                }]

                            }
                        }
                    });
                    } else {
                        if (cuartoChart != null) {
                            console.log("Eliminando datos del cuarto gráfico");
                            cuartoChart.destroy();
                        }

                        cuartoChart = new Chart(ctx, {
                        type: 'line',
                        data: puntos,
                        options: {
                            scales: {
                                xAxes: [{
                                    type: 'linear',
                                    id: 'Tiempo',
                                    position: 'bottom',
                                    scaleLabel: {
                                        display: true,
                                        labelString: 'Tiempo (s)'
                                    }
                                }],
                                yAxes: [{
                                    scaleLabel: {
                                        display: true,
                                        labelString: $("#" + ctrlPropiedad).val()
                                    }
                                }]

                            }
                        }
                    });
                    }

                }
            });


        }

        // establece los valores de las propiedades y grado de libertad
        function asignarPropiedadControles(ctrlPropiedad, ctrlGradoLibertad) {
            // tipos de análisis modal
            var VIBRACION_LIBRE_NO_AMORTIGUADA = 3;
            var VIBRACION_LIBRE_AMORTIGUADA = 4;
            var VIBRACION_ARMONICA_NO_AMORTIGUADA = 5;
            var VIBRACION_ARMONICA_AMORTIGUADA = 6;


            var significadoPropiedades = [];



            significadoPropiedades[0] = ['Desplazamiento u(t)', 'Velocidad ů(t)', 'Aceleración ü(t)', 'E. Cinética Ek(t)', 'E. Potencial Es(t)', 'E. Total EI(t)', 'Fuerza Elástica fs', 'Desplazamiento Nodal Total u(t)'];
            significadoPropiedades[1] = ['Desplazamiento u(t)', 'Velocidad ů(t)', 'Aceleración ü(t)', 'E. Cinética Ek(t)', 'E. Potencial Es(t)', 'E. Total EI(t)', 'Energía de Disipación ED(t)', 'Fuerza Elástica', 'Fuerza Externa', 'Fuerza Total', 'Desplazamiento Nodal Total u(t)'];
            significadoPropiedades[2] = ['Desplazamiento Nodal Total u(t)'];
            significadoPropiedades[3] = ['Desplazamiento Nodal Total u(t)'];

            /*
            significadoPropiedades[0] = ['Desplazamiento (mm)', 'Velocidad (m/s)', 'Aceleración (m/s^2)', 'E. Cinética (tonf x m)', 'E. Potencial (tonf x m)', 'E. Total (tonf x m)', 'Fuerza Elástica (tonf)', 'Desplazamiento Nodal Total (m)'];
            significadoPropiedades[1] = ['Desplazamiento (mm)', 'Velocidad (m/s)', 'Aceleración (m/s^2)', 'E. Cinética (tonf x m)', 'E. Potencial (tonf x m)', 'E. Total (tonf x m)', 'Energía de Disipación (tonf x m)', 'Fuerza Elástica (tonf)', 'Fuerza Externa (tonf)', 'Fuerza Total (tonf)', 'Desplazamiento Nodal Total (m)'];
            significadoPropiedades[2] = ['Desplazamiento Nodal Total (m)'];
            significadoPropiedades[3] = ['Desplazamiento Nodal Total (m)'];
            */

            var ctrlNroPisos = document.getElementById('ddlNCL');
            var nroPisos = Number(ctrlNroPisos.value);
            var select = document.getElementById(ctrlGradoLibertad);

            // se agregan los grados de libertad
            $('#' + ctrlGradoLibertad).empty();
            for (var i = nroPisos; i >= 1; --i) {
                var option = document.createElement('option');
                option.text = option.value = i;
                select.add(option, 0);
            }

            select.selectedIndex = 0;

            // se agrega las propiedades
            console.log(significadoPropiedades[0].length);

            // obtiene el tipo de analísis modal
            var categoria = $('#<%= rbCategoria.ClientID %> input:checked').val();

            // se agregan las propiedades a la lista de "propiedades"
            if (categoria == VIBRACION_LIBRE_NO_AMORTIGUADA) {
                agregarPropiedades(significadoPropiedades[0], ctrlPropiedad);
            } else if (categoria == VIBRACION_LIBRE_AMORTIGUADA) {
                agregarPropiedades(significadoPropiedades[1], ctrlPropiedad);
            } else if (categoria == VIBRACION_ARMONICA_NO_AMORTIGUADA) {
                agregarPropiedades(significadoPropiedades[2], ctrlPropiedad);
            } else if (categoria == VIBRACION_ARMONICA_AMORTIGUADA) {
                agregarPropiedades(significadoPropiedades[3], ctrlPropiedad);
            }
        }

        function agregarPropiedades(arreglo, ctrlPropiedad) {
            $('#' + ctrlPropiedad).empty();

            var select = document.getElementById(ctrlPropiedad);
            var long_arreglo = arreglo.length;
            for (var i = long_arreglo - 1; i >= 0; --i) {
                var option = document.createElement('option');
                option.text = arreglo[i];
                select.add(option, 0);
            }

            select.selectedIndex = 0;

        }


        function loadConfiguracionCtrlsGraficos() {
            asignarPropiedadControles("propiedad", "gradoLibertad");
            asignarPropiedadControles("propiedadSegundoGrafico", "gradoLibertadSegundoGrafico");
            asignarPropiedadControles("propiedadTercerGrafico", "gradoLibertadTercerGrafico");
            asignarPropiedadControles("propiedadCuartoGrafico", "gradoLibertadCuartoGrafico");
            asignarPropiedadControles("propiedadMax", "gradoLibertadMax");
        }


        function HideCtrlsInput(ddlId) {
            var NUM_FIL = 30;
            var NUM_COL = 7;
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
                    //document.getElementById("tbH" + String(i)).disabled = false;
                    fila.style.display = '';
                } else {
                    document.getElementById("tbK" + String(i)).disabled = true;
                    document.getElementById("tbM" + String(i)).disabled = true;
                    document.getElementById("tbU" + String(i)).disabled = true;
                    document.getElementById("tbI" + String(i)).disabled = true;
                    //document.getElementById("tbH" + String(i)).disabled = true;
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
   



</head>
<body onload="HideCtrlsInput('ddlNCL');">
    <form id="form1" runat="server">
         <nav class="navbar navbar-inverse">
          <div class="container-fluid">
            <div class="navbar-header">
              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-2">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
              
                <p class="navbar-brand">VLNA - Análisis Modal</p>
            </div>

            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-2">
              
              
              <ul class="nav navbar-nav navbar-right">
                <li><a href="#">Ayuda</a></li>
              </ul>
            </div>
          </div>
        </nav>
        
        
        
        
        <div class="container-fluid">
         
          <p>Descripción: Análisis Modal.
          <br/>Autor: Jhandry Moreno
          <br/>Información: VLNA.pdf</p>
               
        </div> <!— /container —>

        
        <%--<div class="container-fluid">
            
            <div class="col-md-3">
                <div class="panel panel-success">
                    <div class="panel-heading">ENTRADA</div>
                    <div class="panel-body">

                    </div>
                </div>
            </div>
            

            
            <div class="col-md-9">
                <div class="panel panel-default">
                    <div class="panel-heading">RESULTADOS</div>
                    <div class="panel-body">

                    </div>
                </div>
            </div>
        </div>--%>



        

        <div class="container-fluid">
            
            <%--INPUT--%>
            <div class="row equal-height-panels">
                <div class="col-md-3">
                    <div class="panel panel-default">

                        <div class="panel-heading">Análisis Modal</div>
                        <div class="panel-body fixed-panel">
                            <asp:RadioButtonList ID="rbCategoria" runat="server" CssClass="radio input-xs" onclick="loadConfiguracionCtrlsGraficos();">
                                <asp:ListItem class="radio-inline" Value="3" Selected="True">Vibración libre no amortiguada</asp:ListItem>
                                <asp:ListItem class="radio-inline" Value="4">Vibración libre amortiguada</asp:ListItem>
                                <asp:ListItem class="radio-inline" Value="5">Vibración armónica no amortiguada</asp:ListItem>
                                <asp:ListItem class="radio-inline" Value="6">Vibración armónica amortiguada</asp:ListItem>

                            </asp:RadioButtonList>

                        </div>


                    </div>
                </div>
                <div class="col-md-3">
                    <div class="panel panel-default">

                        <div class="panel-heading">Datos iniciales</div>
                        <div class="panel-body fixed-panel">
                            <form class="form-inline" role="form">

                                <div class="form-group">
                                    <h6><asp:Label for="inputdefault" ID="lblNCL" runat="server" Text="Grados de Libertad" class="col-md-6 control-label "></asp:Label></h6>
                                    <div class="col-md-6">
                                        <asp:DropDownList ID="ddlNCL" runat="server" CssClass="form-control input-xs" onclick="loadConfiguracionCtrlsGraficos();">
                                            <%--<asp:ListItem Value="GDL">Grados de Libertad</asp:ListItem>--%>
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
                                    <h6><asp:Label ID="lblTO" runat="server" Text="Tiempo inicial (s)" class="col-md-6 control-label"></asp:Label></h6>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="tbTO" runat="server" CssClass="form-control input-xs" placeholder="Tiempo inicial (s)"></asp:TextBox>
                                    </div>
                                </div>
                                <br />
                                <div class="form-group">
                                    <h6><asp:Label ID="lblTF" runat="server" Text="Tiempo final (s)" class="col-md-6 control-label"></asp:Label></h6>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="tbTF" runat="server" CssClass="form-control input-xs" placeholder="Tiempo final (s)"></asp:TextBox>
                                    </div>
                                </div>
                                <br />
                                <div class="form-group">
                                    <h6><asp:Label ID="lblPA" runat="server" Text="Incremento de tiempo" class="col-md-6 control-label"></asp:Label></h6>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="tbPA" runat="server" CssClass="form-control input-xs" placeholder="Incremento de tiempo"></asp:TextBox>
                                    </div>
                                </div>
                                



                                <div class="form-group">
                                    <br />
                                   <br />
                                    <div class="col-md-12">
                                        <button type="button" class=" btn btn-warning btn-xs" data-toggle="modal" data-target="#myModal" onclick="HideCtrlsInput('ddlNCL');">Establecer propiedades mecánicas</button>

                                        <asp:Button ID="btnRun" class=" btn btn-danger btn-xs" runat="server" Text="Ejecutar" OnClick="btnRun_Click" />
                                    </div>
                                </div>
                            </form>




                        </div>

                        

                    </div>
                </div>
                <div class="col-md-6">
                    <div class="panel panel-success">

                        <div class="panel-heading">Esquema</div>
                        <div class="panel-body fixed-panel">
                            <img src="../img/esquema/esquemaModal.PNG" class="img-responsive"/>

                        </div>

                        <table class="table">
                        </table>
                    </div>
                </div>
            </div>


            <%--RESULTADOS--%>
            <div class="row">
                <div class="col-md-4">
                    <%--Propiedades máximas--%>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="panel panel-default propiedadmax-height">
                                <div class="panel-heading">Propiedad máxima</div>
                                <div class="panel-body panel-height">
                                    <div class="form-group">
                                        <div class="col-md-2">
                                            <label class="label label-default">Propiedad</label>
                                        </div>
                                        <div class="col-md-5">
                                            <select id="propiedadMax" class="form-control input-xs" name="propiedad"></select>
                                        </div>
                                        <div class="col-md-3">
                                            <label class="label label-default">Grado de libertad</label>
                                        </div>
                                        <div class="col-md-2">
                                            <select id="gradoLibertadMax" class="form-control input-xs" name="gradoLibertad" onchange="getMaxPropiedad('propiedadMax', 'gradoLibertadMax');"></select>
                                        </div>
                                       
                                    </div>
                                    
                                    <br/>
                                    <div class="form-group">
                                        <div class="col-md-2">
                                            <input id="btnObtenerMaxPropiedad" class="btn btn-danger btn-xs" type="button" value="Obtener" onclick="getMaxPropiedad('propiedadMax', 'gradoLibertadMax');" />
                                        </div>

                                        

                                        <div class="col-md-4">
                                            <input class="form-control input-xs" id="tbMaxPropiedad" type="text" />
                                        </div>

                                        <%--<div class ="col-md-3">
                                            <label class="label label-default">Valor máximo</label>
                                            
                                        </div>--%>
                                    </div>
    
                                </div>
                            </div>





                        </div>
                    </div>
                    <%--Modos de vibración--%>
                    <div class="row">
                        <div class="col-md-12">


                            <div class="panel panel-default">

                                <div class="panel-heading">Modos de Vibración</div>
                                <div class="panel-body panel-height">
                                    <div class="form-group">
                                        <input class="btn btn-danger btn-xs" id="btnTrazarQuintoGrafico" type="button" value="Graficar" onclick="graficarModosVibracion();" />
                                    </div>
                                    
                                    <canvas id="chartModosVibracion" />
                                </div>

                                <%--<table class="table">
                        </table>--%>
                            </div>






                        </div>
                    </div>
                </div>

                <%--Gráficos--%>
                <div class="col-md-8">


                    <div class="row">

                        <div class="col-md-6">
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <div class="form-group">
                                        <div class="col-md-2">
                                            <label class="label label-default">Propiedad</label>
                                        </div>
                                        <div class="col-md-3">
                                            <select id="propiedad" name="propiedad" class="form-control input-xs"></select>
                                        </div>
                                        <div class="col-md-3">
                                            <label class="label label-default">Grado de libertad</label>
                                        </div>
                                        <div class="col-md-2">
                                            <select id="gradoLibertad" name="gradoLibertad" class="form-control input-xs" onchange="graficarPropiedad('chartPrimerGrafico', 'propiedad', 'gradoLibertad');"></select>
                                        </div>
                                        <div class="col-md-2">
                                            <input id="btnTrazarPrimerGrafico" class="btn btn-danger btn-xs" type="button" value="Graficar" onclick="graficarPropiedad('chartPrimerGrafico', 'propiedad', 'gradoLibertad');" />
                                        </div>
                                    </div>
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    <canvas id="chartPrimerGrafico" width="500" height="300"/>



                                </div>
                            </div>


                        </div>
                        <div class="col-md-6">
                            <div class="panel panel-default">
                                <div class="panel-body">
                                     <div class="form-group">
                                        <div class="col-md-2">
                                            <label class="label label-default">Propiedad</label>
                                        </div>
                                        <div class="col-md-3">
                                            <select id="propiedadSegundoGrafico" name="propiedad" class="form-control input-xs"></select>
                                        </div>
                                        <div class="col-md-3">
                                            <label class="label label-default">Grado de libertad</label>
                                        </div>
                                        <div class="col-md-2">
                                            <select id="gradoLibertadSegundoGrafico" name="gradoLibertad" class="form-control input-xs" onchange="graficarPropiedad('chartSegundoGrafico', 'propiedadSegundoGrafico', 'gradoLibertadSegundoGrafico');"></select>
                                        </div>
                                        <div class="col-md-2">
                                            <input id="btnTrazarSegundoGrafico" class="btn btn-danger btn-xs" type="button" value="Graficar" onclick="graficarPropiedad('chartSegundoGrafico', 'propiedadSegundoGrafico', 'gradoLibertadSegundoGrafico');" />
                                        </div>
                                    </div>
                                    
                                   
                                    
                                    
                                    <canvas id="chartSegundoGrafico" width="500" height="300"/>

                                </div>
                            </div>


                        </div>

                    </div>
                    <div class="row">

                        <div class="col-md-6">
                            <div class="panel panel-default">
                                <div class="panel-body">
                                     <div class="form-group">
                                        <div class="col-md-2">
                                            <label class="label label-default">Propiedad</label>
                                        </div>
                                        <div class="col-md-3">
                                            <select id="propiedadTercerGrafico" name="propiedad" class="form-control input-xs"></select>
                                        </div>
                                        <div class="col-md-3">
                                            <label class="label label-default">Grado de libertad</label>
                                        </div>
                                        <div class="col-md-2">
                                            <select id="gradoLibertadTercerGrafico" name="gradoLibertad" class="form-control input-xs"  onchange="graficarPropiedad('chartTercerGrafico', 'propiedadTercerGrafico', 'gradoLibertadTercerGrafico');"></select>
                                        </div>
                                        <div class="col-md-2">
                                            <input id="btnTrazarTercerGrafico" class="btn btn-danger btn-xs" type="button" value="Graficar" onclick="graficarPropiedad('chartTercerGrafico', 'propiedadTercerGrafico', 'gradoLibertadTercerGrafico');" />
                                        </div>
                                    </div>
                                    
                                    
                                    
                                   
                    
                                    
                                    <canvas id="chartTercerGrafico"  width="500" height="300"/>
                                </div>
                            </div>




                        </div>
                        <div class="col-md-6">

                            <div class="panel panel-default">
                                <div class="panel-body">
                                     <div class="form-group">
                                        <div class="col-md-2">
                                            <label class="label label-default">Propiedad</label>
                                        </div>
                                        <div class="col-md-3">
                                            <select id="propiedadCuartoGrafico" name="propiedad" class="form-control input-xs"></select>
                                        </div>
                                        <div class="col-md-3">
                                            <label class="label label-default">Grado de libertad</label>
                                        </div>
                                        <div class="col-md-2">
                                            <select id="gradoLibertadCuartoGrafico" name="gradoLibertad" class="form-control input-xs" onchange="graficarPropiedad('chartCuartoGrafico', 'propiedadCuartoGrafico', 'gradoLibertadCuartoGrafico');"></select>
                                        </div>
                                        <div class="col-md-2">
                                            <input id="btnTrazarCuartoGrafico" class="btn btn-danger btn-xs" type="button" value="Graficar" onclick="graficarPropiedad('chartCuartoGrafico', 'propiedadCuartoGrafico', 'gradoLibertadCuartoGrafico');" />
                                        </div>
                                    </div>


                        
                                    
                                    <canvas id="chartCuartoGrafico" width="500" height="300" />
                                </div>
                            </div>



                        </div>

                    </div>




                </div>
            </div>


            <!-- Modal -->
            <div id="myModal" class="modal fade" role="dialog">
                <div class="modal-dialog" id="mdialTamanio">

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
                                        <th><h6>Piso</h6></th>
                                        <th class="M"><h6>Masa (m)</h6></th>
                                        <th class="K"><h6>Rigidez (k)</h6></th>
                                        <th class="C"><h6>Amortiguamiento (c)</h6></th>
                                        <th class="U"><h6>Desp. inicial (u<sub>0</sub> )</h6></th>
                                        <th class="I"><h6>Vel. incial (ů<sub>0</sub>)</h6></th>
                                        <th class="F"><h6>Carga (P<sub>0</sub> )</h6></th>
                                        <th class="W"><h6>Frec. de mov. (ω)</h6></th>
                                        <%--<th class="H">A. piso</th>--%>
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
                                        <%--<td>
                                            <asp:TextBox ID="tbH1" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>--%>
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
                                        <%--<td>
                                            <asp:TextBox ID="tbH2" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>--%>
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
                                        <%--<td>
                                            <asp:TextBox ID="tbH3" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>--%>
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
                                        <%--<td>
                                            <asp:TextBox ID="tbH4" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>--%>
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
                                        <%--<td>
                                            <asp:TextBox ID="tbH5" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>--%>
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
                                        <%--<td>
                                            <asp:TextBox ID="tbH6" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>--%>
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
                                        <%--<td>
                                            <asp:TextBox ID="tbH7" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>--%>
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
                                        <%--<td>
                                            <asp:TextBox ID="tbH8" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>--%>
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
                                       <%-- <td>
                                            <asp:TextBox ID="tbH9" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>--%>
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
                                        <%--<td>
                                            <asp:TextBox ID="tbH10" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>--%>
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
                                        <%--<td>
                                            <asp:TextBox ID="tbH11" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>--%>
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
                                        <%--<td>
                                            <asp:TextBox ID="tbH12" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>--%>
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
                                        <%--<td>
                                            <asp:TextBox ID="tbH13" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>--%>
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
                                        <%--<td>
                                            <asp:TextBox ID="tbH14" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>--%>
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
                                        <%--<td>
                                            <asp:TextBox ID="tbH15" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>--%>
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
                                        <%--<td>
                                            <asp:TextBox ID="tbH16" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>--%>
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
                                       <%-- <td>
                                            <asp:TextBox ID="tbH17" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>--%>
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
                                        <%--<td>
                                            <asp:TextBox ID="tbH18" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>--%>
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
                                        <%--<td>
                                            <asp:TextBox ID="tbH19" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>--%>
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
                                        <%--<td>
                                            <asp:TextBox ID="tbH20" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>--%>
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
                                        <%--<td>
                                            <asp:TextBox ID="tbH21" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>--%>
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
                                        <%--<td>
                                            <asp:TextBox ID="tbH22" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>--%>
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
                                        <%--<td>
                                            <asp:TextBox ID="tbH23" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>--%>
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
                                        <%--<td>
                                            <asp:TextBox ID="tbH24" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>--%>
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
                                        <%--<td>
                                            <asp:TextBox ID="tbH25" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>--%>
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
                                        <%--<td>
                                            <asp:TextBox ID="tbH26" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>--%>
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
                                        <%--<td>
                                            <asp:TextBox ID="tbH27" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>--%>
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
                                        <%--<td>
                                            <asp:TextBox ID="tbH28" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>--%>
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
                                        <%--<td>
                                            <asp:TextBox ID="tbH29" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>--%>
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
                                       <%-- <td>
                                            <asp:TextBox ID="tbH30" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>--%>
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
