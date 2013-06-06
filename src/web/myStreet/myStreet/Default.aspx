﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="myStreet.Default" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
        <meta name="apple-mobile-web-app-capable" content="yes">
        <title>Drag Feature Example</title>
        
        <link rel="stylesheet" href="../theme/default/style.css" type="text/css">
        <link rel="stylesheet" href="style.css" type="text/css">
        <style type="text/css">
            #controls {
                width: 512px;
            }
            #controlToggle {
                padding-left: 1em;
            }
            #controlToggle li {
                list-style: none;
            }
        </style>
        <script src="../OpenLayers.js"></script>
        <script type="text/javascript">
            var map, vectors, controls;
            function init() {
                map = new OpenLayers.Map('map');
                var wms = new OpenLayers.Layer.WMS("OpenLayers WMS",
                    "http://vmap0.tiles.osgeo.org/wms/vmap0?", { layers: 'basic' });

                // allow testing of specific renderers via "?renderer=Canvas", etc
                var renderer = OpenLayers.Util.getParameters(window.location.href).renderer;
                renderer = (renderer) ? [renderer] : OpenLayers.Layer.Vector.prototype.renderers;

                vectors = new OpenLayers.Layer.Vector("Vector Layer", {
                    renderers: renderer
                });

                map.addLayers([wms, vectors]);
                map.addControl(new OpenLayers.Control.LayerSwitcher());
                map.addControl(new OpenLayers.Control.MousePosition());

                controls = {
                    point: new OpenLayers.Control.DrawFeature(vectors,
                                OpenLayers.Handler.Point),
                    line: new OpenLayers.Control.DrawFeature(vectors,
                                OpenLayers.Handler.Path),
                    polygon: new OpenLayers.Control.DrawFeature(vectors,
                                OpenLayers.Handler.Polygon),
                    drag: new OpenLayers.Control.DragFeature(vectors)
                };

                for (var key in controls) {
                    map.addControl(controls[key]);
                }

                map.setCenter(new OpenLayers.LonLat(0, 0), 3);
                document.getElementById('noneToggle').checked = true;
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
        </script>
    </head>
    <body onload="init()">
        <h1 id="title">Drag Feature Example</h1>

        <div id="tags">
            point, line, linestring, polygon, digitizing, geometry, draw, drag
        </div>

        <p id="shortdesc">
            Demonstrates point, line and polygon creation and editing.
        </p>

        <div id="map" class="smallmap"></div>
        
        <div id="controls">
            <ul id="controlToggle">
                <li>
                    <input type="radio" name="type" value="none" id="noneToggle"
                           onclick="toggleControl(this);" checked="checked" />
                    <label for="noneToggle">navigate</label>
                </li>
                <li>
                    <input type="radio" name="type" value="point" id="pointToggle" onclick="toggleControl(this);" />
                    <label for="pointToggle">draw point</label>
                </li>
                <li>
                    <input type="radio" name="type" value="line" id="lineToggle" onclick="toggleControl(this);" />
                    <label for="lineToggle">draw line</label>
                </li>
                <li>
                    <input type="radio" name="type" value="polygon" id="polygonToggle" onclick="toggleControl(this);" />
                    <label for="polygonToggle">draw polygon</label>
                </li>
                <li>
                    <input type="radio" name="type" value="drag" id="dragToggle"
                           onclick="toggleControl(this);" />
                    <label for="dragToggle">drag feature</label>
                </li>
            </ul>
        </div>

        <div id="docs"></div>
    </body>
</html>
