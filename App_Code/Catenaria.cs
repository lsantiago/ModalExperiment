using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using MathWorks.MATLAB.NET.Arrays;
using MathWorks.MATLAB.NET.Utility;

using calculadora;

/// <summary>
/// Descripción breve de Catenaria
/// </summary>
public class Catenaria
{
    public Catenaria()
    {
        
    }

    public String resolverMetodoFlecha()
    {
        //Ho,Hf,ER,FS,Wo

        double ho = 5;
        double hf = 15;
        double er = 900;
        double fs = 1;
        double wo = 3.058;

        demo obj = new demo();
        MWArray output = obj.sumar((MWArray)ho);


        return output.ToString();
    }
}