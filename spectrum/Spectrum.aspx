<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Spectrum.aspx.cs" Inherits="experimento_Spectrum" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <script src="jquery.js"></script>
    <script src="jquery-ui.js"></script>
    <link href="jquery-ui.css" rel="stylesheet" />

    <script type="text/javascript">
        function leerRegistros() {
            console.log("Leyendo registros");
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
                        leerRegistros();
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

            <div class="col-md-12">
                <h2>Matriz PSA</h2>

                <canvas id="chartTercerGrafico" />


            </div>
           

        </div>

    </form>
</body>
</html>
