<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Menu2.aspx.cs" Inherits="OSEF.AVANCES.SUCURSALES.Menu2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width" />
    <title></title>
    <link rel="stylesheet" type="text/css" href="assets/css/bootmetro2.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/bootmetro-responsive.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/bootmetro-icons.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/bootmetro-ui-light.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/demo2.css" />
    <script type="text/javascript" src="js/libs/jquery-2.0.3.min.js"></script>
    <script type='text/javascript' src="js/menu-usuario.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="contenedor">
            <div id="wrap">
                <!-- Header -->
                <div class="metro panorama">
                    <div class="panorama-sections">
                        <!-- Primer pagina  Procesos -->
                        <div class="panorama-section">
                            <h2>Procesos</h2>
                            <div class="tile-column-span-2">
                                <a class="tile widepeek" href="#" id="avances">
                                    <div class="tile wide image">
                                        <img src="assets/img/menu-ahorros.png" alt="Ahorros" />
                                        <div class="text-header">Ahorros</div>
                                    </div>
                                </a>

                                <a class="tile wide imagetext wideimage bg-color-green" href="#">
                                    <img src="assets/img/menu-inversiones.png" alt="Inversiones" class="img-large" />
                                    <div class="textover-wrapper transparent">
                                        <div class="text2">Inversiones</div>
                                    </div>
                                </a>

                               
                            </div>


                             <div class="tile-column-span-2">                            
                           

                             <a class="tile square image bg-color-yellow" id="A6" href="#">
                                    <img src="assets/img/menu-prestamos.png" alt="Préstamos" />
                                    <div class="textover-wrapper transparent">
                                        <div class="text2">Préstamos</div>
                                    </div>
                                </a>
                                
                                <a class="tile square image" href="#" id="A7">
                                    <img src="assets/img/menu-conta.png" alt="Contabilidad" />
                                    <div class="textover-wrapper transparent">
                                        <div class="text2">Contabilidad</div>
                                    </div>
                                </a>

                                 

                                 <a class="tile wide imagetext wideimage bg-color-gray" href="#">
                                    <img src="assets/img/menu-corte.png" alt="Corte de Caja" class="img-large" />
                                    <div class="textover-wrapper transparent">
                                        <div class="text2">Corte de caja</div>
                                    </div>
                                </a>
                            </div>



                        </div>
                        <!-- Fin Primer pagina Procesos -->

                        <!-- Segunda pagina Catálogos -->
                        <div class="panorama-section">
                            <h2>Catálogos</h2>
                            <div class="tile-column-span-2">                            
                                <a class="tile wide imagetext wideimage bg-color-blue" id="articulos" href="#">
                                    <img src="assets/img/menu-articulo.png" alt="Artículos" />
                                    <div class="textover-wrapper transparent">
                                        <div class="text2">Artículos</div>
                                    </div>
                                </a>
                            
                                <a class="tile wide imagetext wideimage bg-color-green" id="socios" href="#">
                                    <img src="assets/img/menu-socios.png" alt="Socios" />
                                    <div class="textover-wrapper transparent">
                                        <div class="text2">Socios</div>
                                    </div>
                                </a>

                                <a class="tile square bg-color-red" id="cuentascontables" href="#">
                                    <img src="assets/img/menu-cuentas.png" alt="Cuentas Contables" />
                                    <div class="textover-wrapper transparent">
                                        <div class="text2">Cuentas Contables</div>
                                    </div>
                                </a>
                                
                                <a class="tile square image" href="#" id="conceptos2">
                                    <img src="assets/img/menu-conceptos.png" alt="Conceptos" />
                                    <div class="textover-wrapper transparent">
                                        <div class="text2">Conceptos Pólizas</div>
                                    </div>
                                </a>
                            </div>
                            <div class="tile-column-span-1">
                                <a class="tile squarepeek bg-color-orange" href="#" id="profesiones">
                                    <img src="assets/img/menu-profesiones.png" alt="Profesiones" />
                                    <div class="text-inner">
                                        <div class="text4">Profesiones</div>
                                    </div>
                                </a>
                                <a class="tile square image bg-color-green" id="finalidades" href="#">
                                    <img src="assets/img/Search.png" alt="Profesiones" />
                                    <div class="textover-wrapper transparent">
                                        <div class="text2">Finalidades</div>
                                    </div>
                                </a>
                            </div>
                            <%--  Division Extra--%>
                            <div class="tile-column-span-2">
                                <a class="tile square image bg-color-red" id="municipios2" href="#">
                                    <img src="assets/img/municipio.png" alt="Municipios" />
                                    <div class="textover-wrapper transparent">
                                        <div class="text2">Municipios</div>
                                    </div>
                                </a>
                                <a class="tile square image" id="estados2" href="#">
                                    <img src="assets/img/edos.png" alt="" />
                                    <div class="textover-wrapper transparent">
                                        <div class="text2">Estados</div>
                                    </div>
                                </a>
                                 <a class="tile wide imagetext wideimage bg-color-green" id="A1" href="#">
                                    <img src="assets/img/menu-solicitudes.png" alt="Solicitudes" />
                                    <div class="textover-wrapper transparent">
                                        <div class="text2">Solicitudes Préstamos</div>
                                    </div>
                                </a>
                                

                            </div>
                        
                            <div class="tile-column-span-1">
                                <a class="tile square image bg-color-yellow" id="codigospostales2" href="#">
                                    <img src="assets/img/postal.png" alt="Códigos Postales" />
                                    <div class="textover-wrapper transparent">
                                        <div class="text2">Códigos Postales</div>
                                    </div>
                                </a>

                                <a class="tile square image" id="A2" href="#">
                                    <img src="assets/img/menu-certificados.png" alt="" />
                                    <div class="textover-wrapper transparent">
                                        <div class="text2">Certificados de inversión </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <!-- Fin Segunda pagina Catálogos -->

                        <!-- Tercera pagina Reportes -->
                        <div class="panorama-section tile-span-4">
                            <h2>Reportes</h2>
                             <div class="tile-column-span-2">
                                <a class="tile wide imagetext wideimage bg-color-red"  id="A9" href="#">
                                    <img src="assets/img/groupsMenu.png" alt="Grupos Menú" />
                                    <div class="textover-wrapper  transparent">
                                        <div class="text2">Estado de resultados</div>
                                    </div>
                                </a>
                        
                                <a class="tile wide imagetext wideimage bg-color-green" id="A10" href="#">
                                    <img src="assets/img/menu-balanza.png" alt="Balanza" />
                                    <div class="textover-wrapper transparent">
                                        <div class="text2">Balanza de comprobación</div>
                                    </div>
                                </a> 
                                 <a class="tile square image bg-color-red" id="A16" href="#">
                                    <img src="assets/img/menu-auxiliar.png" alt="Auxiliar" />
                                    <div class="textover-wrapper transparent">
                                        <div class="text2">Auxiliar de mayor</div>
                                    </div>
                                </a>
                                 <a class="tile square image bg-color-yellow" id="A17" href="#">
                                    <img src="assets/img/menu-saldos.png" alt="Saldos" />
                                    <div class="textover-wrapper transparent">
                                        <div class="text2">Saldos</div>
                                    </div>
                                </a>
                                                         
                            </div>

                            <div class="tile-column-span-1">
                                <a class="tile squarepeek bg-color-purple" href="#" id="A11">
                                    <img src="assets/img/menu-mayor.png" alt="Mayor" />
                                    <div class="text-inner">
                                        <div class="text4">Libros de mayor</div>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <!-- Fin Tercera pagina Reportes -->
                        <!--  4ta pagina Herramientas -->
                        <div class="panorama-section tile-span-4">
                            <h2>Herramientas</h2>

                            <a class="tile wide imagetext wideimage bg-color-blue" id="A4" href="#">
                                    <img src="assets/img/  .png" alt="" />
                                    <div class="textover-wrapper transparent">
                                        <div class="text2">Herramienta1</div>
                                    </div>
                                </a>
                            
                                <a class="tile wide imagetext wideimage bg-color-green" id="A5" href="#">
                                    <img src="assets/img/  .png" alt=" " />
                                    <div class="textover-wrapper transparent">
                                        <div class="text2">Herramienta2</div>
                                    </div>
                                </a>

                                <a class="tile square bg-color-red" id="A8" href="#">
                                    <img src="assets/img/  .png" alt="" />
                                    <div class="textover-wrapper transparent">
                                        <div class="text2">Herramienta3</div>
                                    </div>
                                </a>
                                
                                <a class="tile square image" href="#" id="A12">
                                    <img src="assets/img/.png" alt="" />
                                    <div class="textover-wrapper transparent">
                                        <div class="text2">Herramienta4</div>
                                    </div>
                                </a>


                        </div>
                        <!-- Fin 4ta pagina Herramientas -->

                         <!-- 5ta pagina Reportes -->
                        <div class="panorama-section tile-span-4">
                            <h2>Configuración</h2>

                            
                            <div class="tile-column-span-2">
                                <a class="tile wide imagetext wideimage bg-color-red"  id="gruposMenu2" href="#">
                                    <img src="assets/img/groupsMenu.png" alt="Grupos Menú" />
                                    <div class="textover-wrapper  transparent">
                                        <div class="text2">Grupos Menú</div>
                                    </div>
                                </a>
                        
                                <a class="tile wide imagetext wideimage bg-color-green" id="menus2" href="#">
                                    <img src="assets/img/Menus.png" alt="Menú" />
                                    <div class="textover-wrapper transparent">
                                        <div class="text2">Menú</div>
                                    </div>
                                </a>                          
                            </div>

                             
                            <div class="tile-column-span-1">
                                <a class="tile squarepeek bg-color-purple" href="#" id="usuarios2">
                                    <img src="assets/img/usuarios.png" alt="Usuarios" />
                                    <div class="text-inner">
                                        <div class="text4">Usuarios</div>
                                    </div>
                                </a>
                            </div>
                        </div>
                          <!-- Fin 5ta pagina Reportes -->

                    </div>
                </div>
                <a id="panorama-scroll-prev" href="#"> <img src="assets/img/controles/left-nav.png" height="22px" width="22px" class="scrollhr" alt="Next" /></a>
                <a id="panorama-scroll-next" href="#"> <img src="assets/img/controles/right-nav.png" height="22px" width="22px" class="scrollhr" alt="Next" /></a>
            </div>
        </div>
        <script type="text/javascript" src='assets/js/jquery-1.10.0.js'></script>
        <script type="text/javascript" src="assets/js/bootmetro-panorama.js"></script>
        <script type="text/javascript" src="assets/js/bootmetro-pivot.js"></script>
        <script type="text/javascript" src="assets/js/bootmetro-charms.js"></script>
        <script type="text/javascript" src="assets/js/jquery.mousewheel.min.js"></script>
        <script type="text/javascript" src="assets/js/jquery.touchSwipe.min.js"></script>
        <script type="text/javascript">
            $('.panorama').panorama({
                //nicescroll: false,
                showscrollbuttons: true,
                keyboard: true,
                parallax: true
            });

            //      $(".panorama").perfectScrollbar();

            $('#pivot').pivot();
        </script>
    </form>
</body>
</html>
