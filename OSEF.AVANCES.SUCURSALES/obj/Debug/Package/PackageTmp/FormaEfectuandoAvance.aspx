<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormaEfectuandoAvance.aspx.cs" Inherits="OSEF.AVANCES.SUCURSALES.FormaEfectuandoAvance" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
      <link rel="stylesheet" href="css/login.css" />
    <link rel="Stylesheet" href="css/customControls.css" />
</head>
<body>
    <form id="form1" runat="server">
     <ext:ResourceManager ID="rmEfectuandoRevison" runat="server" />
      <ext:FormPanel 
        ID="fpEfectuandoRevison" 
        runat="server"
        Title="Efectuando Revisión"
        Width="300"
        BodyPadding="10"
        DefaultAnchor="100%">
        <Items>
            <ext:FieldSet ID="fsAfectando" 
                runat="server"
                Title="Selecciona movimiento a avanzar"
                Collapsible="False"
                DefaultAnchor="100%">
                <Items>
                    <ext:RadioGroup ID="rgAfectar" runat="server" ColumnsNumber="1">
                        <Items>
                            <ext:Radio ID="rGenerarRevision" runat="server" BoxLabel="Generar Revisión"/>
                            <ext:Radio ID="rConcluirRevision" runat="server" BoxLabel="Concluir Revisión"/>
                            <ext:Radio ID="rFinalizarProyecto" runat="server" BoxLabel="Finalizar Proyecto"/>
                        </Items>
                    </ext:RadioGroup>
                </Items>
            </ext:FieldSet>
        </Items>
        
        <Buttons>
            <ext:Button 
            ID="btnAceptar" 
            runat="server" 
            Text="Aceptar" 
            Cls="cbtn"
            MarginSpec="0 10 0 0">
            </ext:Button>
        </Buttons>
    </ext:FormPanel>


    </form>
</body>
</html>
