<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="drag-feature.aspx.cs" Inherits="myStreet.example.drag_feature" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <title>Drag Feature Example</title>
    <link rel="stylesheet" href="../theme/default/style.css" type="text/css">
    <link rel="stylesheet" href="style.css" type="text/css">
    <style type="text/css">
        #controls
        {
            width: 512px;
        }
        #controlToggle
        {
            padding-left: 1em;
        }
        #controlToggle li
        {
            list-style: none;
        }
    </style>
    <script src="../Scripts/jquery-1.4.1.js" type="text/javascript"></script>
    <script src="../OpenLayers.js" type="text/javascript"></script>
    <script type="text/javascript">
            var map, vectors, controls, markers;
            var restHost = "http://localhost:49903/api/";
            function init() {
                OpenLayers.Control.Click = OpenLayers.Class(OpenLayers.Control, {                
                defaultHandlerOptions: {
                    'single': true,
                    'double': false,
                    'pixelTolerance': 0,
                    'stopSingle': false,
                    'stopDouble': false
                },

                initialize: function(options) {
                    this.handlerOptions = OpenLayers.Util.extend(
                        {}, this.defaultHandlerOptions
                    );
                    OpenLayers.Control.prototype.initialize.apply(
                        this, arguments
                    ); 
                    this.handler = new OpenLayers.Handler.Click(
                        this, {
                            'click': this.onClick,
                            'dblclick': this.onDblclick 
                        }, this.handlerOptions
                    );
                }, 

                onClick: function(evt) {
                    document.getElementById("create_ocurrence").setAttribute("style", "display: none;");
                    ResetNewOcurrence();
                },

                onDblclick: function(evt) {  
                    var position = map.getLonLatFromPixel(evt.xy);
                    map.setCenter(position);
                    addMarker(position);
                    document.getElementById("create_ocurrence").setAttribute("style", "display: inline;");
                    document.getElementById("coordenadas").value = position.toShortString();
                }   

              });
                

//                $.getJSON(restHost + 'utilizadores/', function(data) {
//                    console.log(data);
//                    alert(data);
//                });


//                var wms = new OpenLayers.Layer.WMS("OpenLayers WMS",
//                                    "http://vmap0.tiles.osgeo.org/wms/vmap0?", { layers: 'basic' });
                
//                var bounds = new OpenLayers.Bounds(-119191.40749999962, -300404.80399999936, 162129.08110000013, 276083.7674000006);
//                var options = {
//                    //maxExtent: bounds,
//                    // scales : [1000000, 500000, 250000, 100000, 50000, 25000, 10000, 5000, 1000, 500],
//                    //resolutions: [279.9998488001, 139.9999244, 69.9999622, 27.99998488, 13.99999244, 6.99999622, 2.799998488, 1.399999244, 0.2799998488, 0.1399999244],
//                    // resolutions : [140.0, 70.0, 27.999999999999996, 13.999999999999998, 6.999999999999999, 2.8, 1.4, 0.27999999999999997, 0.13999999999999999],
//                    //projection: "EPSG:3763",
//                    //displayProjection: new OpenLayers.Projection("EPSG:3763"),
//                    title: 'Mapa',
//                    units: 'm',
//                    allOverlays: true
                //                };

//                var datapoint = new OpenLayers.LonLat(-8.11544, 41.22868);
//                
//                var proj_1 = new OpenLayers.Projection("EPSG:4326");
//                var proj_2 = new OpenLayers.Projection("EPSG:900913");
                

//                map.setCenter(new OpenLayers.LonLat(-8.11544, 41.22868), 8);

                var options = {
//                    projection: "EPSG:3857",
//                    maxExtent: new OpenLayers.Bounds(-200000, -200000, 200000, 200000),
                    center:  new OpenLayers.LonLat(-8.11544, -44.22868),
                };

                var options2 = {
                    projection:  new OpenLayers.Projection('EPSG:4326'),
                    numZoomLevels: 18,
                    
                    layers: 'basic'                
                };

                wms = new OpenLayers.Layer.OSM("osm", "", options2);

                map = new OpenLayers.Map('map',options);

                 // allow testing of specific renderers via "?renderer=Canvas", etc
                var renderer = OpenLayers.Util.getParameters(window.location.href).renderer;
                renderer = (renderer) ? [renderer] : OpenLayers.Layer.Vector.prototype.renderers;

                vectors = new OpenLayers.Layer.Vector("Vector Layer", {
                    renderers: renderer
                });

                map.addLayers([wms, vectors]);
                map.addControl(new OpenLayers.Control.LayerSwitcher());
                map.addControl(new OpenLayers.Control.MousePosition());
                var Navigation = new OpenLayers.Control.Navigation({
                    defaultDblClick: function(event) { return; }
                });

                map.addControl(Navigation);

                 controls = {
                    point: new OpenLayers.Control.DrawFeature(vectors,
                                OpenLayers.Handler.Point),
                    line: new OpenLayers.Control.DrawFeature(vectors,
                                OpenLayers.Handler.Path),
                    polygon: new OpenLayers.Control.DrawFeature(vectors,
                                OpenLayers.Handler.Polygon),
                    drag: new OpenLayers.Control.DragFeature(vectors),
                    click: new OpenLayers.Control.Click({
                        handlerOptions: {
                            "single": true,
                            "double": true
                        }
                    })
                 };

                for (var key in controls) {
                    map.addControl(controls[key]);
                }

                // add the custom editing toolbar
                var panel = new OpenLayers.Control.Panel({
                    displayClass: 'customEditingToolbar',
                    allowDepress: true
                });

                // 'map' is your map created using new OpenLayers.Map(options)

                markers = new OpenLayers.Layer.Markers( "Markers" );
                markers.id = "Markers";
                map.addLayer(markers);

                loadMarkers();
//                map.events.register("double", map, function(e) {
//                    //var position = this.events.getMousePosition(e);
//                    var position = map.getLonLatFromPixel(e.xy);
//                    var size = new OpenLayers.Size(21,25);
//                    var offset = new OpenLayers.Pixel(-(size.w/2), -size.h);
//                    var icon = new OpenLayers.Icon('/Scripts/img/marker.png', size, offset);   
//                    var markerslayer = map.getLayer('Markers');
//                    
//                    markerslayer.addMarker(new OpenLayers.Marker(position,icon));
//                });
                map.zoomTo(10);
                ResetNewOcurrence();
//                document.getElementById('noneToggle').checked = true;
                toggleControlAux('click');

                $('#new_ocurrence').submit(function () {
                    SubmeterOcorrencia();
                    return false;
                });
            }

            function addMarker(position) {
                    var position;
                    var size = new OpenLayers.Size(21,25);
                    var offset = new OpenLayers.Pixel(-(size.w/2), -size.h);
                    var icon = new OpenLayers.Icon('/Scripts/img/marker.png', size, offset);   
                    var markerslayer = map.getLayer('Markers');
                    
                    var marker = new OpenLayers.Marker(position,icon,null);

                    //here add mouseover event
                        marker.events.register('mouseover', marker, function(evt) {
                           map.addPopup(popup);
                           popup.show();
                        });
                        //here add mouseout event
                        marker.events.register('mouseout', marker, function(evt) {popup.hide();});
                        markerslayer.addMarker(marker);
                    
//                    var popup = new OpenLayers.Popup.FramedCloud("Popup",
//                                position,
//                                null,
//                                '<div>Hello World! Put your html here</div>',
//                                null,
//                                false);
//                    map.addPopup(popup);
//                    popup.show();
            }

            function ResetNewOcurrence(){
                var markerslayer = map.getLayer('Markers');
                document.getElementById("create_ocurrence").setAttribute("style", "display: none;");
                document.getElementById("descricao").value = "";
                document.getElementById("morada").value = "";
                document.getElementById("localidade").value = "";
                document.getElementById("coordenadas").value = "";
                document.getElementById("fotografia").value = "";

            }

            function loadMarkers() {
                    var position;
                    var size = new OpenLayers.Size(21,25);
                    var offset = new OpenLayers.Pixel(-(size.w/2), -size.h);
                    var icon = new OpenLayers.Icon('/Scripts/img/marker.png', size, offset);   
                    var markerslayer = map.getLayer('Markers');
                    var ocorrencias = getOcorrencias();
                    var marker;

                    for (ocor in ocorrencias)
                    {
                        position = OpenLayers.LonLat.fromString(ocorrencias[ocor].Coordenadas);
                        marker = new OpenLayers.Marker(position,icon,ocorrencias[ocor]);

//                        marker.events.register("click", marker, (function(e){
//                             popup = new OpenLayers.Popup.FramedCloud("chicken",
//                                        marker.lonlat,
//                                        new OpenLayers.Size(200, 200),
//                                        "example popup",
//                                        null, true);

//                            map.addPopup(popup);
//                        }));

                         var popup = new OpenLayers.Popup.FramedCloud("Popup",
                                marker.lonlat,
                                null,
                                buildOcorrencyInfo(ocorrencias[ocor]),
//                                '<div>Hello World! Put your html here</div>',
                                null,
                                false);


                       //here add mouseover event
                        marker.events.register('mouseover', marker, function(evt) {
                           map.addPopup(popup);
                           popup.show();
                        });
                        //here add mouseout event
                        marker.events.register('mouseout', marker, function(evt) {popup.hide();});
                        markerslayer.addMarker(marker);
                    }
            }

            function buildOcorrencyInfo(oc){
                var comentarios = getComentarios(oc.Id);
                
                var div = document.createElement('div');
                div.innerHTML = "<h1>" + oc.Descricao + "</h1>";
                // set style
                div.style.color = 'red';
                div.style.width = '300px';
                div.style.height = '300px';
                // better to use CSS though - just set class
                div.setAttribute('class', 'popup'); // and make sure myclass has some styles in css

                for (var com in comentarios){
                    var div2 = document.createElement('div');

                    div2.innerHTML = comentarios[com].Conteudo;
                    // set style
                    div2.style.width = '80%';
                    div2.style.height = '80%';
                    div2.style.position = 'center';
                    div2.setAttribute('class', 'popup_comments'); // and make sure myclass has some styles in css
                    
                    div.appendChild(div2);
                }
                console.log(div.outerHTML);
                return div.outerHTML;
            }


            function getOcorrencias(){
                    var ocorrencias = (function () {
                    var ocorrencias = null;
                    $.ajax({
            'async': false,
            'global': false,
            'url': restHost + 'ocorrencias/',
            'dataType': "json",
            'success': function (data) {
                ocorrencias = $.parseJSON(JSON.stringify(data));
                }
                });
            return ocorrencias;
            })()
        return ocorrencias; 
            }

             function getComentarios(ocID){
                    var comentarios = (function () {
                    var comentarios = null;
                    $.ajax({
                       'async': false,
                       'global': false,
                       'url': restHost + 'comentarios/' + '?ocorrenciaId=' + ocID,
                       'dataType': "json",
                       'success': function (data) {
                            comentarios = $.parseJSON(JSON.stringify(data));
                        }
                    });
                    return comentarios;
                })()
            return comentarios; 
            }

            function toggleControl(element) {
                for (key in controls) {
                    var control = controls[key];
                    if (element.value == key && element.checked) {
                        control.activate();
                    } else {
                        control.deactivate();
                    }
                }
            }

            function toggleControlAux(elm) {
                for (key in controls) {
                    var control = controls[key];
                    if (key == elm){
                        control.activate();
                    } else {
                        control.deactivate();
                    }
                }
            }

            function SubmeterOcorrencia(){
                    var oc = { 
                        Estado : "Em estudo",
                        Coordenadas : document.getElementById("coordenadas").value ,
                        Descricao : document.getElementById("descricao").value,
                        LocalidadeID : 1,
                        Morada : document.getElementById("morada").value,
                        UtilizadorID : 1
                    }
                var json = JSON.stringify(oc);

                console.log(json);

                addOcorrencia(json);

                document.getElementById("create_ocurrence").setAttribute("style", "display: none;");
                return false;
            }

            function addOcorrencia(json){
                    $.post(restHost + 'ocorrencias/', json, "", "json");

//                    var request;
//                    request = $.ajax({
//                       'type': "POST",
//                       'async': false,
//                       'global': false,
//                       'url': restHost + 'ocorrencias/',
//                       'dataType': "json",
//                       'data' : json
//                    });

//                       // callback handler that will be called on success
//                    request.done(function (response, textStatus, jqXHR){
//                        // log a message to the console
//                        console.log("Hooray, it worked!");
//                    });

//                // callback handler that will be called on failure
//                request.fail(function (jqXHR, textStatus, errorThrown){console.log("Deu erro!");  });
             }

    </script>
</head>
<body onload="init()">
    <h1 id="title">
        myStreet</h1>
    <div id="map" class="smallmap">
    </div>
    <div id="create_ocurrence" class="create_ocurrence" style="display: none;">
        <form id="new_ocurrence" class="new_ocurrence" runat="server">
        <fieldset>
          <h2><legend>Adicionar Ocorrência</legend></h2>
          <div>
            <label for="Descricao">Descrição:</label>
            <input type="text" id="descricao" name="Descricao" value="" runat="server" />
          </div>
          <div>
            <label for="Morada">Morada:</label>
            <input type="text" id="morada" name="Morada" value="" runat="server" />
          </div>
          <div>
            <label for="Localidade">Localidade:</label>
            <input id="localidade" type="text" name="Localidade" value="" runat="server" />
          </div>
          <div>
            <label for="Coordenadas">Coordenadas:</label>
            <input id="coordenadas" type="text" name="Coordenadas" readonly="readonly" value="" runat="server" />
          </div>
          <div>
            <label for="Fotografia">Fotografia:</label>
            <input type="text" id="fotografia" name="Fotografia" value="" runat="server" />
            <input type="submit" value="Procurar"/>
          </div>
          <div>
            <label>&nbsp;</label>
            <input type="submit" value="Criar" class="submit"/>
            <%--<asp:Button type="submit" Text="Criar" class="submit" onclick="SubmeterOcorrencia" runat="server" />--%>
          </div>
        </fieldset>
      </form>   
    </div>


    <%--<div id="controls">
        <ul id="controlToggle">
            <li>
                <input type="radio" name="type" value="none" id="noneToggle" onclick="toggleControl(this);"
                    checked="checked" />
                <label for="noneToggle">
                    navigate</label>
            </li>
            <li>
                <input type="radio" name="type" value="point" id="pointToggle" onclick="toggleControl(this);" />
                <label for="pointToggle">
                    draw point</label>
            </li>
            <li>
                <input type="radio" name="type" value="line" id="lineToggle" onclick="toggleControl(this);" />
                <label for="lineToggle">
                    draw line</label>
            </li>
            <li>
                <input type="radio" name="type" value="polygon" id="polygonToggle" onclick="toggleControl(this);" />
                <label for="polygonToggle">
                    draw polygon</label>
            </li>
            <li>
                <input type="radio" name="type" value="drag" id="dragToggle" onclick="toggleControl(this);" />
                <label for="dragToggle">
                    drag feature</label>
            </li>
            <li>
                <input type="radio" name="type" value="click" id="clickToggle" onclick="toggleControl(this);" />
                <label for="clickToggle">
                    click feature</label>
            </li>
        </ul>
    </div>--%>
    <div id="docs">
    </div>
</body>
</html>
