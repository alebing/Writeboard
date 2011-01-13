<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Ver.aspx.cs" Inherits="Ver" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Writeboard : New Version</title>
    <link type="text/css" rel="Stylesheet" href="Estilo.css"/>
    <script type="text/javascript" src="jquery-1.4.1.min.js"></script>

    <style type="text/css">
        body{ background:#ddd }
    </style>

    <script type="text/javascript">
        function deslizar1(link) {
            if (link.value != "Cancelar") {
                $("#divInvitar").slideDown(300);
                link.value = "Cancelar";
            }
            else {
                $("#divInvitar").slideUp(300);
                link.value = "Invitar";
            }
        }

        function deslizar2(link) {
            if (link.value != "Cancelar") {
                $("#divFormato").slideDown(300);
                link.value = "Cancelar";
            }
            else {
                $("#divFormato").slideUp(300);
                link.value = "Formato";
            }
        }

        $(document).ready(function () {
            $('#divInvitar, #divFormato').slideUp(0);
        });
    </script>
</head>
<body>
    <div id="link">
       Este Writeboard esta en: <asp:HyperLink ID="linkWB" runat="server"></asp:HyperLink> 
    </div>
    <form id="form1" runat="server">
    <div style="float:right; width:300px; padding:10px">
        
        <a id="invitar" href="#" onclick="deslizar1(this)">Invitar gente</a><span> a colaborar.</span>
        <h4>Simple formatting codes</h4>
        <p>Writeboard uses simple, easy-to-write codes to format your text.</p>
        <p>Type the codes in your text and you will see the results after clicking Save.</p>
        <p>Here are some examples:</p>
        <p>*bold* → bold</p>
        <p>_italic_ → italic</p>
        <a href="#" onclick="deslizar2(this)">mas...</a><br />
        
        <div id="versiones">
            
            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                <AlternatingItemTemplate>
                    <li style="background-color: #FFF8DC;">Nombre:
                        <asp:Label ID="NombreLabel" runat="server" Text='<%# Eval("Nombre") %>' />
                        <br />
                        Autor:
                        <asp:Label ID="AutorLabel" runat="server" Text='<%# Eval("Autor") %>' />
                        <br />
                        FechaCreacion:
                        <asp:Label ID="FechaCreacionLabel" runat="server" 
                            Text='<%# Eval("FechaCreacion") %>' />
                        <br />
                    </li>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <li style="background-color: #008A8C;color: #FFFFFF;">Nombre:
                        <asp:TextBox ID="NombreTextBox" runat="server" Text='<%# Bind("Nombre") %>' />
                        <br />
                        Autor:
                        <asp:TextBox ID="AutorTextBox" runat="server" Text='<%# Bind("Autor") %>' />
                        <br />
                        FechaCreacion:
                        <asp:TextBox ID="FechaCreacionTextBox" runat="server" 
                            Text='<%# Bind("FechaCreacion") %>' />
                        <br />
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                            Text="Actualizar" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                            Text="Cancelar" />
                    </li>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    No se han devuelto datos.
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <li style="">Nombre:
                        <asp:TextBox ID="NombreTextBox" runat="server" Text='<%# Bind("Nombre") %>' />
                        <br />Autor:
                        <asp:TextBox ID="AutorTextBox" runat="server" Text='<%# Bind("Autor") %>' />
                        <br />FechaCreacion:
                        <asp:TextBox ID="FechaCreacionTextBox" runat="server" 
                            Text='<%# Bind("FechaCreacion") %>' />
                        <br />
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                            Text="Insertar" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                            Text="Borrar" />
                    </li>
                </InsertItemTemplate>
                <ItemSeparatorTemplate>
            <br />
                </ItemSeparatorTemplate>
                <ItemTemplate>
                    <li style="background-color: #DCDCDC;color: #000000;">Nombre:
                        <asp:Label ID="NombreLabel" runat="server" Text='<%# Eval("Nombre") %>' />
                        <br />
                        Autor:
                        <asp:Label ID="AutorLabel" runat="server" Text='<%# Eval("Autor") %>' />
                        <br />
                        FechaCreacion:
                        <asp:Label ID="FechaCreacionLabel" runat="server" 
                            Text='<%# Eval("FechaCreacion") %>' />
                        <br />
                    </li>
                </ItemTemplate>
                <LayoutTemplate>
                    <ul ID="itemPlaceholderContainer" runat="server" 
                        style="font-family: Verdana, Arial, Helvetica, sans-serif;">
                        <li runat="server" id="itemPlaceholder" />
                    </ul>
                    <div style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                    </div>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <li style="background-color: #008A8C;font-weight: bold;color: #FFFFFF;">Nombre:
                        <asp:Label ID="NombreLabel" runat="server" Text='<%# Eval("Nombre") %>' />
                        <br />
                        Autor:
                        <asp:Label ID="AutorLabel" runat="server" Text='<%# Eval("Autor") %>' />
                        <br />
                        FechaCreacion:
                        <asp:Label ID="FechaCreacionLabel" runat="server" 
                            Text='<%# Eval("FechaCreacion") %>' />
                        <br />
                    </li>
                </SelectedItemTemplate>
            </asp:ListView>
            
        </div>
    
    </div>

    <div id="contenido" >
        <div id="divInvitar" class="oculto">
            <h4>Inivita gente a colaborar</h4>
            <p>If you'd like others to work on this writeboard with you, enter their email addresses below. They will receive a link to this writeboard along with the password</p>
            <asp:TextBox ID="txtCorreo" runat="server"></asp:TextBox>
            <p class="titulo">Tu nombre</p>
            <asp:TextBox ID="txtCorreoNomb" runat="server"></asp:TextBox>
             
            <asp:Button ID="btnEnviarCorreo" Text="Enviar correos" runat="server" 
                onclick="btnEnviarCorreo_Click"/>

            <%--<asp:RequiredFieldValidator ID="RFV4" runat="server" ErrorMessage="<br/>* Ingrese un correo electrónico<br/>" 
            ControlToValidate="txtCorreo" Display="Dynamic" CssClass="validators" ></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="REV2" runat="server" ErrorMessage="* Ingrese un correo válido<br/>"
            ControlToValidate="txtCorreo" Display="Dynamic" CssClass="validators"></asp:RegularExpressionValidator>
            <asp:RequiredFieldValidator ID="RFV5" runat="server" ErrorMessage="* Ingrese su nombre<br/>" 
            ControlToValidate="txtCorreoNomb" Display="Dynamic" CssClass="validators" ></asp:RequiredFieldValidator>--%>
            <p>
                <a href="#" onclick="$('#divInvitar').slideUp(300)">Cerrar</a>
            </p>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                SelectCommand="SELECT [Nombre], [Autor], [FechaCreacion] FROM [contenido] ORDER BY [FechaCreacion] DESC">
            </asp:SqlDataSource>
        </div>

        <div id="divFormato" class="oculto">
            <h3>Guia para formato de texto</h3>
            <p>*bold* → <b>bold</b></p>
            <p>_italic_ → <i>italic</i></p>
            <p>h1.texto → Header 1</p>
            <p>h2.texto → Header 2</p>
            <p>h3.texto → Header 3</p>
            <a href="#" onclick="$('#divFormato').slideUp(300)">Cerrar</a>
        </div>

        <p class="titulo">
            Título
        </p>
        <asp:TextBox ID="txtTitulo" Width="100%" runat="server"></asp:TextBox>
         <p class="titulo">
            Contenido
        </p>
        <asp:TextBox ID="txtContenido" Width="100%" Height="400px" TextMode="MultiLine" runat="server"></asp:TextBox>
        <asp:Label ID="lblSalida" runat="server"></asp:Label>
        <p class="titulo">
            Tu nombre
        </p>
        <asp:TextBox ID="txtAutor" runat="server" Width="250px"></asp:TextBox>

        <div style=" background:#ddd; padding:5px; margin-top:5px">
            <asp:Button ID="btnGuardar" Text="Guardar este Writeboard" runat="server" 
                onclick="btnGuardar_Click"/>
        </div>
        <br />
    </div>
    
    <div>
        
    </div>
    </form>
</body>
</html>
