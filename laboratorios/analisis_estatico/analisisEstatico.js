

function generarInformeTXT(msg) {
    // captura los datos del archivo de resultados
    var aData = msg.d;

    console.log("Imprimiendo resultado para el usuario.");
    console.log(aData[0]);

    var blob = new Blob([aData[0]], { type: "text/plain;charset=utf-8" });
    saveAs(blob, "ResultadosAnalisisEstatico.txt");
}

function graficarResultados(msg) {
    console.log("Obteniendo resultados");
    var alturaChart = 198;
    var anchoChart = 500;



    // captura los datos de la propiedad desde el archivo de resultados
    var aData = msg.d;

    $("#spMin").html("<b>" + aData[0] + "</b> " + "KN");
    $("#spTo").html("<b>" + aData[1] + "</b> " + "KN");
    $("#spTf").html("<b>" + aData[2] + "</b> " + "KN");
    $("#spTmax").html("<b>" + aData[3] + "</b> " + "KN");
    $("#spTten").html("<b>" + aData[4] + "</b> " + "KN");
    $("#spNten").html("<b>" + aData[5] + "</b> " + "#");
    $("#spS").html("<b>" + aData[6] + "</b> " + "m");
    $("#spLo").html("<b>" + aData[7] + "</b> " + "m");
    $("#spLf").html("<b>" + aData[8] + "</b> " + "m");
    $("#spDTo").html("<b>" + aData[9] + "</b> " + "m");
    $("#spDTf").html("<b>" + aData[10] + "</b> " + "m");

    console.log(aData[12].length);

    // dataset para el útlimo gráfico
    lineAllChartData = {}; //declare an object
    lineAllChartData.labels = []; //add 'labels' element to object (X axis)
    lineAllChartData.datasets = [];
    contLineas = 0;

    // grafica el cable
    var dataPoints = [];
    for (var i = 0; i <= aData[11].length - 1; i++) {
        //console.log("x: " + aData[10][i] + ", y: " + aData[11][i] + "\n");
        dataPoints.push({ x: parseFloat(aData[11][i]), y: parseFloat(aData[12][i]) });

    }

    // linea para la última gráfica
    lineAllChartData.datasets.push({});
    dataset = lineAllChartData.datasets[contLineas];
    dataset.fill = false;
    dataset.lineTension = 0.2;
    dataset.pointRadius = 0;
    dataset.borderColor = "rgb(062, 095, 138)";
    lineAllChartData.datasets[contLineas].data = dataPoints;
    contLineas++;

    var puntosCable = {
        datasets: [{
            label: 'Cable',
            fillColor: "rgba(151,249,190,0.5)",
            strokeColor: "rgba(255,255,255,1)",
            pointColor: "rgba(220,220,220,1)",
            borderColor: "rgb(062, 095, 138)",
            pointStrokeColor: "#fff",
            pointRadius: 0,
            lineTension: 0,
            fill: false,
            data: dataPoints
        }]
    }

    var ctxCable = document.getElementById('chartCable').getContext("2d");
    ctxCable.canvas.height = alturaChart;  // setting height of canvas
    ctxCable.canvas.width = anchoChart; // setting width of canvas

    var chartCable = new Chart(ctxCable, {
        type: 'line',
        data: puntosCable,
        options: {
            legend: {
                display: false,
                position: 'bottom'
            },
            scales: {
                xAxes: [{
                    display: true,
                    type: 'linear',
                    id: 'Tiempo',
                    position: 'bottom',
                    scaleLabel: {
                        display: false,
                        labelString: 'x'
                    }
                }],
                yAxes: [{
                    display: true,
                    scaleLabel: {
                        display: false,
                        labelString: 'y'
                    }
                }]

            }
        }
    });


    // grafica de tensores
    lineChartData = {}; //declare an object
    lineChartData.labels = []; //add 'labels' element to object (X axis)
    lineChartData.datasets = []; //add 'datasets' array element to object



    var numLineas = aData[13].length;
    console.log('Núm. de líneas: ' + numLineas);

    for (line = 0; line < numLineas; line++) {
        dataPoints = [];
        lineChartData.datasets.push({}); //create a new line dataset
        dataset = lineChartData.datasets[line];
        dataset.fillColor = "rgba(0,0,0,0)";
        dataset.strokeColor = "rgba(200,200,200,1)";
        // Para lineas rectas 0
        dataset.lineTension = 0;
        dataset.backgroundColor = "rgba(75,192," + (line * 10) + ",0.4)";
        dataset.fill = false,
        dataset.data = []; //contains the 'Y; axis data
        dataset.label = "Tensor " + (line + 1);


        // tensores para el último gráfico
        lineAllChartData.datasets.push({});
        datasetAll = lineAllChartData.datasets[contLineas];
        datasetAll.fillColor = "rgba(0,0,0,0)";
        datasetAll.strokeColor = "rgba(200,200,200,1)";
        datasetAll.label = "Tensor " + (line + 1);



        //console.log("(" + aData[13][line] + ", " + aData[14][line] + "), " + "(" + aData[13][line] + ", " + (-3) + ")");

        dataPoints.push({ x: parseFloat(aData[15][line]), y: parseFloat(aData[13][line]) });
        dataPoints.push({ x: parseFloat(aData[15][line]), y: parseFloat(aData[14][line])});

        lineChartData.datasets[line].data = dataPoints;
        lineAllChartData.datasets[contLineas].data = dataPoints;
        contLineas++;
    }

    var ctxTensor = document.getElementById("chartTensor").getContext("2d");
    ctxTensor.canvas.height = alturaChart;  // setting height of canvas
    ctxTensor.canvas.width = anchoChart; // setting width of canvas


    var chartTensor = new Chart(ctxTensor, {
        type: 'line',
        data: lineChartData,
        options: {
            legend: {
                display: false,
                position: 'bottom'
            },
            elements: {
                rectangle: {
                    borderWidth: 2,
                    borderColor: 'rgba(20,50,125,0.5)',
                }
            },

            scaleFontColor: "#FF5972",
            lineTension: 0,
            scales: {
                xAxes: [{
                    display: true,
                    type: 'linear',
                    id: 'Tiempo',
                    position: 'bottom',
                    scaleLabel: {
                        display: false,
                        labelString: 'x'
                    },
                    ticks: {
                        beginAtZero: true
                    }
                }],
                yAxes: [{
                    display: true,
                    scaleLabel: {
                        display: false,
                        labelString: 'y',
                        stacked: true
                    },
                    ticks: {
                        beginAtZero: true
                    }
                }]

            }
        }
    });

    // gráfica de carga
    var dataPoints = [];
    for (var i = 0; i <= aData[16].length - 1; i++) {
        console.log("x: " + aData[16][i] + ", y: " + aData[17][i] + "\n");
        dataPoints.push({ x: parseFloat(aData[16][i]), y: parseFloat(aData[17][i]) });
    }


    // carga para la última gráfica
    lineAllChartData.datasets.push({});
    dataset = lineAllChartData.datasets[contLineas];
    dataset.fill = true;
    dataset.lineTension = 0;
    dataset.pointRadius = 0;
    dataset.backgroundColor = "rgb(255, 0, 0)";
    lineAllChartData.datasets[contLineas].data = dataPoints;


    var puntosCarga = {
        datasets: [{
            label: 'Carga',
            fillColor: "rgba(151,249,190,0.5)",
            strokeColor: "rgba(255,255,255,1)",
            pointColor: "rgba(220,220,220,1)",
            pointStrokeColor: "#fff",
            backgroundColor: "rgb(255, 0, 0)",
            pointRadius: 0.1,
            lineTension: 0,
            fill: true,
            data: dataPoints
        }]
    }

    var ctxCarga = document.getElementById('chartCarga').getContext("2d");
    ctxCarga.canvas.height = alturaChart;  // setting height of canvas
    ctxCarga.canvas.width = anchoChart; // setting width of canvas

    var chartCarga = new Chart(ctxCarga, {
        type: 'line',
        data: puntosCarga,
        options: {
            legend: {
                display: false,
                position: 'bottom'
            },
            scales: {
                xAxes: [{
                    display: false,
                    type: 'linear',
                    id: 'Tiempo',
                    position: 'bottom',
                    scaleLabel: {
                        display: false,
                        labelString: 'x'
                    }
                }],
                yAxes: [{
                    display: false,
                    scaleLabel: {
                        display: false,
                        labelString: 'y'
                    }
                }]

            }
        }
    });

    // Cable - tensores - carga
    var ctxCableTensorCarga = document.getElementById('chartCableTensoresCarga').getContext("2d");
    ctxCableTensorCarga.canvas.height = alturaChart;  // setting height of canvas
    ctxCableTensorCarga.canvas.width = anchoChart; // setting width of canvas



    var chartCableTensorCarga = new Chart(ctxCableTensorCarga, {
        type: 'line',
        data: lineAllChartData,
        options: {
            legend: {
                display: false,
                position: 'bottom'
            },
            lineTension: 0,
            scales: {
                xAxes: [{
                    display: true,
                    type: 'linear',
                    id: 'Tiempo',
                    position: 'bottom',
                    scaleLabel: {
                        display: false,
                        labelString: 'x'
                    }
                }],
                yAxes: [{
                    display: true,
                    scaleLabel: {
                        display: false,
                        labelString: 'y'
                    }
                }]

            }
        }
    });

            

           
}

function ejecutarModelo() {
    console.log("Procesando modelo...");

    // datos de entrada para el modelo
    var categoria = $('#rbCategoria input:checked').val();
    strInput = $("#tbL").val() + "\n" + $("#tbWo").val() + "\n" + $("#tbDT").val();
    if (categoria == 3) {
        strInput = categoria + "\n" + $("#tbH").val() + "\n" + strInput;
    } else {
        strInput = categoria + "\n" + $("#tbHo").val() + "\n" + $("#tbHF").val() + "\n" + strInput;
    }

    console.log("Datos del archivo de entrada: " + strInput);

    var actionData = "{'value': '" + strInput + "'}";

    // abre ventana modal de espera
    waitingDialog.show('Procesando modelo.', { dialogSize: 'sm', progressType: 'warning' });

    // envio de datos al servidor
    $.ajax({
        type: "POST",
        url: "index.aspx/procesarModelo",
        data: actionData,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (msg) {

            graficarResultados(msg);

            // cierra ventana modal de espera
            waitingDialog.hide();
        }
    });
}

$(document).ready(function () {

    $('#btnEjemplo').click(function () {
        console.log("Cargando ejemplo.");
        $('#rbCategoria input:checked').val(1);
        $('#tbHo').val(3);
        $("#tbHF").val(4.5);
        $("#tbL").val(7.5);
        $("#tbWo").val(8.76);
        $("#tbDT").val(0.5);

    });
    
    $('#formAnalisiEstatico').submit(function (event) {
        if (this.checkValidity()) {
            event.preventDefault();

            console.log("Ejecutando el código");

            ejecutarModelo();
        }
    });


    // descargar archivo de resultados
    $("#btnDecargarResultados").click(function () {
        console.log("Descargando archivo de resultados... ");
        //$.fileDownload('model_matlab/output.txt')
        //    .done(function () { alert('File download a success!'); })
        //    .fail(function () { alert('File download failed!'); }); 

        $.ajax({
            type: "POST",
            url: "index.aspx/getInforme",
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (msg) {

                generarInformeTXT(msg);

            }
        });


    });


    // métodos para descargar gráficas
    $("#save-cable").click(function () {
        $("#chartCable").get(0).toBlob(function (blob) {
            saveAs(blob, "cable.png");
        });
    });

    $("#save-tensor").click(function () {
        $("#chartTensor").get(0).toBlob(function (blob) {
            saveAs(blob, "tensor.png");
        });
    });

    $("#save-carga").click(function () {
        $("#chartCarga").get(0).toBlob(function (blob) {
            saveAs(blob, "carga.png");
        });
    });

    $("#save-all").click(function () {
        $("#chartCableTensoresCarga").get(0).toBlob(function (blob) {
            saveAs(blob, "CableTensorCarga.png");
        });
    });

    // control de los datos de entrada
    $('#H').hide("fast");
    $("#rbCategoria").click(function (event) {
        console.log("Ocultando elementos.");
        // obtiene el tipo de analísis modal
        var categoria = $('#rbCategoria input:checked').val();
        
        if (categoria == 3) {
            $('#Ho').hide("fast");
            $('#HF').hide("fast");
            $('#H').show("fast");

            // agrega la validación a la tercera entrada
           document.getElementById("tbH").required = true;

            // quita la validación de las dos primeras entradas
            //$('tbHo').attr('required', false);
            //$('tbHF').attr('required', false);
           document.getElementById("tbHo").required = false;
           document.getElementById("tbHF").required = false;
            
        } else {
            $('#Ho').show("fast");
            $('#HF').show("fast");
            $('#H').hide("fast");

            // quita la validación a la tercera entrada
            document.getElementById("tbH").required = false;

            // agrega la validación de las dos primeras entradas
            document.getElementById("tbHo").required = true;
            document.getElementById("tbHF").required = true;
            
        }
    });


});