using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnCrear_Click(object sender, EventArgs e)
    {
        if (!Page.IsValid && txtNombre.Text == string.Empty || txtMail.Text == string.Empty || txtPass.Text == string.Empty || !cbTerminos.Checked)
        {
            lblMensaje.Text = "<p>El valor de los campos es incorrecto.</p>";
        }
        else if (!GuardarWB())
        {
            lblMensaje.Text = "<p>Ha ocurrido un error.</p>";
        } 
    }
    
    private bool GuardarWB()
    {
        string ConnStr = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection ConnSql = new SqlConnection(ConnStr);
        string Id;
        try
        {
            string Consulta = "INSERT writeboard (Nombre, Password, Email) VALUES (@Nombre, @Password, @Email); SELECT SCOPE_IDENTITY();";
            SqlCommand CommSql = new SqlCommand(Consulta, ConnSql);
            CommSql.Parameters.AddWithValue("@Nombre", txtNombre.Text);
            CommSql.Parameters.AddWithValue("@Password", txtPass.Text);
            CommSql.Parameters.AddWithValue("@Email", txtMail.Text);
            ConnSql.Open();
            Id = CommSql.ExecuteScalar().ToString();
            Session.Add("WBId", Id);
            Session.Add("Nombre", txtNombre.Text);
        }
        catch (Exception e) 
        {
            //lblMensaje.Text = e.Message;
            return false; 
        }
        finally 
        { 
            ConnSql.Close(); 
        }

        Response.Redirect(Request.Url.Scheme + System.Uri.SchemeDelimiter + Request.Url.Host + (Request.Url.IsDefaultPort ? "" : ":" + Request.Url.Port) + "/Writeboard/Ver.aspx?Id=" + Id);
        return true;
    }
}