const fs = require("fs");
const path = require("path");

const root = path.resolve(__dirname, "..");
const www = path.join(root, "apktool_out", "assets", "apps", "__UNI__FB0AA52", "www");
const servicePath = path.join(www, "app-service.js");
const viewBundlePath = path.join(www, "app-view.js");
const cssPath = path.join(www, "view.css");
const androidManifestPath = path.join(root, "apktool_out", "AndroidManifest.xml");
const manifestPath = path.join(root, "apktool_out", "assets", "data", "dcloud_control.xml");
const appsManifestPath = path.join(www, "manifest.json");
const apktoolYmlPath = path.join(root, "apktool_out", "apktool.yml");

function read(file) {
  return fs.readFileSync(file, "utf8");
}

function writeIfChanged(file, next) {
  const current = read(file);
  if (current !== next) {
    fs.writeFileSync(file, next, "utf8");
    console.log(`updated ${path.relative(root, file)}`);
  } else {
    console.log(`unchanged ${path.relative(root, file)}`);
  }
}

function replaceRequired(source, pattern, replacement, label) {
  const next = source.replace(pattern, replacement);
  if (next === source) {
    throw new Error(`Could not patch ${label}`);
  }
  return next;
}

function compactCss(source) {
  return source
    .replace(/\/\*(?! micro-drift-appview-v1| \/micro-drift-appview-v1)[\s\S]*?\*\//g, "")
    .replace(/\s+/g, " ")
    .replace(/\s*([{}:;,>])\s*/g, "$1")
    .trim();
}

function stripAppendedCss(source, markers) {
  let cutAt = -1;
  for (const marker of markers) {
    const index = source.indexOf(marker);
    if (index >= 0 && (cutAt === -1 || index < cutAt)) {
      cutAt = index;
    }
  }
  return cutAt >= 0 ? source.slice(0, cutAt).trimEnd() + "\n" : source;
}

function replaceAppViewBlock(source, nextBlock) {
  const markerPairs = [
    ["/* micro-rc-appview-m3 */", "/* /micro-rc-appview-m3 */"],
    ["/* micro-drift-appview-v1 */", "/* /micro-drift-appview-v1 */"],
  ];
  for (const [startMarker, endMarker] of markerPairs) {
    const start = source.indexOf(startMarker);
    if (start >= 0) {
      const end = source.indexOf(endMarker, start);
      if (end === -1) {
        throw new Error(`Found ${startMarker} without ${endMarker}`);
      }
      return source.slice(0, start) + nextBlock + source.slice(end + endMarker.length);
    }
  }

  const appViewNeedle = ".content .box .policy{position:fixed;top:calc(140 * 100 / var(--base-rpx) * 1vmin);height:100vh}";
  return replaceRequired(source, appViewNeedle, appViewNeedle + nextBlock, "app-view Micro Drift CSS");
}

function walkFiles(dir, extensions) {
  if (!fs.existsSync(dir)) {
    return [];
  }
  const result = [];
  for (const entry of fs.readdirSync(dir, { withFileTypes: true })) {
    const fullPath = path.join(dir, entry.name);
    if (entry.isDirectory()) {
      result.push(...walkFiles(fullPath, extensions));
    } else if (extensions.has(path.extname(entry.name).toLowerCase())) {
      result.push(fullPath);
    }
  }
  return result;
}

function stripChineseTraces(source) {
  const translations = [
    ["完成", "Done"],
    ["取消", "Cancel"],
    ["识别失败", "Recognition failed"],
    ["轻触照亮", "Tap to turn light on"],
    ["轻触关闭", "Tap to turn light off"],
    ["高德地图", "AutoNavi Maps"],
    ["百度地图", "Baidu Maps"],
    ["腾讯地图", "Tencent Maps"],
    ["谷歌地图", "Google Maps"],
    ["苹果地图", "Apple Maps"],
    ["我的位置", "My Location"],
    ["请求的页面无法打开", "The requested page cannot be opened"],
    ["请求的页面", "The requested page"],
    ["无法打开", "cannot be opened"],
    ["禁止选择", "Disable selection"],
    ["获取错误信息", "Get error information"],
    ["事件处理", "event handler"],
    ["返回键", "back button"],
    ["处理", "handle"],
  ];
  let next = source;
  for (const [from, to] of translations) {
    next = next.split(from).join(to);
  }
  next = next.replace(/\\u([0-9a-fA-F]{4})/g, (match, hex) => {
    const codepoint = Number.parseInt(hex, 16);
    return codepoint >= 0x3400 && codepoint <= 0x9fff ? "A" : match;
  });
  return next.replace(/[\u3400-\u9fff]+/g, "English");
}

let service = read(servicePath);

service = service.replace(
  /num_speed:\d,img_speed:"\/static\/btn_speed\d\.png",speedMode:"[01]{2}"/,
  'num_speed:3,img_speed:"/static/btn_speed3.png",speedMode:"00"'
);
service = service.replace(/device:"HB TOYS64",is4Chan:!1/g, 'device:"HB TOYS64",is4Chan:!0');
service = service.replace(/this\.is4Chan=r\.globalData\.is4Chan/g, "this.is4Chan=!0");
service = service.replace(/remote",{attrs:{ble_on:t\.ble_on,/g, 'remote",{attrs:{is4Chan:!0,ble_on:t.ble_on,');
service = service.replace(/style:t\._\$s\(1,"s",t\.is4Chan\?"":"justify-content:center;align-items: center;"\)/g, 'style:t._$s(1,"s","")');
service = service.replace(/value:t\._\$s\(5,"v-show",t\.is4Chan\),expression:"_\$s\(5,'v-show',is4Chan\)"/g, 'value:!0,expression:"true"');

const switchStart = service.indexOf("switchSpeed:function(){");
const cruiseMarker = "},cruiseEnd:function";
if (switchStart === -1) {
  throw new Error("Could not find switchSpeed");
}
const switchEnd = service.indexOf(cruiseMarker, switchStart);
if (switchEnd === -1) {
  throw new Error("Could not find cruiseEnd after switchSpeed");
}
const switchReplacement =
  'switchSpeed:function(){this.num_speed=this.num_speed%3+1,1==this.num_speed?(this.img_speed="/static/btn_speed1.png",this.speedMode="10",uni.showToast({icon:"none",title:"Speed: Low",duration:650})):2==this.num_speed?(this.img_speed="/static/btn_speed2.png",this.speedMode="01",uni.showToast({icon:"none",title:"Speed: Medium",duration:650})):(this.img_speed="/static/btn_speed3.png",this.speedMode="00",uni.showToast({icon:"none",title:"Speed: High",duration:650}))}';
service = service.slice(0, switchStart) + switchReplacement + service.slice(switchEnd + 1);

service = service.replace(
  /setInterval\(\(function\(\)\{e\.sendOrder\(\)\}\),\d+\)/g,
  "setInterval((function(){e.sendOrder()}),55)"
);

if (!service.includes("HB TOYS64")) {
  console.warn("warning: HB TOYS64 string was not found; leaving discovery logic unchanged");
}
if (service.includes("pwmTick")) {
  throw new Error("PWM experiment code is still present. Refusing to build a capped/full-stop variant.");
}

writeIfChanged(servicePath, service);

const styleMarker = "/* micro-drift-v1 */";
const microDriftCss = `
${styleMarker}
:root{--md-green:#16df51;--md-green2:#08b941;--md-ink:#111925;--md-muted:#617084;--md-line:#cddbe8;--md-panel:#f8fcff;--md-panel2:#edf6fc}
body{background:#eaf4fb!important}
.bgcImg,.content,.content[data-v-080eb564]{width:100vw!important;height:100vh!important;background-color:#f8fcff!important;background-repeat:no-repeat!important;background-size:100% 100%!important;color:var(--md-ink)!important;font-family:Arial,"Segoe UI",sans-serif!important;overflow:hidden!important}
.content:before{content:"";position:fixed;inset:calc(18 * 100 / var(--base-rpx) * 1vmin);border-radius:calc(28 * 100 / var(--base-rpx) * 1vmin);background:linear-gradient(180deg,rgba(255,255,255,.94),rgba(238,247,253,.88));border:1px solid rgba(180,199,216,.7);box-shadow:0 calc(18 * 100 / var(--base-rpx) * 1vmin) calc(55 * 100 / var(--base-rpx) * 1vmin) rgba(65,86,106,.18),inset 0 1px 0 rgba(255,255,255,.95);pointer-events:none;z-index:0}
.content .box,.content .box[data-v-080eb564]{position:relative!important;z-index:1!important;height:100vh!important;background:transparent!important;overflow:hidden!important}
.content .box:before{content:"MICRO DRIFT";position:fixed;left:calc(50 * 100 / var(--base-rpx) * 1vmin);top:calc(40 * 100 / var(--base-rpx) * 1vmin);z-index:1000;color:#101925;font-size:calc(42 * 100 / var(--base-rpx) * 1vmin);font-weight:900;font-style:italic;letter-spacing:0;text-shadow:0 1px 0 #fff;pointer-events:none}
.content .box:after{content:"SMALL SIZE. BIG THRILLS.";position:fixed;left:calc(54 * 100 / var(--base-rpx) * 1vmin);top:calc(88 * 100 / var(--base-rpx) * 1vmin);z-index:1000;color:#6a7889;font-size:calc(13 * 100 / var(--base-rpx) * 1vmin);font-weight:700;letter-spacing:.42em;pointer-events:none}
.content .box .controlButton,.content .controlButton[data-v-080eb564]{position:absolute!important;top:calc(22 * 100 / var(--base-rpx) * 1vmin)!important;left:calc(30 * 100 / var(--base-rpx) * 1vmin)!important;right:calc(30 * 100 / var(--base-rpx) * 1vmin)!important;width:auto!important;height:calc(118 * 100 / var(--base-rpx) * 1vmin)!important;margin:0!important;padding:0!important;display:flex!important;align-items:center!important;justify-content:space-between!important;background:transparent!important;border:0!important;box-shadow:none!important;z-index:999!important}
.content .box .controlButton .left,.content .controlButton .left[data-v-080eb564]{width:calc(315 * 100 / var(--base-rpx) * 1vmin)!important;height:calc(86 * 100 / var(--base-rpx) * 1vmin)!important;margin:0!important;display:flex!important;align-items:center!important;justify-content:flex-start!important;border-radius:calc(18 * 100 / var(--base-rpx) * 1vmin)!important;overflow:visible!important;background:url(/static/logo.png) left center/contain no-repeat!important;border:0!important;box-shadow:none!important}
.content .box .controlButton .left .icon-img,.content .controlButton .left .icon-img[data-v-080eb564]{width:calc(310 * 100 / var(--base-rpx) * 1vmin)!important;height:calc(82 * 100 / var(--base-rpx) * 1vmin)!important;object-fit:contain!important;opacity:1!important}
.content .box .controlButton .center,.content .controlButton .center[data-v-080eb564]{width:calc(690 * 100 / var(--base-rpx) * 1vmin)!important;height:calc(96 * 100 / var(--base-rpx) * 1vmin)!important;margin:0!important;padding:0!important;display:flex!important;align-items:center!important;justify-content:center!important;gap:calc(18 * 100 / var(--base-rpx) * 1vmin)!important;background:transparent!important;border:0!important;box-shadow:none!important}
.content .box .controlButton .center:before{content:"";width:calc(190 * 100 / var(--base-rpx) * 1vmin);height:calc(60 * 100 / var(--base-rpx) * 1vmin);background:url(/static/battery_icon.png) center/contain no-repeat;order:7;pointer-events:none}
.content .box .controlButton .center:after{content:"";width:calc(198 * 100 / var(--base-rpx) * 1vmin);height:calc(58 * 100 / var(--base-rpx) * 1vmin);background:url(/static/status_connected.png) center/contain no-repeat;order:-2;pointer-events:none}
.content .box .controlButton .center .text,.content .controlButton .center .text[data-v-080eb564]{display:none!important}
.content .box .controlButton .center .icon-img,.content .controlButton .center .icon-img[data-v-080eb564]{width:calc(88 * 100 / var(--base-rpx) * 1vmin)!important;height:calc(88 * 100 / var(--base-rpx) * 1vmin)!important;margin:0!important;object-fit:contain!important;border-radius:calc(18 * 100 / var(--base-rpx) * 1vmin)!important;filter:drop-shadow(0 8px 14px rgba(28,47,67,.12))!important}
.content .box .controlButton .center .icon-speed,.content .controlButton .center .icon-speed[data-v-080eb564],.content .box .controlButton .center .icon-privacy,.content .controlButton .center .icon-privacy[data-v-080eb564]{width:calc(92 * 100 / var(--base-rpx) * 1vmin)!important;height:calc(76 * 100 / var(--base-rpx) * 1vmin)!important;margin:0!important;object-fit:contain!important}
.content .box .controlButton .right,.content .controlButton .right[data-v-080eb564]{width:calc(84 * 100 / var(--base-rpx) * 1vmin)!important;height:calc(84 * 100 / var(--base-rpx) * 1vmin)!important;margin:0!important;border-radius:calc(24 * 100 / var(--base-rpx) * 1vmin)!important;background:url(/static/menu_icon.png) center/contain no-repeat!important;border:0!important;box-shadow:none!important;overflow:hidden!important}
.content .box .controlButton .right .icon-img,.content .controlButton .right .icon-img[data-v-080eb564]{opacity:0!important}
.content .icon,.content .icon2,.content .icon[data-v-080eb564],.content .icon2[data-v-080eb564]{width:calc(86 * 100 / var(--base-rpx) * 1vmin)!important;height:calc(86 * 100 / var(--base-rpx) * 1vmin)!important;border-radius:calc(18 * 100 / var(--base-rpx) * 1vmin)!important}
.content .totalControl,.content .totalControl[data-v-080eb564]{position:absolute!important;left:calc(30 * 100 / var(--base-rpx) * 1vmin)!important;right:calc(30 * 100 / var(--base-rpx) * 1vmin)!important;top:calc(150 * 100 / var(--base-rpx) * 1vmin)!important;bottom:calc(112 * 100 / var(--base-rpx) * 1vmin)!important;height:auto!important;z-index:4!important}
.content .totalControl:before{content:"";position:fixed;left:31vw;right:31vw;top:21vh;bottom:15vh;background:url(/static/bgc3.png) center/contain no-repeat;z-index:1;pointer-events:none}
.content .totalControl:after{display:none!important}
.controlArea{position:relative!important;height:100%!important;padding:0!important;display:flex!important;align-items:center!important;justify-content:center!important}
.controlArea:before{content:"";position:absolute;left:21.5vw;right:21.5vw;top:4.5vmin;bottom:7vmin;background:url(/static/bgc3.png) center 56%/contain no-repeat;opacity:1;pointer-events:none;z-index:0}
.controlArea:after{content:"MICRO RC DRIFT CAR";position:absolute;left:42vw;top:7.2vmin;color:#526276;font-size:calc(16 * 100 / var(--base-rpx) * 1vmin);font-weight:700;letter-spacing:.45em;z-index:2;pointer-events:none}
.controlArea .controlView2{position:relative!important;z-index:4!important;height:100%!important;width:100%!important;display:flex!important;align-items:center!important;justify-content:space-between!important}
.controlArea .controlView2>uni-view,.controlArea .controlView2>view{display:flex!important;align-items:center!important;justify-content:center!important;position:absolute!important;top:0!important;width:34vw!important;height:100%!important}
.controlArea .controlView2>uni-view:nth-child(1),.controlArea .controlView2>view:nth-child(1){left:0!important}
.controlArea .controlView2>uni-view:nth-child(2),.controlArea .controlView2>view:nth-child(2){right:0!important;display:flex!important}
.movable[data-v-fab8ee74],.movable[data-v-62d47eee]{position:relative!important;width:calc(420 * 100 / var(--base-rpx) * 1vmin)!important;height:calc(460 * 100 / var(--base-rpx) * 1vmin)!important;border-radius:calc(36 * 100 / var(--base-rpx) * 1vmin)!important;background:rgba(248,252,255,.68)!important;border:1px solid rgba(196,213,229,.72)!important;box-shadow:0 calc(18 * 100 / var(--base-rpx) * 1vmin) calc(42 * 100 / var(--base-rpx) * 1vmin) rgba(57,80,101,.12),inset 0 1px 0 #fff!important;overflow:visible!important}
.movable[data-v-fab8ee74]{margin-left:calc(10 * 100 / var(--base-rpx) * 1vmin)!important}
.movable[data-v-62d47eee]{margin-right:calc(10 * 100 / var(--base-rpx) * 1vmin)!important}
.movable[data-v-fab8ee74]:before{content:"Throttle";position:absolute;left:calc(28 * 100 / var(--base-rpx) * 1vmin);top:calc(24 * 100 / var(--base-rpx) * 1vmin);color:var(--md-ink);font-size:calc(25 * 100 / var(--base-rpx) * 1vmin);font-weight:900;z-index:12;pointer-events:none}
.movable[data-v-fab8ee74]:after{content:"Forward / Backward";position:absolute;left:calc(28 * 100 / var(--base-rpx) * 1vmin);top:calc(58 * 100 / var(--base-rpx) * 1vmin);color:#516173;font-size:calc(17 * 100 / var(--base-rpx) * 1vmin);font-weight:500;z-index:12;pointer-events:none}
.movable[data-v-62d47eee]:before{content:"Steering";position:absolute;right:calc(28 * 100 / var(--base-rpx) * 1vmin);top:calc(24 * 100 / var(--base-rpx) * 1vmin);color:var(--md-ink);font-size:calc(25 * 100 / var(--base-rpx) * 1vmin);font-weight:900;z-index:12;pointer-events:none;text-align:right}
.movable[data-v-62d47eee]:after{content:"Left / Right";position:absolute;right:calc(28 * 100 / var(--base-rpx) * 1vmin);top:calc(58 * 100 / var(--base-rpx) * 1vmin);color:#516173;font-size:calc(17 * 100 / var(--base-rpx) * 1vmin);font-weight:500;z-index:12;pointer-events:none;text-align:right}
#rocker-v,#rocker-h{position:absolute!important;left:50%!important;top:52%!important;transform:translate(-50%,-50%)!important;width:calc(320 * 100 / var(--base-rpx) * 1vmin)!important;height:calc(320 * 100 / var(--base-rpx) * 1vmin)!important;border-radius:999px!important;overflow:visible!important;box-shadow:0 calc(22 * 100 / var(--base-rpx) * 1vmin) calc(44 * 100 / var(--base-rpx) * 1vmin) rgba(22,41,58,.18)!important}
.movable .movableArea[data-v-fab8ee74],.movable .movableArea[data-v-62d47eee],.movable .areaExchange[data-v-fab8ee74],.movable .areaExchange[data-v-62d47eee]{background:transparent!important;border:0!important;box-shadow:none!important;overflow:visible!important}
.movable .movableArea .movableView[data-v-fab8ee74],.movable .movableArea .movableView[data-v-62d47eee],.movable .viewExchange[data-v-fab8ee74],.movable .viewExchange[data-v-62d47eee]{border-radius:999px!important;filter:drop-shadow(0 8px 18px rgba(10,24,38,.26))!important}
.content .box .footer,.content .controlFooter[data-v-080eb564]{position:fixed!important;left:calc(30 * 100 / var(--base-rpx) * 1vmin)!important;right:calc(30 * 100 / var(--base-rpx) * 1vmin)!important;bottom:calc(24 * 100 / var(--base-rpx) * 1vmin)!important;width:auto!important;height:calc(86 * 100 / var(--base-rpx) * 1vmin)!important;background:url(/static/bottom_navbar.png) center/100% 100% no-repeat!important;border:0!important;border-radius:calc(34 * 100 / var(--base-rpx) * 1vmin)!important;box-shadow:0 calc(18 * 100 / var(--base-rpx) * 1vmin) calc(36 * 100 / var(--base-rpx) * 1vmin) rgba(22,38,54,.18)!important;z-index:20!important}
.content .box .footer .block,.content .controlFooter .block[data-v-080eb564]{display:none!important}
.content .box .footer .logo,.content .controlFooter .logo[data-v-080eb564]{display:none!important}
.controlArea .settings{position:absolute!important;right:calc(18 * 100 / var(--base-rpx) * 1vmin)!important;bottom:calc(16 * 100 / var(--base-rpx) * 1vmin)!important;width:calc(280 * 100 / var(--base-rpx) * 1vmin)!important;height:calc(96 * 100 / var(--base-rpx) * 1vmin)!important;background:url(/static/drift_badge.png) center/contain no-repeat!important;border:0!important;box-shadow:none!important;pointer-events:none!important;z-index:8!important}
.controlArea .settings *{display:none!important}
.choose-device,.choose-device[data-v-080eb564],.dialog,.dialog[data-v-080eb564]{background:rgba(248,252,255,.98)!important;color:var(--md-ink)!important;border:1px solid rgba(190,207,223,.8)!important;border-radius:calc(22 * 100 / var(--base-rpx) * 1vmin)!important;box-shadow:0 calc(20 * 100 / var(--base-rpx) * 1vmin) calc(60 * 100 / var(--base-rpx) * 1vmin) rgba(35,55,75,.25)!important;overflow:hidden!important}
.title_choose,.title,.name-device,.id-device,.selecedBox{color:var(--md-ink)!important}
.list-item{border-color:rgba(196,213,229,.72)!important}
.footer{background:#eef7fd!important;color:var(--md-ink)!important}
.button-item{border-radius:999px!important;background:#14d950!important;color:#fff!important;text-align:center!important}
.mask{background:rgba(14,25,37,.28)!important;backdrop-filter:blur(8px)!important}
@media (max-width:900px) and (orientation:landscape){.content .box:before{font-size:calc(34 * 100 / var(--base-rpx) * 1vmin)}.content .box .controlButton .left,.content .controlButton .left[data-v-080eb564]{width:calc(270 * 100 / var(--base-rpx) * 1vmin)!important}.content .box .controlButton .left .icon-img,.content .controlButton .left .icon-img[data-v-080eb564]{width:calc(265 * 100 / var(--base-rpx) * 1vmin)!important}.movable[data-v-fab8ee74],.movable[data-v-62d47eee]{width:calc(360 * 100 / var(--base-rpx) * 1vmin)!important;height:calc(430 * 100 / var(--base-rpx) * 1vmin)!important}#rocker-v,#rocker-h{width:calc(286 * 100 / var(--base-rpx) * 1vmin)!important;height:calc(286 * 100 / var(--base-rpx) * 1vmin)!important}.controlArea:before{left:24vw;right:24vw}}
`;

let css = read(cssPath);
css = stripAppendedCss(css, ["/* micro-rc-modern-overhaul */", "/* micro-rc-material-v2 */", styleMarker]);
css = css.trimEnd() + "\n" + microDriftCss.trimStart();
writeIfChanged(cssPath, css);

let viewBundle = read(viewBundlePath);
viewBundle = viewBundle.replace(/remote",{attrs:{ble_on:t\.ble_on,/g, 'remote",{attrs:{is4Chan:!0,ble_on:t.ble_on,');
viewBundle = viewBundle.replace(/style:t\._\$s\(1,"s",t\.is4Chan\?"":"justify-content:center;align-items: center;"\)/g, 'style:t._$s(1,"s","")');
viewBundle = viewBundle.replace(/value:t\._\$s\(5,"v-show",t\.is4Chan\),expression:"_\$s\(5,'v-show',is4Chan\)"/g, 'value:!0,expression:"true"');
const appViewCss = "/* micro-drift-appview-v1 */" + compactCss(microDriftCss.replace(styleMarker, "")) + "/* /micro-drift-appview-v1 */";
viewBundle = replaceAppViewBlock(viewBundle, appViewCss);
writeIfChanged(viewBundlePath, viewBundle);

if (fs.existsSync(manifestPath)) {
  let xml = read(manifestPath);
  xml = xml.replace(/<appver>[^<]*<\/appver>/, "<appver>1.2.0</appver>");
  writeIfChanged(manifestPath, xml);
}

if (fs.existsSync(androidManifestPath)) {
  let androidManifest = read(androidManifestPath);
  androidManifest = androidManifest.replace(/<manifest\b([^>]*)>/, (match, attrs) => {
    const cleaned = attrs
      .replace(/\s+android:versionCode="[^"]*"/, "")
      .replace(/\s+android:versionName="[^"]*"/, "");
    return `<manifest${cleaned} android:versionCode="120" android:versionName="1.2.0">`;
  });
  writeIfChanged(androidManifestPath, androidManifest);
}

if (fs.existsSync(apktoolYmlPath)) {
  let yml = read(apktoolYmlPath);
  yml = yml.replace(/versionCode:\s*\d+/, "versionCode: 120");
  yml = yml.replace(/versionName:\s*[^\r\n]+/, "versionName: 1.2.0");
  writeIfChanged(apktoolYmlPath, yml);
}

if (fs.existsSync(appsManifestPath)) {
  let manifest = read(appsManifestPath);
  const named = manifest.replace(/"name"\s*:\s*"[^"]*"/, '"name":"Micro Drift"');
  if (named === manifest && !manifest.includes('"name":"Micro Drift"')) {
    throw new Error("Could not patch manifest name");
  }
  manifest = named;
  const versioned = manifest.replace(/"version"\s*:\s*\{\s*"name"\s*:\s*"[^"]*"\s*,\s*"code"\s*:\s*"[^"]*"\s*\}/, '"version":{"name":"1.2.0","code":"120"}');
  if (versioned === manifest && !manifest.includes('"version":{"name":"1.2.0","code":"120"}')) {
    throw new Error("Could not patch manifest version");
  }
  manifest = versioned;
  manifest = manifest.replace(/"aliasname"\s*:\s*"[^"]*"/, '"aliasname":"Micro Drift"');
  writeIfChanged(appsManifestPath, manifest);
}

const textExtensions = new Set([".js", ".css", ".html", ".json", ".xml", ".txt"]);
const cleanupRoots = [
  www,
  path.join(root, "apktool_out", "assets", "data"),
  path.join(root, "apktool_out", "unknown", "io", "dcloud"),
];
for (const file of cleanupRoots.flatMap((dir) => walkFiles(dir, textExtensions))) {
  const current = read(file);
  const cleaned = stripChineseTraces(current);
  if (cleaned !== current) {
    fs.writeFileSync(file, cleaned, "utf8");
    console.log(`removed Chinese traces from ${path.relative(root, file)}`);
  }
}

console.log("Micro Drift revamp complete: throttle is rocker-v, steering is rocker-h, BLE target path is preserved.");
