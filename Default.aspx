<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Writeboard</title>

    <link type="text/css" rel="Stylesheet" href="Estilo.css"/>
    <script type="text/javascript">

        function ValidarCheckBox(source, args) {
            var cb = document.getElementById('<%=cbTerminos.ClientID%>');
            args.IsValid = cb.checked;
        }

        
    </script>
</head>
<body>
    <div id="gradiente"></div>
    <div id="conjunto">
        <div id="logo">
             <img src="Img/logo.gif" width="230" height="60" alt="Writeboard logo" />
             <h1>Write, Share, Revise, Compare.</h1><br />
        </div>
        <form id="form1" runat="server">
            <div id="crear">
                <h5>1. Nombre:</h5>
                <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
                <h5>2. Password:</h5>
                <asp:TextBox ID="txtPass" TextMode="Password" runat="server"></asp:TextBox>
                <h5>3. E-mail:</h5>
                <asp:TextBox ID="txtMail" runat="server"></asp:TextBox><br />
                <asp:CheckBox ID="cbTerminos" runat="server"/>Acepto los <a href="http://writeboard.com/terms.html">términos</a><br />

                <asp:RequiredFieldValidator ID="RFV1" runat="server" ErrorMessage="* Ingrese el nombre <br/>" 
                ControlToValidate="txtNombre" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="RFV2" runat="server" ErrorMessage="* Ingrese un password <br/>" 
                ControlToValidate="txtPass" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="RFV3" runat="server" ErrorMessage="* Ingrese la dirección de correo <br/>" 
                ControlToValidate="txtMail" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="REV1" runat="server" 
                    ErrorMessage="* Ingrese un correo valido <br/>" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                    ControlToValidate="txtMail" Display="Dynamic"></asp:RegularExpressionValidator>
                
                <asp:CustomValidator ID="CV1" runat="server" ErrorMessage="* Debe aceptar los términos <br>" 
                ClientValidationFunction="ValidarCheckBox" Display="Dynamic"></asp:CustomValidator>
                <br />

                <asp:Button ID="btnCrear" text="Crear Writeboard" runat="server" onclick="btnCrear_Click"/>
                <asp:Label ID="lblMensaje" runat="server"></asp:Label>

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    SelectCommand="SELECT * FROM [writeboard]"></asp:SqlDataSource>
            </div>
            <div id="info">
                
            </div>
        </form>
    </div>

</body>
</html>
