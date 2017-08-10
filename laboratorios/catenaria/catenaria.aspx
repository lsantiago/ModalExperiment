<%@ Page Language="C#" AutoEventWireup="true" CodeFile="catenaria.aspx.cs" Inherits="laboratorios_catenaria_catenaria" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Catenaria</title>

    <%-- LIBRERIAS --%>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <script src="../../js/jquery.fileDownload.js"></script>
    <script src="../../js/Chart.min.js"></script>

    <%--Ventana de espera de ejecución--%>
    <script src="../../js/waitingfor.js"></script>
     
    <%--Lógica del programa--%>
    <script src="catenaria.js"></script>

    <%-- ESTILOS --%>
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" />
    <link href="../../css/change-boostrap.css" rel="stylesheet" />

    <%--Control de altura de cajas de entrada--%>
    <script src="../../js/jquery.matchHeight.js" type="text/javascript"></script>

    <%--Opciones de catenaria--%>
    <link href="catenaria.css" rel="stylesheet" />
   
    <%--Libreria para descargar el archivo de resultados--%>
    <script src="../../js/jquery.fileDownload.js"></script>

    <%--Librería para descargar imagenes de chart.js--%>
    <script src="../../js/FileSaver.js"></script>

    <%--Estilo de catalogo--%>
    <link href="../../css/catalogo/modCatalogo.css" rel="stylesheet" />
    <link href="../../css/catalogo/magic.min.css" rel="stylesheet" />
    <link href="../../css/catalogo/catalogo.css" rel="stylesheet" />
    <link href="../../css/catalogo/animate.min.css" rel="stylesheet" />


</head>
<body>
    <form id="formCatenaria" runat="server">
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-2">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>

                    <p class="navbar-brand">CATENARIA</p>
                </div>

                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-2">


                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="#">Ayuda</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="container-fluid">

            <p>
                Descripción: Catenaria....
              <br />
                <b>Autores:</b> Duque, E.; Quiñones, S.; Pelaéz, D.
              <br />
                Información: Catenaria.pdf
              <br />
                <br />

            </p>

        </div>
        <!— /container —>
         

        <%--INPUT--%>
        <fieldset>
            <legend><h5><b>Configuración del modelo</b></h5></legend>
            <div class="row equal-height-panels">
                 <div class="col-md-4 sinespacios">
                                <div class="panel panel-default">
                                    <div class="panel-heading">Datos de entrada</div>
                                    <div class="panel-body">
                                        Tipo: 
                                        <asp:RadioButtonList ID="rbCategoria" runat="server" CssClass="radio">
                                            <asp:ListItem class="radio-inline" Value="1" Selected="True">Flecha</asp:ListItem>
                                            <asp:ListItem class="radio-inline" Value="2">Longitud</asp:ListItem>
                                        </asp:RadioButtonList>
                                        Datos: 
                                        <div id="Er" class="input-group input-group-sm">
                                            <span class="input-group-addon anchoTextoEntrada">Esfuerzo de ruptura (ER)</span>
                                            <input title ="Revisar catalogo" id="tbEr" type="number" step="any" class="form-control" aria-label="Amount (to the nearest dollar)"  placeholder="Revise tabla de factores"  required="required"  />
                                            <span class="input-group-addon anchoTextoSimbolo">N</span>
                                        </div>

                                        <div id="Fs" class="input-group input-group-sm">
                                            <span class="input-group-addon anchoTextoEntrada">Factor de seguridad (FS)</span>
                                            <input id="tbFs" type="number" step="any" class="form-control" aria-label="Amount (to the nearest dollar)" placeholder="Revise el catalogo" required="required" />
                                            <span class="input-group-addon anchoTextoSimbolo">#</span>
                                        </div>

                                        <div id="Wo" class="input-group input-group-sm">
                                            <span class="input-group-addon anchoTextoEntrada">Carga distribuida (Wo)</span>
                                            <input id="tbWo" type="number" step="any" class="form-control" aria-label="Amount (to the nearest dollar)" placeholder="Revise el catalogo" required="required" />
                                            <span class="input-group-addon anchoTextoSimbolo">kg/m</span>
                                        </div>
                                        <div id="Ho" class="input-group input-group-sm">
                                            <span class="input-group-addon anchoTextoEntrada">Flecha o altura - (O) al eje Ho</span>
                                            <input id="tbHo" type="number" step="any" class="form-control" aria-label="Amount (to the nearest dollar)" required="required" />
                                            <span class="input-group-addon anchoTextoSimbolo">m</span>
                                        </div>

                                        <div id="Hf" class="input-group input-group-sm">
                                            <span class="input-group-addon anchoTextoEntrada">Flecha o altura - (F) al eje Hf</span>
                                            <input id="tbHf" type="number" step="any" class="form-control" aria-label="Amount (to the nearest dollar)" required="required" />
                                            <span class="input-group-addon anchoTextoSimbolo">m</span>
                                        </div>

                                        <!-- Nuevos elementos -->
                                        <div id="Hm" class="input-group input-group-sm">
                                            <span class="input-group-addon anchoTextoEntrada">Cota (Hm)</span>
                                            <input id="tbHm" type="number" step="any" class="form-control" aria-label="Amount (to the nearest dollar)" required="required" />
                                            <span class="input-group-addon anchoTextoSimbolo">m</span>
                                        </div>

                                        <div id="CotaB" class="input-group input-group-sm">
                                            <span class="input-group-addon anchoTextoEntrada">Cota (b)</span>
                                            <input id="tbCotaB" type="number" step="any" class="form-control" aria-label="Amount (to the nearest dollar)" required="required" />
                                            <span class="input-group-addon anchoTextoSimbolo">m</span>
                                        </div>
                                        <!-- End Nuevos elementos -->


                                        <%--Datos adicionales de la opción longitud--%>
                                        <div id="L" class="input-group input-group-sm">
                                            <span class="input-group-addon anchoTextoEntrada">Distancia o Vano (L)</span>
                                            <input id="tbL" type="number" step="any" class="form-control" aria-label="Amount (to the nearest dollar)" required="required" />
                                            <span class="input-group-addon anchoTextoSimbolo">m</span>
                                        </div>
                                        
                                        <!--
                                        <div id="Th" class="input-group input-group-sm">
                                            <span class="input-group-addon anchoTextoEntrada">Variación (Δ)</span>
                                            <input id="tbVar" type="number" step="any" class="form-control" aria-label="Amount (to the nearest dollar)" required="required" />
                                            <span class="input-group-addon anchoTextoSimbolo">N</span>
                                        </div>
                                        -->

                                        <div id="B" class="input-group input-group-sm">
                                            <span class="input-group-addon anchoTextoEntrada">Cota (Ym)</span>
                                            <input id="tbYm" type="number" step="any" class="form-control" aria-label="Amount (to the nearest dollar)" required="required" />
                                            <span class="input-group-addon anchoTextoSimbolo">m</span>
                                        </div>
                                        

                                        <br />
                                        <div class="form-group">
                                            <div class="col-md-12 sinespacios">


                                                <button id="btnRun" type="submit" class="btn btn-warning btn-xs">Ejecutar</button>
                                                <button id="btnEjemplo" type="button" class="btn btn-default btn-xs">Ejemplo</button>
                                                <button id="btnCatalogo" type="button" data-toggle="modal" data-target="#myModal" class="btn btn-default btn-xs">Catalogo</button>
                                                <button id="btnTablaFactores" type="button" data-toggle="modal" data-target="#myModalFactores"   class="btn btn-default btn-xs">Tabla de factores</button>


                                            </div>

                                        </div>
                                    </div>
                                </div>
                                


                            </div>
                <div class="col-md-4">
                    <div class="panel panel-success">

                        <div class="panel-heading">Esquema</div>
                        <div class="panel-body  ">
                            <img id="imgEsquema" src="../../img/esquema/esquemaCatenariaFlecha.png" class="img-responsive espacioEsquema" />
                        </div>


                    </div>
                </div>
                <%--<div class="col-md-3">
                </div>--%>

            </div>
        </fieldset>

        <%--OUTPUT--%>
        <fieldset>
            <legend><h5><b>Resultados</b></h5></legend>
            <div class="row col-condensed">
                <%--Valores--%>
                <div class="col-md-3 sinespacios">
                    <div class="panel panel-default">
                                <div class="panel-body">

                                   <ul class="list-group">
                                       <%--Ho y Hf son de la opción longitud--%> 
                                       <li id="resHo" class="list-group-item">
                                            <span id="spResHo" class="badge badge-light">m</span>
                                            Altura del apoyo (Ho)
                                        </li>
                                       <li id ="resHf" class="list-group-item">
                                            <span id="spRespHf" class="badge badge-light">m</span>
                                            Altura del apoyo (Hf)
                                        </li>
                                       

                                       <li id="resVano" class="list-group-item">
                                            <span id="spVano" class="badge badge-light">m</span>
                                            Vano o distancia (O)n(F)(L)
                                        </li>
                                        <li class="list-group-item">
                                            <span id="spLo" class="badge badge-light">m</span>
                                            Distancia - (O) al eje (Lo)
                                        </li>
                                        <li class="list-group-item">
                                            <span id="spLf" class="badge badge-light">m</span>
                                            Distancia - (F) al eje (Lf)
                                        </li>

                                       <!-- Yo -->
                                       <li class="list-group-item">
                                            <span id="spYo" class="badge badge-light">m</span>
                                            Flecha del eje al punto (Yo)
                                        </li>
                                       <!-- End Yo -->

                                       <!-- End Yf -->
                                       <li class="list-group-item">
                                            <span id="spYf" class="badge badge-light">m</span>
                                            Flecha del eje al punto (Yf)
                                        </li>
                                       <!-- End Yf -->


                                        <li class="list-group-item">
                                            <span id="spTo" class="badge badge-light">N</span>
                                            Tensión punto inicial (To)
                                        </li>
                                         
                                         <li class="list-group-item">
                                            <span id="spTf" class="badge badge-light">N</span>
                                            Tensión punto final (Tf)
                                        </li>
                                         
                                       <li id="resTmaxCable" class="list-group-item">
                                            <span id="spTmaxCable" class="badge badge-light">m</span>
                                            Tesión máx. que soporta el cable
                                        </li>
                                       
                                       <li class="list-group-item">
                                            <span id="spTmax" class="badge badge-light">N</span>
                                            Tensión máxima (Tmax)
                                        </li>
                                         <li class="list-group-item">
                                            <span id="spTmin" class="badge badge-light">N</span>
                                            Tensión mínima (Tmin)
                                        </li>
                                        
                                         <li class="list-group-item">
                                            <span id="spS" class="badge badge-light">m</span>
                                            Longitud Total (S)
                                        </li>
                                         <li class="list-group-item">
                                            <span id="spValEcuacion" class="badge badge-light"></span>
                                            Ecuación
                                        </li>

                                        
                                    </ul>

                                    
                                </div>
                                <div class="panel-footer">
                                    <input id="btnDecargarResultados" type="button" class="btn btn-danger btn-xs" value="Descargar"/>
                                </div>
                            </div>
                </div>
                <%--Gráficos--%>
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
                                                    Posición inicial del cable
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
                                            <canvas id="chartDeformada" width="500" height="198" />

                                        </div>
                                        
                                        <div class="panel-footer">
                                            <div class="form-group">
                                                <div class="col-md-6">
                                                    Deformada del cable
                                                </div>
                                                <div class="col-md-6">
                                                    <input id="save-deformada" class="btn btn-danger btn-xs pull-right" type="button" value="Descargar"/>
                                                </div>
                                                
                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                </div>
                <%--Fin Gráficos--%>
            </div>
        </fieldset>


        <!-- Modal Catalogo-->
            <div id="myModal" class="modal fade" role="dialog">
                <div class="modal-dialog" id="modalCatalogo">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">CATALOGO ENCOCABLES</h4>
                        </div>
                        <div class="modal-body">
                           <div class="row equal-height-panels">
	                            <div class="col-lg-6" >
	                                <div class="row">
	                                	<ul id="slideshow2_thumbs" class="desoslide-thumbs-horizontal list-inline text-center">
		                                    <li>
		                                        <a href="img/catalogo/1B.png">
		                                            <img src="img/catalogo/1A.png"
		                                                 alt="Bird"
		                                                  class="tamanioIconoCatalogo">
		                                        </a>
		                                    </li>
		                                    <li>
		                                        <a href="img/catalogo/2B.png">
		                                            <img src="img/catalogo/2A.png"
		                                                 alt="Bird"
		                                                  class="tamanioIconoCatalogo">
		                                        </a>
		                                    </li>
		                                    <li>
		                                        <a href="img/catalogo/3B.png">
		                                            <img src="img/catalogo/3A.png"
		                                                 alt="Bird"
		                                                 class="tamanioIconoCatalogo">
		                                        </a>
		                                    </li>
	                                	</ul>
	                                </div>
	                                <div class="row">
	                                   <ul id="slideshow2_thumbs" class="desoslide-thumbs-horizontal list-inline text-center">
	                                	<li>
		                                        <a href="img/catalogo/4B.png">
		                                            <img src="img/catalogo/5A.png"
		                                                 alt="Bird"
		                                                 class="tamanioIconoCatalogo">
		                                        </a>
		                                    </li>
		                                    <li>
		                                        <a href="img/catalogo/5B.png">
		                                            <img src="img/catalogo/5A.png"
		                                                 alt="Bird"
		                                                  class="tamanioIconoCatalogo">
		                                        </a>
		                                    </li>
		                                    <li>
		                                        <a href="img/catalogo/6B.png">
		                                            <img src="img/catalogo/6A.png"
		                                                 alt="Bird"
		                                                 class="tamanioIconoCatalogo">
		                                        </a>
		                                    </li>
		                                    </ul>
	                                </div>
	                                <div class="row">
	                                   <ul id="slideshow2_thumbs" class="desoslide-thumbs-horizontal list-inline text-center">
	                                	<li>
		                                        <a href="img/catalogo/7B.png">
		                                            <img src="img/catalogo/7A.png"
		                                                 alt="Bird"
		                                                  class="tamanioIconoCatalogo" />
		                                        </a>
		                                    </li>
		                                    <li>
		                                        <a href="img/catalogo/8B.png">
		                                            <img src="img/catalogo/8A.png"
		                                                 alt="Bird"
		                                                 class="tamanioIconoCatalogo" />
		                                        </a>
		                                    </li>
		                                    <li>
		                                        <a href="img/catalogo/9B.png">
		                                            <img src="img/catalogo/9A.png"
		                                                 alt="Bird"
		                                                 class="tamanioIconoCatalogo" />
		                                        </a>
		                                    </li>
		                                    </ul>
	                                </div>
	                            </div>

	                            <div class="col-lg-6" >
	                            	<div id="slideshow2" class="col-lg-12 espacioDetalleCatalogo" ></div>	
	                            </div>
	                        </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                    <!-- Modal content-->

                </div>
            </div>
        <!-- Fin Modal Catalogo -->
        
        <%--Modal Tabla Factores--%>
        <div id="myModalFactores" class="modal fade" role="dialog">
                <div class="modal-dialog" >

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">TABLA DE FACTORES</h4>
                        </div>
                        <div class="modal-body">
                           <div class="row equal-height-panels">
	                            <div class="col-lg-12" >
                                    <img id="imgFactorSeguridad" src="img/FactorSeguridad.png" class="img-responsive" />
                                                                 
	                            </div>
	                        </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                        </div>
                    </div>
                    <!-- Modal content-->

                </div>
            </div>
        <%--Fin Modal Tabla Factores--%>

    </form>

    <%--Control de catalogo--%>
     <script src="../../js/jquery.desoslide.min.js"></script>
     <script src="../../js/ctrlCatalogo.js"></script>
</body>
</html>
