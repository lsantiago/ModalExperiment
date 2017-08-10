var OPCION_FLECHA = 1;
var RUTA_ESQUEMA_FLECHA = "../../img/esquema/esquemaCatenariaFlecha.png";
var RUTA_ESQUEMA_LONGITUD = "../../img/esquema/esquemaCatenariaLongitud.png";
var COLOR_ROJO = "rgb(255, 0, 0)";
var COLOR_AZUL = "rgb(062, 095, 138)";
var COLOR_NEGRO = "rgb(0, 0, 0)";
var LINEA_GRUESA = 2;
var LINEA_FINA = 0.7;
var SEPARACION_CABLE_DEFORMADA = 0.5;
var SEPARACION_DEFORMADA = 3;


var datasetDeformada = [];
function mostrarResultados(msg) {
    console.log("Desplegando resultados.. ");
    var alturaChart = 198;
    var anchoChart = 500;

    // captura los datos de resultados
    var datos = msg.d;


    // datos para gráficas
    var datosCable = [];
    var datosDeformada = [];
    var datosDeformadaCableContiguo = [];
    var datosDeformadaInferior = [];


    // datos de entrada para el modelo
    var categoria = $('#rbCategoria input:checked').val();

    if (categoria == OPCION_FLECHA) {
        $("#spVano").html("<b>" + datos[0] + "</b> " + "m");
        $("#spLo").html("<b>" + datos[1] + "</b> " + "m");
        $("#spLf").html("<b>" + datos[2] + "</b> " + "m");

        $("#spYo").html("<b>" + datos[3] + "</b> " + "m");
        $("#spYf").html("<b>" + datos[4] + "</b> " + "m");

        $("#spTo").html("<b>" + datos[5] + "</b> " + "N");
        $("#spTf").html("<b>" + datos[6] + "</b> " + "N");
        $("#spTmax").html("<b>" + datos[8] + "</b> " + "N");
        $("#spTmin").html("<b>" + datos[9] + "</b> " + "N");
        $("#spS").html("<b>" + datos[10] + "</b> " + "m");
        $("#spValEcuacion").html("<b>" + datos[11] + "</b> " + "#");
        $("#spTmaxCable").html("<b>" + datos[7] + "</b> " + "N");

        // datos wx, wy
        console.log("Datos de wx: " + datos[12]);
        console.log("Datos de wy: " + datos[13]);

        for (var i = 0; i < datos[12].length; i++) {
            datosCable.push({ x: parseFloat(datos[12][i]), y: parseFloat(datos[13][i]) });
        }

        console.log("Datos de cable..");
        console.table(datosCable);

        // datos 'x' y 'y' 
        for (var i = 0; i < datos[14].length; i++) {
            datosDeformada.push({ x: parseFloat(datos[14][i]), y: parseFloat(datos[15][i]) });
            datosDeformadaCableContiguo.push({ x: parseFloat(datos[14][i]), y: parseFloat(datos[15][i]) - SEPARACION_CABLE_DEFORMADA });
            datosDeformadaInferior.push({ x: parseFloat(datos[14][i]), y: parseFloat(datos[15][i]) - SEPARACION_DEFORMADA });
        }

        console.log("Datos de deformada..");
        console.table(datosDeformada);




    } else {
        $("#spYo").html("<b>" + datos[2] + "</b> " + "m");
        $("#spYf").html("<b>" + datos[3] + "</b> " + "m");

        $("#spResHo").html("<b>" + datos[4] + "</b> " + "m");
        $("#spRespHf").html("<b>" + datos[5] + "</b> " + "m");
        $("#spTo").html("<b>" + datos[6] + "</b> " + "N");
        $("#spTf").html("<b>" + datos[7] + "</b> " + "N");
        $("#spTmaxCable").html("<b>" + datos[8] + "</b> " + "N");
        $("#spTmax").html("<b>" + datos[9] + "</b> " + "N");
        $("#spTmin").html("<b>" + datos[10] + "</b> " + "N");
        $("#spLo").html("<b>" + datos[0] + "</b> " + "m");
        $("#spLf").html("<b>" + datos[1] + "</b> " + "m");
        $("#spS").html("<b>" + datos[11] + "</b> " + "m");
        $("#spValEcuacion").html("<b>" + datos[12] + "</b> " + "#");
        

        // datos xw, wy
        for (var i = 0; i < datos[13].length; i++) {
            datosCable.push({ x: parseFloat(datos[13][i]), y: parseFloat(datos[14][i]) });
        }
        
        console.log("Datos de cable..");
        console.table(datosCable);

        // datos 'x' y 'y'
        for (var i = 0; i < datos[15].length; i++) {
            datosDeformada.push({ x: parseFloat(datos[15][i]), y: parseFloat(datos[16][i]) });
            datosDeformadaCableContiguo.push({ x: parseFloat(datos[15][i]), y: parseFloat(datos[16][i]) - SEPARACION_CABLE_DEFORMADA });
            datosDeformadaInferior.push({ x: parseFloat(datos[15][i]), y: parseFloat(datos[16][i]) - SEPARACION_DEFORMADA });
        }

    }

    
    // configuración de estructuras para graficas

    var puntosCable = {
        datasets: [{
            label: 'Posición inicial del cable',
            fillColor: "rgba(151,249,190,0.5)",
            strokeColor: "rgba(255,255,255,1)",
            pointColor: "rgba(220,220,220,1)",
            borderColor: "rgb(062, 095, 138)",
            pointStrokeColor: "#fff",
            pointRadius: 0,
            lineTension: 0,
            fill: false,
            data: datosCable
        }]
    }

    var ctxCable = document.getElementById('chartCable').getContext("2d");
    ctxCable.canvas.height = alturaChart;  // setting height of canvas
    ctxCable.canvas.width = anchoChart;

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

    

    addDatasetsDeformada(datosDeformada, COLOR_NEGRO, LINEA_GRUESA);
    addDatasetsDeformada(datosDeformadaCableContiguo, COLOR_NEGRO, LINEA_GRUESA);
    addDatasetsDeformada(datosDeformadaInferior, COLOR_ROJO, LINEA_FINA);


    
    // líneas verticales en el cable
    addFlechas(datosDeformada, COLOR_NEGRO, LINEA_FINA, SEPARACION_CABLE_DEFORMADA, 5);

    // líneas verticales en la deformada
    addFlechas(datosDeformada, COLOR_ROJO, LINEA_FINA, SEPARACION_DEFORMADA, 17);
    


    var puntosDeformada = {
        datasets: datasetDeformada
    }

    var ctxDeformada = document.getElementById('chartDeformada').getContext("2d");
    ctxDeformada.canvas.height = alturaChart;  // setting height of canvas
    ctxDeformada.canvas.width = anchoChart;

    var chartCable = new Chart(ctxDeformada, {
        type: 'line',
        data: puntosDeformada,
        options: {
            legend: {
                display: false,
                position: 'bottom'
            },
            scales: {
                xAxes: [{
                    display: true,
                    type: 'linear',
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

    datasetDeformada = [];

}


// para lineas verticales en cable y deformada
function addFlechas(datos, colorLinea, grosorLinea, separacionY, separacionX) {
    var myNewLine = [];
    console.log("Generado lineas para las flechas");
    for (var i = 0; i <= datos.length; i++) {
        // Agrega líneas verticales con saltos
        if (i % separacionX == 0) {
            // Genera los dos puntos de la linea
            myNewLine.push({ x: datos[i].x, y: datos[i].y });
            myNewLine.push({ x: datos[i].x, y: datos[i].y - separacionY });
            addDatasetsDeformada(myNewLine, colorLinea, grosorLinea);

            // Adhiere la línea a la lista de dataset de "Deformada"
            myNewLine = [];
        }
    }
}

// Agrega un nuevo dataset a la grafica de "Deformada"
function addDatasetsDeformada(datos, colorLinea, grosorLinea) {
    var myNewDataset = {
        label: 'Deformada de cable inferior',
        borderWidth: grosorLinea,
        fillColor: "rgba(151,249,190,0.5)",
        strokeColor: "rgba(255,255,255,1)",
        pointColor: "rgba(220,220,220,1)",
        borderColor: colorLinea,
        backgroundColor: colorLinea,
        pointStrokeColor: "#fff",
        pointRadius: 0,
        lineTension: 0,
        fill: false,
        data: datos
    }

    datasetDeformada.push(myNewDataset);

}



function ejecutarModelo() {
    console.log("Procesando modelo...");

    // datos de entrada para el modelo
    var categoria = $('#rbCategoria input:checked').val();

    if (categoria == OPCION_FLECHA) {
        strInput = 4 + "\n" +
            $("#tbHo").val() + "\n" +
            $("#tbHf").val() + "\n" +
            $("#tbEr").val() + "\n" +
            $("#tbFs").val() + "\n" +
            $("#tbWo").val() + "\n" +
            $("#tbHm").val() + "\n" +
            $("#tbCotaB").val() + "\n";
    } else {
        strInput = 5 + "\n" + 
            $("#tbFs").val() + "\n" +
            $("#tbEr").val() + "\n" +
            $("#tbWo").val() + "\n" +
            $("#tbL").val() + "\n" +
            $("#tbYm").val() + "\n";
    }

    console.log("Datos del archivo de entrada: " + strInput);

    var actionData = "{'value': '" + strInput + "'}";

    // abre ventana modal de espera
    waitingDialog.show('Procesando modelo.', { dialogSize: 'sm', progressType: 'warning' });

    // envio de datos al servidor
    $.ajax({
        type: "POST",
        url: "catenaria.aspx/procesarModelo",
        data: actionData,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (msg) {

            //graficarResultados(msg);
            console.log("Extrayendo resultados devueltos....")
            console.log(msg);
            mostrarResultados(msg);
            // cierra ventana modal de espera
            waitingDialog.hide();
        }
    });
}

function generarInformeTXT(msg) {
    // captura los datos del archivo de resultados
    var aData = msg.d;

    console.log("Imprimiendo resultado para el usuario.");
    console.log(aData[0]);

    var blob = new Blob([aData[0]], { type: "text/plain;charset=utf-8" });
    saveAs(blob, "ResultadosCatenaria.txt");
}


$(document).ready(function () {
    

    
    console.log("Ctrls. cargados.");

    $('#btnDecargarResultados').click(function () {
        console.log("Descargando resultados... ");

        $.ajax({
            type: "POST",
            url: "catenaria.aspx/getInforme",
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

    $("#save-deformada").click(function () {
        $("#chartDeformada").get(0).toBlob(function (blob) {
            saveAs(blob, "deformada.png");
        });
    });

    $('#btnEjemplo').click(function () {
        console.log("Cargando ejemplo.");

        
        /*var value = "1";
        var radio = $("[id*=rbCategoria] input[value=" + value + "]");
        radio.attr("checked", "checked");*/

        var categoria = $('#rbCategoria input:checked').val();


        $("#tbEr").val(900);
        $("#tbHf").val(100);
        $("#tbWo").val(3.058);
        $("#tbFs").val(1);
        if (categoria == OPCION_FLECHA) {
            $('#tbHo').val(90);
            $("#tbHm").val(15);
            $("#tbCotaB").val(70);
        } else {
            $("#tbL").val(30);
            $("#tbYm").val(10);
        }



    });


    // Control que no se envie el formulario con post y
    // permite validar los controles con HTML5
    $('#formCatenaria').submit(function (event) {
        if (this.checkValidity()) {
            event.preventDefault();

            console.log("Ejecutando el código");
            ejecutarModelo();
        }
    });


    // ************** Configuración de controles al cargar la página ****************
    // ocultando controles en entrada
    $('#L').hide("fast");
    $('#Th').hide("fast");
    $('#B').hide("fast");
        

    // oculatando controles en la salida
    $('#resHo').hide("fast");
    $('#resHf').hide("fast");
    

    document.getElementById("tbL").required = false;
    
    document.getElementById("tbYm").required = false;



    // configuración de controles en función del tipo de control
    $("#rbCategoria").click(function (event) {
        console.log("Ocultando elementos.");
        // obtiene el tipo de analísis modal
        var categoria = $('#rbCategoria input:checked').val();

        if (categoria == OPCION_FLECHA) {
            // entrada
            $('#Ho').show("fast");
            $('#Hf').show("fast");
            $('#Hm').show("fast");
            $('#CotaB').show("fast");


            $('#resVano').show("fast");
            $('#L').hide("fast");
            $('#Th').hide("fast");
            $('#B').hide("fast");
            
            $('#resHo').hide("fast");
            $('#resHf').hide("fast");
            

            // quita la validación a la tercera entrada
            document.getElementById("tbL").required = false;
            
            document.getElementById("tbYm").required = false;

            // agrega la validación de las dos primeras entradas
            document.getElementById("tbHo").required = true;
            document.getElementById("tbHf").required = true;
            document.getElementById("tbHm").required = true;
            document.getElementById("tbCotaB").required = true;

            // actualización de esquema
            $("#imgEsquema").attr("src", RUTA_ESQUEMA_FLECHA);

        } else {
            $('#Ho').hide("fast");
            $('#Hf').hide("fast");
            $('#Hm').hide("fast");
            $('#CotaB').hide("fast");
            $('#resVano').hide("fast");


            $('#L').show("fast");
            $('#Th').show("fast");
            $('#B').show("fast");
            $('#resHo').show("fast");
            $('#resHf').show("fast");
            

            // agrega la validación a la tercera entrada
            document.getElementById("tbL").required = true;
            
            document.getElementById("tbYm").required = true;



            // quita la validación de las dos primeras entradas
            document.getElementById("tbHo").required = false;
            document.getElementById("tbHf").required = false;
            document.getElementById("tbHm").required = false;
            document.getElementById("tbCotaB").required = false;

            // actualización de esquema
            $("#imgEsquema").attr("src", RUTA_ESQUEMA_LONGITUD);

        }
    });
    // ************** Fin de Control de los datos de entrada ****************
});