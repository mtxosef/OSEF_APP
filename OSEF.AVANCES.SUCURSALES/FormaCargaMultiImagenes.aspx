﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormaCargaMultiImagenes.aspx.cs" Inherits="OSEF.AVANCES.SUCURSALES.FormaCargaMultiImagenes" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<title></title>
      <link rel="stylesheet" href="css/login.css" />
    <link rel="Stylesheet" href="css/customControls.css" />

    <script type="text/javascript">
        var loadFailed = function () {
            alert("Something went wrong while loading SWFUpload. If this were a real application we'd clean up and then give you an alternative");
        };

        var statusIconRenderer = function (value) {
            switch (value) {
                default:
                    return value;
                case 'Pending':
                    return '<img src="' + Ext.net.ResourceMgr.getIconUrl("Hourglass") + '" width=16 height=16>';
                case 'Sending':
                    return '<div src="x-loading-indicator" width=16 height=16>';
                case 'Error':
                    return '<img src="' + Ext.net.ResourceMgr.getIconUrl("Decline") + '" width=16 height=16>';
                case 'Cancelled':
                case 'Aborted':
                    return '<img src="' + Ext.net.ResourceMgr.getIconUrl("Decline") + '" width=16 height=16>';
                case 'Uploaded':
                    return '<img src="' + Ext.net.ResourceMgr.getIconUrl("Tick") + '" width=16 height=16>';
            }
        };

        var updateRecord = function (id, field, value) {
            var rec = App.UploadGrid.store.getById(id);

            rec.set(field, value);
            rec.commit();
        };

        var abortUpload = function (btn) {
            var selModel = btn.up('grid').getSelectionModel(),
                records;

            if (!selModel.hasSelection()) {
                Ext.Msg.alert('Error', 'Please select an upload to cancel');
                return true;
            }

            records = selModel.getSelection();
            App.MultiUpload1.abortUpload(records[0].getId());
        };

        var removeUpload = function (btn) {
            var selModel = btn.up('grid').getSelectionModel(),
                records;

            if (!selModel.hasSelection()) {
                Ext.Msg.alert('Error', 'Please select an upload to remove');
                return true;
            }

            records = selModel.getSelection();
            App.MultiUpload1.removeUpload(records[0].getId());
        };

        var fileSelected = function (item, file) {
            //Example of cancelling a file to be selection
            if (file.name == 'image.jpg') {
                Ext.Msg.alert('Error', 'You cannot upload a file named "image.jpg"');
                return false;
            }

            this.up('grid').store.add({
                id: file.id,
                name: file.name,
                size: file.size,
                status: 'Pending',
                progress: 0
            });
        };

        var uploadError = function (item, file, errorCode, message) {
            updateRecord(file.id, 'progress', 0);
            updateRecord(file.id, 'status', 'Error');

            switch (errorCode) {
                case SWFUpload.UPLOAD_ERROR.HTTP_ERROR:
                    alert("Error Code: HTTP Error, File name: " + file.name + ", Message: " + message);
                    break;
                case SWFUpload.UPLOAD_ERROR.UPLOAD_FAILED:
                    alert("Error Code: Upload Failed, File name: " + file.name + ", File size: " + file.size + ", Message: " + message);
                    break;
                case SWFUpload.UPLOAD_ERROR.IO_ERROR:
                    alert("Error Code: IO Error, File name: " + file.name + ", Message: " + message);
                    break;
                case SWFUpload.UPLOAD_ERROR.SECURITY_ERROR:
                    alert("Error Code: Security Error, File name: " + file.name + ", Message: " + message);
                    break;
                case SWFUpload.UPLOAD_ERROR.UPLOAD_LIMIT_EXCEEDED:
                    alert("Error Code: Upload Limit Exceeded, File name: " + file.name + ", File size: " + file.size + ", Message: " + message);
                    break;
                case SWFUpload.UPLOAD_ERROR.FILE_VALIDATION_FAILED:
                    alert("Error Code: File Validation Failed, File name: " + file.name + ", File size: " + file.size + ", Message: " + message);
                    break;
                case SWFUpload.UPLOAD_ERROR.FILE_CANCELLED:
                    updateRecord(file.id, 'status', 'Cancelled');
                    break;
                case SWFUpload.UPLOAD_ERROR.UPLOAD_STOPPED:
                    updateRecord(file.id, 'status', 'Stopped');
                    break;
                default:
                    updateRecord(file.id, 'status', "Unhandled Error: " + errorCode);
                    alert("Error Code: " + errorCode + ", File name: " + file.name + ", File size: " + file.size + ", Message: " + message);
                    break;
            }
        };

        var fileSelectionError = function (item, file, errorCode, message) {
            if (errorCode === SWFUpload.QUEUE_ERROR.QUEUE_LIMIT_EXCEEDED) {
                alert("You have attempted to queue too many files.\n" + (message === 0 ? "You have reached the upload limit." : "You may select " + (message > 1 ? "up to " + message + " files." : "one file.")));
                return;
            }

            switch (errorCode) {
                case SWFUpload.QUEUE_ERROR.FILE_EXCEEDS_SIZE_LIMIT:
                    alert("Error Code: File too big, File name: " + file.name + ", File size: " + file.size + ", Message: " + message);
                    break;
                case SWFUpload.QUEUE_ERROR.ZERO_BYTE_FILE:
                    alert("Error Code: Zero byte file, File name: " + file.name + ", File size: " + file.size + ", Message: " + message);
                    break;
                case SWFUpload.QUEUE_ERROR.INVALID_FILETYPE:
                    alert("Error Code: Invalid File Type, File name: " + file.name + ", File size: " + file.size + ", Message: " + message);
                    break;
                default:
                    alert("Error Code: " + errorCode + ", File name: " + file.name + ", File size: " + file.size + ", Message: " + message);
                    break;
            }
        };
    </script>
</head>
<body>
     <form id="Form1" runat="server">
         <ext:ResourceManager ID="ResourceManager1" runat="server" />        
        
         <ext:GridPanel 
             ID="UploadGrid" 
             runat="server" 
             Width="610" 
             Height="300" 
             Frame="false">
             <Store>
                 <ext:Store ID="Store1" runat="server">
                     <Model>
                         <ext:Model ID="Model1" runat="server" IDProperty="id">
                             <Fields>
                                 <ext:ModelField Name="id" />
                                 <ext:ModelField Name="name" />
                                 <ext:ModelField Name="size" />
                                 <ext:ModelField Name="status" />
                                 <ext:ModelField Name="progress" />
                             </Fields>
                         </ext:Model>
                     </Model>
                 </ext:Store>
             </Store>
             <ColumnModel>
                 <Columns>
                     <ext:Column ID="Column1" runat="server" Text="File Name" DataIndex="name" Width="150" />
                     <ext:Column ID="Column2" runat="server" Text="Size" DataIndex="size" Width="60">
                         <Renderer Format="FileSize" />
                     </ext:Column>
                     <ext:Column ID="Column3" runat="server" Text="&nbsp;" DataIndex="status" Width="30">
                         <Renderer Fn="statusIconRenderer" />
                     </ext:Column>
                     <ext:Column ID="Column4" runat="server" Text="Status" DataIndex="status" Width="60" />
                     <ext:ProgressBarColumn ID="ProgressBarColumn1" runat="server" Text="progress" DataIndex="progress" />
                 </Columns>
             </ColumnModel>
             <TopBar>
                 <ext:Toolbar ID="Toolbar1" runat="server">
                     <Items>
                         <ext:MultiUpload 
                             ID="MultiUpload1" 
                             runat="server"
                             OnFileUpload="MultiUpload1_FileUpload"
                             FileDropAnywhere="true"
                             FileSizeLimit="15 MB"
                             FileTypes="*.*"
                             FileTypesDescription="All Files"
                             FileUploadLimit="100"
                             FileQueueLimit="0">
                             <Listeners>
                                 <SwfUploadLoadFailed Fn="loadFailed" />
                                 <FileSelected Fn="fileSelected" />
                                 <UploadStart Handler="updateRecord(file.id, 'status', 'Sending');" />
                                 <UploadProgress Handler="updateRecord(file.id, 'progress', bytesComplete / bytesTotal);" />
                                 <UploadComplete Handler="updateRecord(file.id, 'progress', 1 );updateRecord(file.id, 'status', 'Uploaded' );" />
                                 <UploadAborted Handler="updateRecord(file.id, 'status', 'Aborted');" />
                                 <UploadRemoved Handler="var store = this.up('grid').store; store.remove(store.getById(file.id));" />
                                 <UploadError Fn="uploadError" />
                                 <FileSelectionError Fn="fileSelectionError" />
                             </Listeners>
                         </ext:MultiUpload>

                         <ext:ToolbarSeparator />

                         <ext:Button ID="Button1" 
                             runat="server" 
                             Text="Start Upload" 
                             Icon="Tick" 
                             Handler="#{MultiUpload1}.startUpload();" 
                             />
                         <ext:Button ID="Button2" 
                             runat="server" 
                             Text="Abort" 
                             Icon="Decline" 
                             Handler="abortUpload" 
                             />
                         <ext:Button ID="Button3" 
                             runat="server" 
                             Text="Abort All" 
                             Icon="Decline" 
                             Handler="#{MultiUpload1}.abortAllUploads();" 
                             />
                         <ext:Button ID="Button4" 
                             runat="server" 
                             Text="Remove" 
                             Icon="Delete" 
                             Handler="removeUpload" 
                             />
                         <ext:Button ID="Button5" 
                             runat="server" 
                             Text="Remove All" 
                             Icon="Delete" 
                             Handler="#{MultiUpload1}.removeAllUploads();" 
                             />
                     </Items>
                 </ext:Toolbar>
             </TopBar>             
         </ext:GridPanel>
     </form>     
</body>
</html>
