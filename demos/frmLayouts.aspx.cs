using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Diagnostics;

public partial class demos_frmLayouts : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static List<object> getLineChartData()
    {
        // Posibles combinaciones
        //int categoria = rbCategoria.SelectedValue;
        String[] tipoVariables = { "t", "u", "up", "upp", "ek"};

        List<object> iData = new List<object>();
        List<String> labels = new List<String>();
        List<String> lst_dataItem_1 = new List<String>();
        List<String> lst_dataItem_2 = new List<String>();
        List<String> lst_dataItem_3 = new List<String>();
        List<String> lst_dataItem_4 = new List<String>();


        // lectura de etiquetas
        char[] delimiterChars = {','};  // ' ', ',', '.', ':', '\t'

        using (StreamReader sr = new StreamReader("C:\\Modal\\output.txt", false))
        {
            string line;
            while ((line = sr.ReadLine()) != null)
            {

                String[] datos = line.Split(delimiterChars);
                if (datos[0].Equals("t"))
                {
                    for (int cont = 1; cont < datos.Length; cont++)
                    {
                        labels.Add(datos[cont]);
                    }
                }
                else if (datos[0].Equals("un1"))
                {
                    for (int cont = 1; cont < datos.Length; cont++)
                    {
                        lst_dataItem_1.Add(datos[cont]);
                    }
                }
                else if (datos[0].Equals("up"))
                {
                    for (int cont = 1; cont < datos.Length; cont++)
                    {
                        lst_dataItem_2.Add(datos[cont]);
                    }
                }
                else if (datos[0].Equals("upp"))
                {
                    for (int cont = 1; cont < datos.Length; cont++)
                    {
                        lst_dataItem_3.Add(datos[cont]);
                    }
                }
                else if (datos[0].Equals("Ek"))
                {
                    for (int cont = 1; cont < datos.Length; cont++)
                    {
                        lst_dataItem_4.Add(datos[cont]);
                    }
                }

            }
        }


        iData.Add(labels);
        iData.Add(lst_dataItem_1);
        iData.Add(lst_dataItem_2);
        iData.Add(lst_dataItem_3);
        iData.Add(lst_dataItem_4);

        return iData;
    }

    // lee los datos que se encuentra en las cajas de texto de las propiedades
    private String getDatosCtrls(TextBox[] controles, int cantidadControles)
    {
        String salida = "";
        for (int i = 0; i < cantidadControles; i++)
        {
            salida += controles[i].Text + " ";
        }
        salida += "\n";
        return salida;
    }

    protected void btnRun_Click(object sender, EventArgs e)
    {
        
        string strOutput;
        int nroPisos = Convert.ToInt32(ddlNCL.SelectedValue);

        TextBox[] arrM = new TextBox[] { tbM1, tbM2, tbM3, tbM4, tbM5, tbM6, tbM7, tbM8, tbM9, tbM10, tbM11, tbM12, tbM13, tbM14, tbM15, tbM16, tbM17, tbM18, tbM19, tbM20, tbM21, tbM22, tbM23, tbM24, tbM25, tbM26, tbM27, tbM28, tbM29, tbM30 };
        TextBox[] arrK = new TextBox[] { tbK1, tbK2, tbK3, tbK4, tbK5, tbK6, tbK7, tbK8, tbK9, tbK10, tbK11, tbK12, tbK13, tbK14, tbK15, tbK16, tbK17, tbK18, tbK19, tbK20, tbK21, tbK22, tbK23, tbK24, tbK25, tbK26, tbK27, tbK28, tbK29, tbK30 };
        TextBox[] arrC = new TextBox[] { tbC1, tbC2, tbC3, tbC4, tbC5, tbC6, tbC7, tbC8, tbC9, tbC10, tbC11, tbC12, tbC13, tbC14, tbC15, tbC16, tbC17, tbC18, tbC19, tbC20, tbC21, tbC22, tbC23, tbC24, tbC25, tbC26, tbC27, tbC28, tbC29, tbC30 };
        TextBox[] arrU = new TextBox[] { tbU1, tbU2, tbU3, tbU4, tbU5, tbU6, tbU7, tbU8, tbU9, tbU10, tbU11, tbU12, tbU13, tbU14, tbU15, tbU16, tbU17, tbU18, tbU19, tbU20, tbU21, tbU22, tbU23, tbU24, tbU25, tbU26, tbU27, tbU28, tbU29, tbU30 };
        TextBox[] arrI = new TextBox[] { tbI1, tbI2, tbI3, tbI4, tbI5, tbI6, tbI7, tbI8, tbI9, tbI10, tbI11, tbI12, tbI13, tbI14, tbI15, tbI16, tbI17, tbI18, tbI19, tbI20, tbI21, tbI22, tbI23, tbI24, tbI25, tbI26, tbI27, tbI28, tbI29, tbI30 };
        TextBox[] arrF = new TextBox[] { tbF1, tbF2, tbF3, tbF4, tbF5, tbF6, tbF7, tbF8, tbF9, tbF10, tbF11, tbF12, tbF13, tbF14, tbF15, tbF16, tbF17, tbF18, tbF19, tbF20, tbF21, tbF22, tbF23, tbF24, tbF25, tbF26, tbF27, tbF28, tbF29, tbF30 };
        TextBox[] arrW = new TextBox[] { tbW1, tbW2, tbW3, tbW4, tbW5, tbW6, tbW7, tbW8, tbW9, tbW10, tbW11, tbW12, tbW13, tbW14, tbW15, tbW16, tbW17, tbW18, tbW19, tbW20, tbW21, tbW22, tbW23, tbW24, tbW25, tbW26, tbW27, tbW28, tbW29, tbW30 };
        TextBox[] arrH = new TextBox[] { tbH1, tbH2, tbH3, tbH4, tbH5, tbH6, tbH7, tbH8, tbH9, tbH10, tbH11, tbH12, tbH13, tbH14, tbH15, tbH16, tbH17, tbH18, tbH19, tbH20, tbH21, tbH22, tbH23, tbH24, tbH25, tbH26, tbH27, tbH28, tbH29, tbH30 };

        

        strOutput = rbCategoria.SelectedValue + "\n";
        strOutput += ddlNCL.SelectedValue + " ";
        strOutput += tbTO.Text + " ";


        strOutput += tbTF.Text + " ";
        strOutput += tbPA.Text + "\n";


        int categoria = Convert.ToInt32(rbCategoria.SelectedValue);
        if(categoria == 3)
        {
            // escribir M, K, U, I, H
            strOutput += getDatosCtrls(arrM, nroPisos);
            strOutput += getDatosCtrls(arrK, nroPisos);
            strOutput += getDatosCtrls(arrU, nroPisos);
            strOutput += getDatosCtrls(arrI, nroPisos);
            strOutput += getDatosCtrls(arrH, nroPisos);

        }
        else if(categoria == 4)
        {
            // escribir M, K, C, U; I, H
            strOutput += getDatosCtrls(arrM, nroPisos);
            strOutput += getDatosCtrls(arrK, nroPisos);
            strOutput += getDatosCtrls(arrC, nroPisos);
            strOutput += getDatosCtrls(arrU, nroPisos);
            strOutput += getDatosCtrls(arrI, nroPisos);
            strOutput += getDatosCtrls(arrH, nroPisos);
        }
        else if(categoria == 5)
        {
            // escribir M, K, F, W, H
            strOutput += getDatosCtrls(arrM, nroPisos);
            strOutput += getDatosCtrls(arrK, nroPisos);
            strOutput += getDatosCtrls(arrF, nroPisos);
            strOutput += getDatosCtrls(arrW, nroPisos);
            strOutput += getDatosCtrls(arrH, nroPisos);
        }
        else if(categoria == 6)
        {
            // escribir M, K, C, F, W, H
            strOutput += getDatosCtrls(arrM, nroPisos);
            strOutput += getDatosCtrls(arrK, nroPisos);
            strOutput += getDatosCtrls(arrC, nroPisos);
            strOutput += getDatosCtrls(arrF, nroPisos);
            strOutput += getDatosCtrls(arrW, nroPisos);
            strOutput += getDatosCtrls(arrH, nroPisos);
        }

        // Write the string to a file.
        System.IO.StreamWriter file = new System.IO.StreamWriter("c:\\Modal\\modelo.txt");
        file.WriteLine(strOutput);

        file.Close();

        
        // Run model
        ProcessStartInfo start = new ProcessStartInfo();
        start.FileName = @"C:\Modal\Modal.exe";
        using (Process proc = Process.Start(start))
        {
            proc.WaitForExit();
        }


        // graph
        ClientScript.RegisterStartupScript(GetType(), "graficando", "graficar()", true);
    }
}