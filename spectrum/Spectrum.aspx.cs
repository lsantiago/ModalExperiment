using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Diagnostics;

public partial class experimento_Spectrum : System.Web.UI.Page
{
    private static String PATH = @"C:\Users\Administrador\Documents\Visual Studio 2015\WebSites\VLEE\spectrum\";

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static void escribirAmortiguamiento(string value)
    {
       
        System.IO.StreamWriter file = new System.IO.StreamWriter(PATH + "input.txt");
        file.WriteLine(value);

        file.Close();

        runModel();
    }

    private static void runModel()
    {
        // Run model
        ProcessStartInfo start = new ProcessStartInfo();
        start.FileName = @PATH+"spectrum.exe";
        using (Process proc = Process.Start(start))
        {
            proc.WaitForExit();
        }
    }

    [WebMethod]
    public static List<object> getRegistrosPSA()
    {
        List<object> lstData = new List<object>();
        char[] delimiterChars = { ' ' };



        return lstData;
    }



}