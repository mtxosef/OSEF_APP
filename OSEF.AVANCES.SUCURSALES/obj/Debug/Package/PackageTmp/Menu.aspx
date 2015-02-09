<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="OSEF.AVANCES.SUCURSALES.Menu" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width" />
    <title></title>
    <link rel="stylesheet" type="text/css" href="assets/css/bootmetro.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/bootmetro-responsive.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/bootmetro-icons.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/bootmetro-ui-light.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/demo.css" />
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
                                        <img src="assets/img/revisiones.png" alt="Revisiones" />
                                        <div class="text-header">Avances</div>
                                    </div>
                                </a>

                                <a class="tile wide imagetext wideimage bg-color-green" href="#">
                                    <img src="assets/img/search.png" alt="Explorador de revisiones" class="img-large" />
                                    <div class="textover-wrapper transparent">
                                        <div class="text2">Explorador de avances</div>
                                    </div>
                                </a>

                            </div>
                        </div>
                        <!-- Fin Primer pagina Procesos -->

                        <!-- Segunda pagina Catálogos -->
                        <div class="panorama-section">
                            <h2>Catálogos</h2>
                            <div class="tile-column-span-2">                            
                                <a class="tile wide imagetext wideimage bg-color-blue" id="categorias" href="#">
                                    <img src="assets/img/categorias.png" alt="Categorías" />
                                    <div class="textover-wrapper transparent">
                                        <div class="text2">Categorías</div>
                                    </div>
                                </a>
                            
                                <a class="tile wide imagetext wideimage bg-color-green" id="subcategorias" href="#">
                                    <img src="assets/img/subcategorias.png" alt="Sub Categorías" />
                                    <div class="textover-wrapper transparent">
                                        <div class="text2">Subcategorías</div>
                                    </div>
                                </a>

                                <a class="tile square bg-color-red" id="proveedores" href="#">
                                    <img src="assets/img/provedores.png" alt="proveedores" />
                                    <div class="textover-wrapper transparent">
                                        <div class="text2">Proveedores</div>
                                    </div>
                                </a>
                                
                                <a class="tile square image" href="#" id="sucursal">
                                    <img src="assets/img/sucursales.png" alt="Conceptos" />
                                    <div class="textover-wrapper transparent">
                                        <div class="text2">Sucursales</div>
                                    </div>
                                </a>
                            </div>
                            <div class="tile-column-span-1">
                                <a class="tile squarepeek bg-color-orange" href="#" id="conceptos">
                                   <img src="assets/img/conceptos.png" alt="Conceptos" />
                                    <div class="text-inner">
                                        <div class="text4">Conceptos</div>
                                    </div>
                                </a>
                            </div>
                            <%--  Division Extra--%>
                            <div class="tile-column-span-2">
                                <a class="tile square image bg-color-red" id="municipios" href="#">
                                    <img src="assets/img/municipio.png" alt="Municipios" />
                                    <div class="textover-wrapper transparent">
                                        <div class="text2">Municipios</div>
                                    </div>
                                </a>
                                <a class="tile square image" id="estados" href="#">
                                    <img src="assets/img/edos.png" alt="" />
                                    <div class="textover-wrapper transparent">
                                        <div class="text2">Estados</div>
                                    </div>
                                </a>
                            </div>
                        
                            <div class="tile-column-span-1">
                                <a class="tile square image bg-color-yellow" id="codigospostales" href="#">
                                    <img src="assets/img/postal.png" alt="Códigos Postales" />
                                    <div class="textover-wrapper transparent">
                                        <div class="text2">Códigos Postales</div>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <!-- Fin Segunda pagina Catálogos -->

                        <!-- Tercera pagina Reportes -->
                        <div class="panorama-section tile-span-4">
                            <h2>Configuración</h2>

                            <div class="tile-column-span-2">
                                <a class="tile wide imagetext wideimage bg-color-red"  id="gruposMenu" href="#">
                                    <img src="assets/img/groupsMenu.png" alt="Grupos Menú" />
                                    <div class="textover-wrapper  transparent">
                                        <div class="text2">Grupos Menú</div>
                                    </div>
                                </a>
                        
                                <a class="tile wide imagetext wideimage bg-color-green" id="menus" href="#">
                                    <img src="assets/img/Menus.png" alt="Menú" />
                                    <div class="textover-wrapper transparent">
                                        <div class="text2">Menú</div>
                                    </div>
                                </a>                          
                            </div>

                            <div class="tile-column-span-1">
                                <a class="tile squarepeek bg-color-purple" href="#" id="usuarios">
                                    <img src="assets/img/usuarios.png" alt="Usuarios" />
                                    <div class="text-inner">
                                        <div class="text4">Usuarios</div>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <!-- Fin Tercera pagina Reportes -->
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