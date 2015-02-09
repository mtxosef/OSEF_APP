<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormaEspecificarFechas.aspx.cs" Inherits="OSEF.AVANCES.SUCURSALES.FormaEspecificarFechas" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="css/login.css" />
    <link rel="Stylesheet" href="css/customControls.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
       <ext:ResourceManager ID="rmEspecificarFechas" runat="server" />
        <ext:FormPanel 
        ID="fpEspecificarFecha" 
        runat="server"
        Title="Especificar fecha"
        Width="300"
        BodyPadding="10"
        DefaultAnchor="100%">
        <Items>
            <ext:DateField 
                    ID="DateField1" 
                    runat="server"
                    Vtype="daterange"
                    FieldLabel="Desde"
                    EnableKeyEvents="true">  
                    <CustomConfig>
                        <ext:ConfigItem 
                        Name="endDateField" 
                        Value="DateField2" 
                        Mode="Value" />
                    </CustomConfig>
                    
                      <PickerOptions 
                        Cls="my-date-picker"
                        ID="pOFechaDesde" 
                        runat="server">
                        </PickerOptions>
                </ext:DateField>
                
            
                    
                <ext:DateField 
                    ID="DateField2"
                    runat="server" 
                    Vtype="daterange"
                    FieldLabel="Hasta"
                    EnableKeyEvents="true">    
                    <CustomConfig>
                        <ext:ConfigItem 
                        Name="startDateField" 
                        Value="DateField1"
                        Mode="Value" />
                    </CustomConfig>
                 
                       <PickerOptions 
                        Cls="my-date-picker"
                        ID="pOfechaHasta" 
                        runat="server">
                        </PickerOptions>
                </ext:DateField>
           </Items>
   
             <Buttons>
                <ext:ImageButton
                    ID="imgbtnGuardar"
                    runat="server"
                    ImageUrl="assets/img/controles/Guardar.png"
                    DisabledImageUrl="assets/img/controles/GuardarDisabled.png"
                    OverImageUrl="assets/img/controles/GuardarOver.png" 
                    PressedImageUrl="assets/img/controles/GuardarPressed.png" 
                    ToolTip="Guardar" 
                    Height="50" 
                    Width="50"
                    Disabled="false">
                  
                </ext:ImageButton>
                <ext:ImageButton 
                    ID="imgbtnCancelar" 
                    runat="server" 
                    ImageUrl="assets/img/controles/Cancelar.png" 
                    DisabledImageUrl="assets/img/controles/CancelarDisabled.png"
                    OverImageUrl="assets/img/controles/CancelarOver.png" 
                    PressedImageUrl="assets/img/controles/CancelarPressed.png" 
                    ToolTip="Cancelar" 
                    Height="50" 
                    Width="50">
                  
                </ext:ImageButton>
            </Buttons>


      </ext:FormPanel>
    </div>
    </form>
</body>
</html>
