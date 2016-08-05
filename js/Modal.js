
$(document).ready(function () {
    //$("#gradoLibertad").on('click', graficarPropiedad("bar-area", "Un1", "1"));
    console.log("Página cargada.");
    loadConfiguracionCtrlsGraficos();
});

function graficarModosVibracion() {
    console.log("Graficando los modos de vibración.");
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

    significadoPropiedades[0] = ['Desplazamiento', 'Velocidad', 'Aceleración', 'E. Cinética', 'E. Potencial', 'E. Total', 'Fuerza Elástica', 'Desplazamiento Nodal Total'];
    significadoPropiedades[1] = ['Desplazamiento', 'Velocidad', 'Aceleración', 'E. Cinética', 'E. Potencial', 'E. Total', 'Energía de Disipación', 'Fuerza Elástica', 'Fuerza Externa', 'Fuerza Total', 'Desplazamiento Nodal Total'];
    significadoPropiedades[2] = ['Desplazamiento Nodal Total'];
    significadoPropiedades[3] = ['Desplazamiento Nodal Total'];


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

                    data: dataPoints
                }]
            }

            Chart.defaults.global.tooltipFillColor = "rgba(0,160,0,0.8)";
            Chart.defaults.global.scaleLineColor = "black";

            var ctx = document.getElementById(idControl).getContext("2d");
            ctx.canvas.height = 300;  // setting height of canvas
            ctx.canvas.width = 500; // setting width of canvas

            var scatterChart = new Chart(ctx, {
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
                                labelString: 'Tiempo'
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



    significadoPropiedades[0] = ['Desplazamiento', 'Velocidad', 'Aceleración', 'E. Cinética', 'E. Potencial', 'E. Total', 'Fuerza Elástica', 'Desplazamiento Nodal Total'];
    significadoPropiedades[1] = ['Desplazamiento', 'Velocidad', 'Aceleración', 'E. Cinética', 'E. Potencial', 'E. Total', 'Energía de Disipación', 'Fuerza Elástica', 'Fuerza Externa', 'Fuerza Total', 'Desplazamiento Nodal Total'];
    significadoPropiedades[2] = ['Desplazamiento Nodal Total'];
    significadoPropiedades[3] = ['Desplazamiento Nodal Total'];

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