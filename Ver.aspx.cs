using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Text;
using System.Net.Mail;

public partial class Ver : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        linkWB.Text = Request.Url.Scheme + System.Uri.SchemeDelimiter + Request.Url.Host + (Request.Url.IsDefaultPort ? "" : ":" + Request.Url.Port) + "/Writeboard/Ver.aspx?Id=" + Request.QueryString["Id"];
        linkWB.NavigateUrl = linkWB.Text;
        txtTitulo.Text = Request.QueryString["Nombre"];
        ListView1.DataBind();
    }

    protected void btnGuardar_Click(object sender, EventArgs e)
    {
        GuardarWB();
            
        string[] palabras = txtContenido.Text.Split(' ');
        StringBuilder salida = new StringBuilder(); 
        foreach (string palabra in palabras)
        {
            if(palabra.StartsWith("*") && palabra.EndsWith("*"))
                salida.Append("<b>" + palabra.Substring(1, palabra.Length - 2) + "</b> ");
            else if(palabra.StartsWith("_") && palabra.EndsWith("_"))
                salida.Append("<i>" + palabra.Substring(1, palabra.Length - 2) + "</i> ");
            else if(palabra.StartsWith("h1."))
                salida.Append("<h1>" + palabra.Substring(3, palabra.Length - 3) + "</h1> ");
            else if (palabra.StartsWith("h2."))
                salida.Append("<h2>" + palabra.Substring(3, palabra.Length - 3) + "</h2> ");
            else if (palabra.StartsWith("h3."))
                salida.Append("<h3>" + palabra.Substring(3, palabra.Length - 3) + "</h3> ");
            else
                salida.Append(palabra + " ");
        }

        //salida.Replace("\n", "<br/>");

        lblSalida.Text = salida.ToString();
        txtContenido.Visible = false;
        
    }

    private void GuardarWB()
    {
        string ConnStr = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection ConnSql = new SqlConnection(ConnStr);

        try
        {
            string Consulta = "INSERT contenido (IdWriteboard, Nombre, Contenido, Autor, FechaCreacion) VALUES (@IdWriteboard, @Nombre, @Contenido, @Autor, @FechaCreacion); SELECT SCOPE_IDENTITY();";
            SqlCommand CommSql = new SqlCommand(Consulta, ConnSql);
            CommSql.Parameters.AddWithValue("@IdWriteboard", Session["WBId"].ToString());
            CommSql.Parameters.AddWithValue("@Nombre", txtTitulo.Text);
            CommSql.Parameters.AddWithValue("@Contenido", txtContenido.Text);
            CommSql.Parameters.AddWithValue("@Autor", txtAutor.Text);
            CommSql.Parameters.AddWithValue("@FechaCreacion", DateTime.Now.ToString());

            ConnSql.Open();
            CommSql.ExecuteNonQuery();
        }
        catch (Exception e)
        {
            Response.Write(e.ToString());
        }
        finally
        {
            ConnSql.Close();
        }
    }

    protected void btnEnviarCorreo_Click(object sender, EventArgs e)
    {
        MailMessage mensaje = new MailMessage("ejemplo@live.com", "ejemplo@unitec.edu");
        mensaje.Subject = "Writeboard";
        mensaje.Body = "Mira este link: " + linkWB.Text;
        SmtpClient smpt = new SmtpClient("localhost");
        smpt.Send(mensaje);
    }
}