using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Diagnostics;
using System.Web.Services;

public partial class laboratorios_analisis_estatico_index : System.Web.UI.Page
{
    private static String PATH_FILE_MODEL = @"C:\vlee\analisis_estatico\input.txt";
    private static String PATH_FILE_OUTPUT = @"C:\vlee\analisis_estatico\outputExperimento.txt";
    private static String PATH_FILE_OUTPUT_USER = @"C:\vlee\analisis_estatico\outputUser.txt";

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
        start.FileName = @"C:\vlee\analisis_estatico\ExeCables.exe";
        using (Process proc = Process.Start(start))
        {
            proc.WaitForExit();
        }
    }
}