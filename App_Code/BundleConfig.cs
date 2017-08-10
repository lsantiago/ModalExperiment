using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;


/// <summary>
/// BackEnd VLEE
/// </summary>
public class BundleConfig
{

    public static void RegisterBundles(BundleCollection bundles)
    {

        // BackEnd One.Click
        bundles.Add(new ScriptBundle("~/Content/oneclick/Content/js")
                .Include("~/Content/oneclick/Scripts/jquery/jquery-{version}.js")
                .Include("~/Content/oneclick/Scripts/bootstrap/bootstrap.min.js")
                .Include("~/Content/oneclick/Scripts/jquery/jquery-ui-1.11.4.min.js")
                .Include("~/Content/oneclick/Scripts/jquery/jquery.validate.min.js")
                .Include("~/Content/oneclick/Scripts/jquery/jquery.validate.unobtrusive.min.js")
                .Include("~/Content/oneclick/Scripts/jquery/jquery.unobtrusive-ajax.min.js")

                .Include("~/Content/oneclick/Content/assets/plugins/pace/pace.min.js")
                .Include("~/Content/oneclick/Content/assets/plugins/jquery-totemticker/jquery.totemticker.js")
                .Include("~/Content/oneclick/Content/assets/plugins/jquery-resize/jquery.ba-resize.js")
                .Include("~/Content/oneclick/Content/assets/plugins/jquery-blockui/jquery.blockUI.js")
                .Include("~/Content/oneclick/Content/assets/plugins/icheck/icheck.min.js")
                .Include("~/Content/oneclick/Content/assets/plugins/switchery/switchery.min.js")
                .Include("~/Content/oneclick/Content/assets/plugins/jquery-niftymodal/js/classie.js")
                .Include("~/Content/oneclick/Content/assets/plugins/jquery-niftymodal/js/modalEffects.js")
                .Include("~/Content/oneclick/Content/assets/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js")
                .Include("~/Content/oneclick/Content/assets/plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.min.js")
                .Include("~/Content/oneclick/Content/assets/plugins/select2/select2.js")
                .Include("~/Content/oneclick/Content/assets/plugins/bootstrap-slider/js/bootstrap-slider.js")
                .Include("~/Content/oneclick/Content/assets/js/form.js")
                .Include("~/Content/oneclick/Content/assets/js/main.js")
                .Include("~/Content/oneclick/Scripts/prettify/prettify.js")
               
            );


        //BackEnd One.Click
        bundles.Add(new StyleBundle("~/Content/oneclick/Content/css")
                .Include("~/Content/oneclick/Content/bootstrap/bootstrap.min.css")
                .Include("~/Content/oneclick/Content/font-awesome.css")
                .Include("~/Content/oneclick/Content/assets/plugins/pace/pace-theme-minimal.css")
                .Include("~/Content/oneclick/Content/assets/plugins/icheck/skins/square/blue.css")
                .Include("~/Content/oneclick/Content/assets/plugins/switchery/switchery.min.css")
                .Include("~/Content/oneclick/Content/assets/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css")
                .Include("~/Content/oneclick/Content/assets/plugins/bootstrap-colorpicker/css/bootstrap-colorpicker.min.css")
                .Include("~/Content/oneclick/Content/assets/plugins/select2/select2.css")
                .Include("~/Content/oneclick/Content/assets/plugins/select2/select2-bootstrap.css")
                .Include("~/Content/oneclick/Content/assets/plugins/bootstrap-slider/css/slider.css")
                .Include("~/Content/oneclick/Content/assets/plugins/jquery-niftymodal/css/component.css")
                .Include("~/Content/oneclick/Content/assets/plugins/jquery-datatables/css/dataTables.bootstrap.css")
                .Include("~/Content/oneclick/Content/assets/plugins/jquery-jvectormap/jquery-jvectormap.css")
                .Include("~/Content/oneclick/Content/prettify/prettify.css")
                .Include("~/Content/oneclick/Content/animate.css")

                .Include("~/Content/oneclick/Content/themes/base/all.css")
                .Include("~/Content/oneclick/Content/backend.css")
                .Include("~/Content/oneclick/Content/assets/css/main.css")
                .Include("~/Content/oneclick/Content/assets/css/skins.css")
            );



        //BackEnd VLEE
        bundles.Add(new ScriptBundle("~/Content/adicionales/js")
                .Include("~/Content/assets/js/Chart.min.js")
                .Include("~/Content/assets/js/FileSaver.js")
                .Include("~/Content/assets/js/jquery.fileDownload.js")
                .Include("~/Content/assets/js/jquery.matchHeight.js")
                .Include("~/Content/assets/js/waitingfor.js")
                .Include("~/Content/assets/js/animatedmodal/animatedModal.min.js")
            );

        bundles.Add(new ScriptBundle("~/Content/assets/js")
                .Include("~/Content/assets/js/jquery/jquery.min.js")
                .Include("~/Content/assets/js/bootstrap/bootstrap.min.js")
                .Include("~/Content/assets/js/Chart.min.js") 
                .Include("~/Content/assets/js/FileSaver.js") 
                .Include("~/Content/assets/js/jquery.fileDownload.js") 
                .Include("~/Content/assets/js/jquery.matchHeight.js")
                .Include("~/Content/assets/js/waitingfor.js") 
            );


        //BackEnd VLEE
        bundles.Add(new StyleBundle("~/Content/assets/css")
                .Include("~/Content/assets/css/bootstrap/bootstrap.min.css")
                .Include("~/Content/assets/css/bootstrap/change-boostrap.css")
            );

        bundles.Add(new StyleBundle("~/Content/adicionales/css")
                .Include("~/Content/assets/css/animatedmodel/animate.min.css")
                .Include("~/Content/assets/css/animatedmodel/normalize.min.css")
            );

        // BackEnd - Experimento Cargas Puntuales
        bundles.Add(new ScriptBundle("~/Content/assets/js/cargasPuntuales")
                .Include("~/Content/assets/js/experimentos/cargasPuntuales.js")
            );
        
        bundles.Add(new StyleBundle("~/Content/assets/css/cargasPuntuales")
                .Include("~/Content/assets/css/experimentos/cargaspuntuales.css")
            );

        
    }
}

