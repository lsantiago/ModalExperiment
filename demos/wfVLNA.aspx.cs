using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class wfVLNA : System.Web.UI.Page
{
    private void SetInitialRow()
    {
        

    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            PopulateData();
        }
    }

    private void PopulateData()
    {
        
    }

    protected void btnAddRow_Click(object sender, EventArgs e)
    {

        AddRowsToGrid();
    }

    private void AddRowsToGrid()
    {
        List<int> noofRoow = new List<int>();
        //int rows = 0;
       // int.TryParse(txtNoOfRecord.Text.Trim(), out rows);

    }
}