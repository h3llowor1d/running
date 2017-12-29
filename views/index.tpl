<!DOCTYPE html>

<html>
<head>
  <title>Beego</title>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">

  <style type="text/css">
    *,body {
      margin: 0px;
      padding: 0px;
    }

    body {
      margin: 0px;
      font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
      font-size: 14px;
      line-height: 20px;
      background-color: #fff;
    }

    header,
    footer {
      width: 960px;
      margin-left: auto;
      margin-right: auto;
    }


    header {
      padding: 100px 0;
    }

    footer {
      line-height: 1.8;
      text-align: center;
      padding: 50px 0;
      color: #999;
    }

    .description {
      text-align: center;
      font-size: 16px;
    }

    a {
      color: #444;
      text-decoration: none;
    }

    .backdrop {
      position: absolute;
      width: 100%;
      height: 100%;
      box-shadow: inset 0px 0px 100px #ddd;
      z-index: -1;
      top: 0px;
      left: 0px;
    }
  </style>

    <script type="text/javascript" src = 'http://webapi.amap.com/maps?v=1.3&key=2be7a8b8313d53298b3d43d856d1bea4'></script>
    <script type="text/javascript" src="http://cache.amap.com/lbs/static/addToolbar.js"></script>
</head>

<body>
    <div id="mapDiv" style="width: 90%;height: 600px;"></div>

  <script type="text/javascript">
      var map = new AMap.Map('mapDiv', {
          mapStyle: 'amap://styles/d2a6d19f68075de97cbef5a6f6a29cac'//样式URL
      });

      map.plugin(["AMap.MouseTool"],function(){
          var mousetool = new AMap.MouseTool(map);
          mousetool.marker(); //使用鼠标工具，在地图上画标记点
      });

      var menu=new ContextMenu(map);
      function ContextMenu(map) {
          var me = this;
          this.mouseTool = new AMap.MouseTool(map); //地图中添加鼠标工具MouseTool插件
          this.contextMenuPositon = null;
          var content = [];
          content.push("<div>");
          content.push("    <ul class='context_menu'>");
          content.push("        <li onclick='menu.addMarkerMenu()'>添加标记</li>");
          content.push("    </ul>");
          content.push("</div>");
          this.contextMenu = new AMap.ContextMenu({isCustom: true, content: content.join('')});//通过content自定义右键菜单内容
          //地图绑定鼠标右击事件——弹出右键菜单
          map.on('rightclick', function(e) {
              me.contextMenu.open(map, e.lnglat);
              me.contextMenuPositon = e.lnglat; //右键菜单位置
          });
      }

      ContextMenu.prototype.addMarkerMenu=function () {  //右键菜单添加Marker标记
          this.mouseTool.close();
          var marker = new AMap.Marker({
              map: map,
              draggable: true,  //是否可拖动
              position: this.contextMenuPositon //基点位置
          });
          marker.setLabel({//label默认蓝框白底左上角显示，样式className为：amap-marker-label
              offset: new AMap.Pixel(20, 20),//修改label相对于maker的位置
              content: "我是marker的label标签"
          });
          this.contextMenu.close();
      }
  </script>
</body>
</html>
