using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Diagnostics;
using System.Web.Services;


public partial class laboratorios_cargas_puntuales_CargasPuntuales : System.Web.UI.Page
{
    private static String PATH_FILE_MODEL = @"C:\vlee\cargas_puntuales\input.txt";
    private static String PATH_FILE_OUTPUT = @"C:\vlee\cargas_puntuales\outputExperimento.txt";
    private static String PATH_FILE_OUTPUT_USER = @"C:\vlee\cargas_puntuales\outputUser.txt";
    private static char[] delimiterChars = { ' ' };


    // Obtiene los datos para el informe del experimento
    [WebMethod]
    public static List<object> getInforme()
    {
        List<object> lstData = new List<object>();
        String contendFile = "";

        using (StreamReader sr = new StreamReader(PATH_FILE_OUTPUT_USER, false))
        {
            string line;
            while ((line = sr.ReadLine()) != null)
            {
                contendFile += line + "\n";
            }

            lstData.Add(contendFile);
        }

        return lstData;
    }


    // Lectura del archivo de resultados - página web
    [WebMethod]
    public static List<object> getResultados()
    {

        List<object> lstData = new List<object>();


        using (StreamReader sr = new StreamReader(PATH_FILE_OUTPUT, false))
        {
            string line;
            while ((line = sr.ReadLine()) != null)
            {
                line = line.Trim();
                String[] datos = line.Split(delimiterChars);
                List<String> lstVariable = new List<string>();

                for (int cont = 1; cont < datos.Length; cont++)
                {
                    lstVariable.Add(datos[cont]);
                }

                lstData.Add(lstVariable);

            }

        }

        return lstData;
    }

    [WebMethod]
    public static List<object> procesarModelo(string value)
    {
        // escribe el archivo de entrada
        System.IO.StreamWriter file = new System.IO.StreamWriter(PATH_FILE_MODEL);
        file.WriteLine(value);
        file.Close();

        // ejecuta el modelo
        runModel();

        // retorna los resultados
        return getResultados();
    }

    private static void runModel()
    {
        





        // Run model
        ProcessStartInfo start = new ProcessStartInfo();
        start.FileName = @"C:\vlee\cargas_puntuales\CargasPuntuales.exe";                   
        using (Process proc = Process.Start(start))
        {
            proc.WaitForExit();
        }
    }


    protected void Page_Load(object sender, EventArgs e)
    {
        // borra archivos anteriores
        if (File.Exists(PATH_FILE_OUTPUT))
        {
            File.Delete(PATH_FILE_OUTPUT);
        }

        if (File.Exists(PATH_FILE_OUTPUT_USER))
        {
            File.Delete(PATH_FILE_OUTPUT_USER);
        }
    }
}