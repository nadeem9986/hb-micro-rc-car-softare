Add-Type -AssemblyName System.Drawing

$root = Split-Path -Parent $PSScriptRoot
$static = Join-Path $root "apktool_out\assets\apps\__UNI__FB0AA52\www\static"

function New-Bitmap($width, $height) {
    $bitmap = New-Object System.Drawing.Bitmap $width, $height, ([System.Drawing.Imaging.PixelFormat]::Format32bppArgb)
    $graphics = [System.Drawing.Graphics]::FromImage($bitmap)
    $graphics.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
    $graphics.TextRenderingHint = [System.Drawing.Text.TextRenderingHint]::AntiAliasGridFit
    $graphics.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
    return @($bitmap, $graphics)
}

function New-Color($hex) {
    return [System.Drawing.ColorTranslator]::FromHtml($hex)
}

function New-Brush($hex) {
    return New-Object System.Drawing.SolidBrush (New-Color $hex)
}

function New-AlphaBrush($alpha, $hex) {
    $c = New-Color $hex
    return New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb($alpha, $c.R, $c.G, $c.B))
}

function New-AlphaPen($alpha, $hex, $width) {
    $c = New-Color $hex
    $pen = New-Object System.Drawing.Pen ([System.Drawing.Color]::FromArgb($alpha, $c.R, $c.G, $c.B)), $width
    $pen.StartCap = [System.Drawing.Drawing2D.LineCap]::Round
    $pen.EndCap = [System.Drawing.Drawing2D.LineCap]::Round
    return $pen
}

function Save-Png($bitmap, $graphics, $path) {
    $graphics.Dispose()
    $bitmap.Save($path, [System.Drawing.Imaging.ImageFormat]::Png)
    $bitmap.Dispose()
}

function Draw-RoundRect($graphics, $brush, $pen, $rect, $radius) {
    $path = New-Object System.Drawing.Drawing2D.GraphicsPath
    $d = $radius * 2
    $path.AddArc($rect.X, $rect.Y, $d, $d, 180, 90)
    $path.AddArc($rect.Right - $d, $rect.Y, $d, $d, 270, 90)
    $path.AddArc($rect.Right - $d, $rect.Bottom - $d, $d, $d, 0, 90)
    $path.AddArc($rect.X, $rect.Bottom - $d, $d, $d, 90, 90)
    $path.CloseFigure()
    if ($brush) { $graphics.FillPath($brush, $path) }
    if ($pen) { $graphics.DrawPath($pen, $path) }
    $path.Dispose()
}

function Draw-Text($graphics, $text, $family, $size, $style, $brush, $rect, $align, $lineAlign) {
    $font = New-Object System.Drawing.Font $family, $size, $style
    $format = New-Object System.Drawing.StringFormat
    $format.Alignment = $align
    $format.LineAlignment = $lineAlign
    $format.Trimming = [System.Drawing.StringTrimming]::EllipsisCharacter
    $graphics.DrawString($text, $font, $brush, $rect, $format)
    $format.Dispose()
    $font.Dispose()
}

function Draw-Chevron($graphics, $x, $y, $dir, $color, $width) {
    $pen = New-AlphaPen 255 $color $width
    if ($dir -eq "left") {
        $graphics.DrawLine($pen, $x + 18, $y - 28, $x - 16, $y)
        $graphics.DrawLine($pen, $x - 16, $y, $x + 18, $y + 28)
    } elseif ($dir -eq "right") {
        $graphics.DrawLine($pen, $x - 18, $y - 28, $x + 16, $y)
        $graphics.DrawLine($pen, $x + 16, $y, $x - 18, $y + 28)
    } elseif ($dir -eq "up") {
        $graphics.DrawLine($pen, $x - 28, $y + 18, $x, $y - 16)
        $graphics.DrawLine($pen, $x, $y - 16, $x + 28, $y + 18)
    } else {
        $graphics.DrawLine($pen, $x - 28, $y - 18, $x, $y + 16)
        $graphics.DrawLine($pen, $x, $y + 16, $x + 28, $y - 18)
    }
    $pen.Dispose()
}

function Draw-PulseIcon($graphics, $x, $y, $scale, $color) {
    $pen = New-AlphaPen 255 $color (5 * $scale)
    $points = @(
        (New-Object System.Drawing.PointF ($x - 42 * $scale), $y),
        (New-Object System.Drawing.PointF ($x - 16 * $scale), $y),
        (New-Object System.Drawing.PointF ($x - 6 * $scale), ($y - 34 * $scale)),
        (New-Object System.Drawing.PointF ($x + 12 * $scale), ($y + 34 * $scale)),
        (New-Object System.Drawing.PointF ($x + 22 * $scale), $y),
        (New-Object System.Drawing.PointF ($x + 48 * $scale), $y)
    )
    $graphics.DrawLines($pen, $points)
    $pen.Dispose()
}

function Draw-LightIcon($graphics, $x, $y, $scale, $color) {
    $pen = New-AlphaPen 255 $color (5 * $scale)
    $graphics.DrawEllipse($pen, $x - 17 * $scale, $y - 17 * $scale, 34 * $scale, 34 * $scale)
    for ($i = 0; $i -lt 8; $i++) {
        $angle = $i * [Math]::PI / 4
        $x1 = $x + [Math]::Cos($angle) * 30 * $scale
        $y1 = $y + [Math]::Sin($angle) * 30 * $scale
        $x2 = $x + [Math]::Cos($angle) * 42 * $scale
        $y2 = $y + [Math]::Sin($angle) * 42 * $scale
        $graphics.DrawLine($pen, [float]$x1, [float]$y1, [float]$x2, [float]$y2)
    }
    $pen.Dispose()
}

function Draw-GaugeIcon($graphics, $x, $y, $scale, $color) {
    $pen = New-AlphaPen 255 $color (6 * $scale)
    $graphics.DrawArc($pen, $x - 45 * $scale, $y - 35 * $scale, 90 * $scale, 90 * $scale, 205, 130)
    $graphics.DrawLine($pen, $x, $y + 7 * $scale, $x + 28 * $scale, $y - 25 * $scale)
    $brush = New-Brush $color
    $graphics.FillEllipse($brush, $x - 6 * $scale, $y + 1 * $scale, 12 * $scale, 12 * $scale)
    $brush.Dispose()
    $pen.Dispose()
}

function Draw-BluetoothIcon($graphics, $x, $y, $scale, $color) {
    $pen = New-AlphaPen 255 $color (5 * $scale)
    $graphics.DrawLine($pen, $x, $y - 38 * $scale, $x, $y + 38 * $scale)
    $graphics.DrawLine($pen, $x, $y - 38 * $scale, $x + 28 * $scale, $y - 14 * $scale)
    $graphics.DrawLine($pen, $x + 28 * $scale, $y - 14 * $scale, $x - 18 * $scale, $y + 18 * $scale)
    $graphics.DrawLine($pen, $x, $y + 38 * $scale, $x + 28 * $scale, $y + 14 * $scale)
    $graphics.DrawLine($pen, $x + 28 * $scale, $y + 14 * $scale, $x - 18 * $scale, $y - 18 * $scale)
    $pen.Dispose()
}

function Draw-GearIcon($graphics, $x, $y, $scale, $color) {
    $pen = New-AlphaPen 255 $color (5 * $scale)
    $graphics.DrawEllipse($pen, $x - 23 * $scale, $y - 23 * $scale, 46 * $scale, 46 * $scale)
    $graphics.DrawEllipse($pen, $x - 8 * $scale, $y - 8 * $scale, 16 * $scale, 16 * $scale)
    for ($i = 0; $i -lt 8; $i++) {
        $angle = $i * [Math]::PI / 4
        $x1 = $x + [Math]::Cos($angle) * 28 * $scale
        $y1 = $y + [Math]::Sin($angle) * 28 * $scale
        $x2 = $x + [Math]::Cos($angle) * 39 * $scale
        $y2 = $y + [Math]::Sin($angle) * 39 * $scale
        $graphics.DrawLine($pen, [float]$x1, [float]$y1, [float]$x2, [float]$y2)
    }
    $pen.Dispose()
}

function New-Logo {
    $pair = New-Bitmap 650 170
    $bitmap = $pair[0]
    $graphics = $pair[1]
    $clear = New-AlphaBrush 0 "#ffffff"
    $graphics.FillRectangle($clear, 0, 0, 650, 170)
    $clear.Dispose()
    $dark = New-Object System.Drawing.Drawing2D.LinearGradientBrush((New-Object System.Drawing.Rectangle 8, 8, 634, 154), (New-Color "#1d2733"), (New-Color "#0d141d"), [System.Drawing.Drawing2D.LinearGradientMode]::Vertical)
    $edge = New-AlphaPen 88 "#d9e6f2" 2
    Draw-RoundRect $graphics $dark $edge (New-Object System.Drawing.Rectangle 8, 8, 634, 154) 34
    $white = New-Brush "#f7fbff"
    $green = New-Brush "#10d84d"
    $muted = New-Brush "#93a4b8"
    Draw-Text $graphics "MICRO" "Segoe UI Black" 52 ([System.Drawing.FontStyle]::Bold -bor [System.Drawing.FontStyle]::Italic) $white (New-Object System.Drawing.RectangleF 42, 28, 260, 70) ([System.Drawing.StringAlignment]::Near) ([System.Drawing.StringAlignment]::Center)
    Draw-Text $graphics "DRIFT" "Segoe UI Black" 52 ([System.Drawing.FontStyle]::Bold -bor [System.Drawing.FontStyle]::Italic) $green (New-Object System.Drawing.RectangleF 300, 28, 270, 70) ([System.Drawing.StringAlignment]::Near) ([System.Drawing.StringAlignment]::Center)
    Draw-Text $graphics "SMALL SIZE. BIG THRILLS." "Segoe UI" 18 ([System.Drawing.FontStyle]::Regular) $muted (New-Object System.Drawing.RectangleF 48, 104, 520, 32) ([System.Drawing.StringAlignment]::Near) ([System.Drawing.StringAlignment]::Center)
    $white.Dispose(); $green.Dispose(); $muted.Dispose(); $dark.Dispose(); $edge.Dispose()
    Save-Png $bitmap $graphics (Join-Path $static "logo.png")
    Copy-Item -LiteralPath (Join-Path $static "logo.png") -Destination (Join-Path $static "logo.jpg") -Force
    Copy-Item -LiteralPath (Join-Path $static "logo.png") -Destination (Join-Path $static "icon10.png") -Force
}

function New-StatusPill($file, $label, $connected) {
    $pair = New-Bitmap 340 110
    $bitmap = $pair[0]
    $graphics = $pair[1]
    $bg = New-Object System.Drawing.Drawing2D.LinearGradientBrush((New-Object System.Drawing.Rectangle 0, 0, 340, 110), (New-Color "#f9fdff"), (New-Color "#edf5fb"), [System.Drawing.Drawing2D.LinearGradientMode]::Vertical)
    $edge = New-AlphaPen 180 "#c9d8e7" 2
    Draw-RoundRect $graphics $bg $edge (New-Object System.Drawing.Rectangle 4, 4, 332, 102) 44
    $dotColor = if ($connected) { "#18e454" } else { "#ff3244" }
    $dot = New-Brush $dotColor
    $glow = New-AlphaBrush 70 $dotColor
    $graphics.FillEllipse($glow, 34, 28, 54, 54)
    $graphics.FillEllipse($dot, 46, 40, 30, 30)
    $ink = New-Brush "#101925"
    Draw-Text $graphics $label "Segoe UI" 24 ([System.Drawing.FontStyle]::Bold) $ink (New-Object System.Drawing.RectangleF 100, 24, 150, 58) ([System.Drawing.StringAlignment]::Near) ([System.Drawing.StringAlignment]::Center)
    $sep = New-AlphaPen 100 "#b9c8d7" 2
    $graphics.DrawLine($sep, 238, 30, 238, 80)
    Draw-BluetoothIcon $graphics 278 55 0.78 "#1685ff"
    if (-not $connected) {
        $gray = New-AlphaPen 255 "#687586" 4
        $graphics.DrawLine($gray, 255, 30, 302, 82)
        $gray.Dispose()
    }
    $bg.Dispose(); $edge.Dispose(); $dot.Dispose(); $glow.Dispose(); $ink.Dispose(); $sep.Dispose()
    Save-Png $bitmap $graphics (Join-Path $static $file)
}

function New-Battery {
    $pair = New-Bitmap 300 110
    $bitmap = $pair[0]
    $graphics = $pair[1]
    $bg = New-Object System.Drawing.Drawing2D.LinearGradientBrush((New-Object System.Drawing.Rectangle 0, 0, 300, 110), (New-Color "#f9fdff"), (New-Color "#edf5fb"), [System.Drawing.Drawing2D.LinearGradientMode]::Vertical)
    $edge = New-AlphaPen 180 "#c9d8e7" 2
    Draw-RoundRect $graphics $bg $edge (New-Object System.Drawing.Rectangle 4, 4, 292, 102) 40
    $outline = New-AlphaPen 255 "#101925" 5
    Draw-RoundRect $graphics $null $outline (New-Object System.Drawing.Rectangle 62, 36, 68, 38) 7
    $graphics.DrawRectangle($outline, 132, 46, 9, 18)
    $green = New-Brush "#18e454"
    Draw-RoundRect $graphics $green $null (New-Object System.Drawing.Rectangle 70, 43, 48, 24) 3
    $ink = New-Brush "#101925"
    Draw-Text $graphics "78%" "Segoe UI" 24 ([System.Drawing.FontStyle]::Bold) $ink (New-Object System.Drawing.RectangleF 162, 25, 86, 58) ([System.Drawing.StringAlignment]::Center) ([System.Drawing.StringAlignment]::Center)
    $bg.Dispose(); $edge.Dispose(); $outline.Dispose(); $green.Dispose(); $ink.Dispose()
    Save-Png $bitmap $graphics (Join-Path $static "battery_icon.png")
}

function New-TopIcon($file, $kind) {
    $pair = New-Bitmap 132 132
    $bitmap = $pair[0]
    $graphics = $pair[1]
    $bg = New-Object System.Drawing.Drawing2D.LinearGradientBrush((New-Object System.Drawing.Rectangle 0, 0, 132, 132), (New-Color "#1e2936"), (New-Color "#0d141d"), [System.Drawing.Drawing2D.LinearGradientMode]::Vertical)
    $edge = New-AlphaPen 80 "#ffffff" 2
    Draw-RoundRect $graphics $bg $edge (New-Object System.Drawing.Rectangle 6, 6, 120, 120) 34
    if ($kind -eq "settings") {
        Draw-GearIcon $graphics 66 66 0.9 "#f7fbff"
    } elseif ($kind -eq "help") {
        $pen = New-AlphaPen 255 "#f7fbff" 5
        $graphics.DrawEllipse($pen, 42, 34, 48, 48)
        Draw-Text $graphics "?" "Segoe UI" 44 ([System.Drawing.FontStyle]::Bold) (New-Brush "#f7fbff") (New-Object System.Drawing.RectangleF 42, 30, 48, 62) ([System.Drawing.StringAlignment]::Center) ([System.Drawing.StringAlignment]::Center)
        $pen.Dispose()
    } else {
        $brush = New-Brush "#f7fbff"
        $graphics.FillEllipse($brush, 60, 34, 10, 10)
        $graphics.FillEllipse($brush, 60, 61, 10, 10)
        $graphics.FillEllipse($brush, 60, 88, 10, 10)
        $brush.Dispose()
    }
    $bg.Dispose(); $edge.Dispose()
    Save-Png $bitmap $graphics (Join-Path $static $file)
}

function New-SpeedCard($file, $num, $label, $active) {
    $pair = New-Bitmap 260 150
    $bitmap = $pair[0]
    $graphics = $pair[1]
    $bgStart = if ($active) { "#18dc53" } else { "#f9fdff" }
    $bgEnd = if ($active) { "#07bd40" } else { "#eaf3fa" }
    $text = if ($active) { "#ffffff" } else { "#101925" }
    $border = if ($active) { "#18e454" } else { "#c9d8e7" }
    $bg = New-Object System.Drawing.Drawing2D.LinearGradientBrush((New-Object System.Drawing.Rectangle 0, 0, 260, 150), (New-Color $bgStart), (New-Color $bgEnd), [System.Drawing.Drawing2D.LinearGradientMode]::Vertical)
    $edge = New-AlphaPen 255 $border 3
    Draw-RoundRect $graphics $bg $edge (New-Object System.Drawing.Rectangle 4, 4, 252, 142) 22
    if ($active) {
        $glow = New-AlphaPen 100 "#18e454" 10
        Draw-RoundRect $graphics $null $glow (New-Object System.Drawing.Rectangle 10, 10, 240, 130) 20
        $glow.Dispose()
    }
    $brush = New-Brush $text
    Draw-Text $graphics $num "Segoe UI" 42 ([System.Drawing.FontStyle]::Bold) $brush (New-Object System.Drawing.RectangleF 0, 24, 260, 52) ([System.Drawing.StringAlignment]::Center) ([System.Drawing.StringAlignment]::Center)
    Draw-Text $graphics $label "Segoe UI" 18 ([System.Drawing.FontStyle]::Bold) $brush (New-Object System.Drawing.RectangleF 0, 88, 260, 34) ([System.Drawing.StringAlignment]::Center) ([System.Drawing.StringAlignment]::Center)
    $bg.Dispose(); $edge.Dispose(); $brush.Dispose()
    Save-Png $bitmap $graphics (Join-Path $static $file)
}

function New-LightCard($file, $label, $kind, $active) {
    $pair = New-Bitmap 260 150
    $bitmap = $pair[0]
    $graphics = $pair[1]
    $bgStart = if ($active) { "#c9ffd7" } else { "#f9fdff" }
    $bgEnd = if ($active) { "#92f6a7" } else { "#eaf3fa" }
    $bg = New-Object System.Drawing.Drawing2D.LinearGradientBrush((New-Object System.Drawing.Rectangle 0, 0, 260, 150), (New-Color $bgStart), (New-Color $bgEnd), [System.Drawing.Drawing2D.LinearGradientMode]::Vertical)
    $edgeColor = if ($active) { "#18e454" } else { "#c9d8e7" }
    $edge = New-AlphaPen 255 $edgeColor 3
    Draw-RoundRect $graphics $bg $edge (New-Object System.Drawing.Rectangle 4, 4, 252, 142) 22
    if ($kind -eq "pulse") {
        Draw-PulseIcon $graphics 130 55 0.7 "#101925"
    } elseif ($kind -eq "rainbow") {
        $colors = @("#f72585", "#ffb703", "#10d84d", "#1685ff", "#7b2cff")
        for ($i = 0; $i -lt 5; $i++) {
            $pen = New-AlphaPen 255 $colors[$i] 9
            $graphics.DrawArc($pen, 102, 25, 56, 56, 72 * $i, 58)
            $pen.Dispose()
        }
    } else {
        Draw-LightIcon $graphics 130 52 0.74 "#101925"
    }
    $ink = New-Brush "#101925"
    Draw-Text $graphics $label "Segoe UI" 18 ([System.Drawing.FontStyle]::Bold) $ink (New-Object System.Drawing.RectangleF 0, 94, 260, 34) ([System.Drawing.StringAlignment]::Center) ([System.Drawing.StringAlignment]::Center)
    $bg.Dispose(); $edge.Dispose(); $ink.Dispose()
    Save-Png $bitmap $graphics (Join-Path $static $file)
}

function New-CruiseCard($file, $active) {
    $pair = New-Bitmap 270 130
    $bitmap = $pair[0]
    $graphics = $pair[1]
    $bg = New-Object System.Drawing.Drawing2D.LinearGradientBrush((New-Object System.Drawing.Rectangle 0, 0, 270, 130), (New-Color "#f9fdff"), (New-Color "#eaf3fa"), [System.Drawing.Drawing2D.LinearGradientMode]::Vertical)
    $edge = New-AlphaPen 180 "#c9d8e7" 2
    Draw-RoundRect $graphics $bg $edge (New-Object System.Drawing.Rectangle 4, 4, 262, 122) 26
    Draw-GaugeIcon $graphics 66 66 0.78 "#101925"
    $trackColor = if ($active) { "#10c94b" } else { "#bac5cf" }
    $track = New-Brush $trackColor
    Draw-RoundRect $graphics $track $null (New-Object System.Drawing.Rectangle 125, 39, 104, 52) 26
    $knob = New-Brush "#ffffff"
    $knobX = if ($active) { 178 } else { 129 }
    $graphics.FillEllipse($knob, $knobX, 41, 48, 48)
    $bg.Dispose(); $edge.Dispose(); $track.Dispose(); $knob.Dispose()
    Save-Png $bitmap $graphics (Join-Path $static $file)
}

function New-Dial($file, $horizontal, $active) {
    $pair = New-Bitmap 720 720
    $bitmap = $pair[0]
    $graphics = $pair[1]
    $clear = New-AlphaBrush 0 "#ffffff"
    $graphics.FillRectangle($clear, 0, 0, 720, 720)
    $clear.Dispose()
    $halo = New-AlphaBrush 65 "#18e454"
    $graphics.FillEllipse($halo, 54, 54, 612, 612)
    $halo.Dispose()
    $outer = New-Object System.Drawing.Drawing2D.LinearGradientBrush((New-Object System.Drawing.Rectangle 70, 70, 580, 580), (New-Color "#263442"), (New-Color "#0b1219"), [System.Drawing.Drawing2D.LinearGradientMode]::Vertical)
    $graphics.FillEllipse($outer, 86, 86, 548, 548)
    $outer.Dispose()
    $rimColor = if ($active) { "#18e454" } else { "#c8d6e4" }
    $rim = New-AlphaPen 255 $rimColor 14
    $graphics.DrawArc($rim, 100, 100, 520, 520, 192, 78)
    $graphics.DrawArc($rim, 100, 100, 520, 520, -12, 78)
    $rim.Dispose()
    $inner = New-Object System.Drawing.Drawing2D.LinearGradientBrush((New-Object System.Drawing.Rectangle 120, 120, 480, 480), (New-Color "#202c38"), (New-Color "#101821"), [System.Drawing.Drawing2D.LinearGradientMode]::Vertical)
    $graphics.FillEllipse($inner, 120, 120, 480, 480)
    $inner.Dispose()
    $tick = New-AlphaPen 85 "#d8e8f6" 3
    for ($i = 0; $i -lt 8; $i++) {
        $angle = ($i * 45 - 90) * [Math]::PI / 180
        $x1 = 360 + [Math]::Cos($angle) * 210
        $y1 = 360 + [Math]::Sin($angle) * 210
        $x2 = 360 + [Math]::Cos($angle) * 235
        $y2 = 360 + [Math]::Sin($angle) * 235
        $graphics.DrawLine($tick, [float]$x1, [float]$y1, [float]$x2, [float]$y2)
    }
    $tick.Dispose()
    $rocker = New-Object System.Drawing.Drawing2D.LinearGradientBrush((New-Object System.Drawing.Rectangle 190, 190, 340, 340), (New-Color "#2e3b48"), (New-Color "#151f29"), [System.Drawing.Drawing2D.LinearGradientMode]::Vertical)
    $rockerEdge = New-AlphaPen 120 "#d7e5f3" 2
    if ($horizontal) {
        Draw-RoundRect $graphics $rocker $rockerEdge (New-Object System.Drawing.Rectangle 162, 292, 396, 136) 68
        Draw-Chevron $graphics 246 360 "left" "#ffffff" 14
        Draw-Chevron $graphics 474 360 "right" "#ffffff" 14
    } else {
        Draw-RoundRect $graphics $rocker $rockerEdge (New-Object System.Drawing.Rectangle 292, 162, 136, 396) 68
        Draw-Chevron $graphics 360 246 "up" "#ffffff" 14
        Draw-Chevron $graphics 360 474 "down" "#ffffff" 14
    }
    $rocker.Dispose(); $rockerEdge.Dispose()
    $cap = New-Object System.Drawing.Drawing2D.LinearGradientBrush((New-Object System.Drawing.Rectangle 252, 252, 216, 216), (New-Color "#394858"), (New-Color "#1b2732"), [System.Drawing.Drawing2D.LinearGradientMode]::Vertical)
    $capEdge = New-AlphaPen 90 "#d8e8f6" 2
    $graphics.FillEllipse($cap, 252, 252, 216, 216)
    $graphics.DrawEllipse($capEdge, 252, 252, 216, 216)
    $cap.Dispose(); $capEdge.Dispose()
    Save-Png $bitmap $graphics (Join-Path $static $file)
}

function New-Knob {
    $pair = New-Bitmap 240 240
    $bitmap = $pair[0]
    $graphics = $pair[1]
    $clear = New-AlphaBrush 0 "#ffffff"
    $graphics.FillRectangle($clear, 0, 0, 240, 240)
    $clear.Dispose()
    $glow = New-AlphaBrush 70 "#18e454"
    $graphics.FillEllipse($glow, 20, 20, 200, 200)
    $glow.Dispose()
    $cap = New-Object System.Drawing.Drawing2D.LinearGradientBrush((New-Object System.Drawing.Rectangle 36, 36, 168, 168), (New-Color "#3a4a5b"), (New-Color "#18242e"), [System.Drawing.Drawing2D.LinearGradientMode]::Vertical)
    $edge = New-AlphaPen 125 "#d8e8f6" 2
    $graphics.FillEllipse($cap, 36, 36, 168, 168)
    $graphics.DrawEllipse($edge, 36, 36, 168, 168)
    $cap.Dispose(); $edge.Dispose()
    Save-Png $bitmap $graphics (Join-Path $static "btn_all.png")
}

function New-Hero {
    $pair = New-Bitmap 1600 900
    $bitmap = $pair[0]
    $graphics = $pair[1]
    $bg = New-Object System.Drawing.Drawing2D.LinearGradientBrush((New-Object System.Drawing.Rectangle 0, 0, 1600, 900), (New-Color "#fafdff"), (New-Color "#eaf4fb"), [System.Drawing.Drawing2D.LinearGradientMode]::Vertical)
    $graphics.FillRectangle($bg, 0, 0, 1600, 900)
    $bg.Dispose()
    $stripe = New-AlphaBrush 50 "#cbd9e7"
    $graphics.TranslateTransform(940, 260)
    $graphics.RotateTransform(-12)
    for ($i = 0; $i -lt 3; $i++) {
        $graphics.FillRectangle($stripe, $i * 128, 0, 76, 430)
    }
    $graphics.ResetTransform()
    $stripe.Dispose()
    $green = New-Brush "#10d84d"
    $ink = New-Brush "#101925"
    $muted = New-Brush "#617084"
    Draw-Text $graphics "DRIVE" "Segoe UI Black" 66 ([System.Drawing.FontStyle]::Bold -bor [System.Drawing.FontStyle]::Italic) $ink (New-Object System.Drawing.RectangleF 410, 160, 520, 76) ([System.Drawing.StringAlignment]::Near) ([System.Drawing.StringAlignment]::Center)
    Draw-Text $graphics "SMALLER" "Segoe UI Black" 58 ([System.Drawing.FontStyle]::Bold -bor [System.Drawing.FontStyle]::Italic) $ink (New-Object System.Drawing.RectangleF 410, 234, 610, 70) ([System.Drawing.StringAlignment]::Near) ([System.Drawing.StringAlignment]::Center)
    Draw-Text $graphics "FURTHER" "Segoe UI Black" 62 ([System.Drawing.FontStyle]::Bold -bor [System.Drawing.FontStyle]::Italic) $green (New-Object System.Drawing.RectangleF 410, 302, 620, 76) ([System.Drawing.StringAlignment]::Near) ([System.Drawing.StringAlignment]::Center)
    Draw-Text $graphics "MICRO RC DRIFT CAR" "Segoe UI" 24 ([System.Drawing.FontStyle]::Regular) $muted (New-Object System.Drawing.RectangleF 920, 190, 360, 70) ([System.Drawing.StringAlignment]::Center) ([System.Drawing.StringAlignment]::Center)
    $shadow = New-AlphaBrush 70 "#1d2733"
    $graphics.FillEllipse($shadow, 520, 690, 620, 64)
    $shadow.Dispose()
    $carBrush = New-Object System.Drawing.Drawing2D.LinearGradientBrush((New-Object System.Drawing.Rectangle 470, 430, 700, 210), (New-Color "#98ff45"), (New-Color "#10b93e"), [System.Drawing.Drawing2D.LinearGradientMode]::Vertical)
    $outline = New-AlphaPen 255 "#101925" 4
    $body = @(
        (New-Object System.Drawing.Point 490, 575),
        (New-Object System.Drawing.Point 560, 525),
        (New-Object System.Drawing.Point 730, 490),
        (New-Object System.Drawing.Point 920, 502),
        (New-Object System.Drawing.Point 1070, 542),
        (New-Object System.Drawing.Point 1138, 584),
        (New-Object System.Drawing.Point 1050, 620),
        (New-Object System.Drawing.Point 700, 632),
        (New-Object System.Drawing.Point 490, 606)
    )
    $graphics.FillPolygon($carBrush, $body)
    $graphics.DrawPolygon($outline, $body)
    $roof = @(
        (New-Object System.Drawing.Point 650, 490),
        (New-Object System.Drawing.Point 745, 445),
        (New-Object System.Drawing.Point 880, 452),
        (New-Object System.Drawing.Point 968, 506)
    )
    $graphics.FillPolygon($carBrush, $roof)
    $graphics.DrawPolygon($outline, $roof)
    $carBrush.Dispose(); $outline.Dispose()
    $black = New-Brush "#101925"
    $graphics.FillRectangle($black, 650, 470, 250, 70)
    $graphics.FillRectangle($black, 898, 498, 160, 48)
    $graphics.FillEllipse($black, 600, 590, 112, 112)
    $graphics.FillEllipse($black, 960, 590, 112, 112)
    $rim = New-AlphaPen 255 "#2f3e4e" 9
    $graphics.DrawEllipse($rim, 622, 612, 68, 68)
    $graphics.DrawEllipse($rim, 982, 612, 68, 68)
    $rim.Dispose()
    $glow = New-AlphaBrush 95 "#18e454"
    $graphics.FillEllipse($glow, 508, 538, 68, 18)
    $graphics.FillEllipse($glow, 570, 535, 68, 18)
    $glow.Dispose(); $green.Dispose(); $ink.Dispose(); $muted.Dispose(); $black.Dispose()
    Save-Png $bitmap $graphics (Join-Path $static "bgc3.png")
    Copy-Item -LiteralPath (Join-Path $static "bgc3.png") -Destination (Join-Path $static "bgc.jpg") -Force
}

function New-NavAndBadges {
    $pair = New-Bitmap 980 150
    $bitmap = $pair[0]
    $graphics = $pair[1]
    $bg = New-Object System.Drawing.Drawing2D.LinearGradientBrush((New-Object System.Drawing.Rectangle 0, 0, 980, 150), (New-Color "#1c2733"), (New-Color "#0c141d"), [System.Drawing.Drawing2D.LinearGradientMode]::Vertical)
    $edge = New-AlphaPen 100 "#d9e6f2" 2
    Draw-RoundRect $graphics $bg $edge (New-Object System.Drawing.Rectangle 4, 4, 972, 142) 42
    $active = New-Object System.Drawing.Drawing2D.LinearGradientBrush((New-Object System.Drawing.Rectangle 30, 24, 250, 102), (New-Color "#0dd649"), (New-Color "#0c7d34"), [System.Drawing.Drawing2D.LinearGradientMode]::Vertical)
    Draw-RoundRect $graphics $active (New-AlphaPen 255 "#18e454" 3) (New-Object System.Drawing.Rectangle 30, 24, 250, 102) 28
    $white = New-Brush "#f7fbff"
    $muted = New-Brush "#91a1b4"
    Draw-Text $graphics "CONTROL" "Segoe UI" 22 ([System.Drawing.FontStyle]::Bold) $white (New-Object System.Drawing.RectangleF 88, 54, 150, 40) ([System.Drawing.StringAlignment]::Center) ([System.Drawing.StringAlignment]::Center)
    Draw-Text $graphics "TUNING" "Segoe UI" 22 ([System.Drawing.FontStyle]::Regular) $muted (New-Object System.Drawing.RectangleF 345, 54, 150, 40) ([System.Drawing.StringAlignment]::Center) ([System.Drawing.StringAlignment]::Center)
    Draw-Text $graphics "TELEMETRY" "Segoe UI" 22 ([System.Drawing.FontStyle]::Regular) $muted (New-Object System.Drawing.RectangleF 585, 54, 180, 40) ([System.Drawing.StringAlignment]::Center) ([System.Drawing.StringAlignment]::Center)
    Draw-Text $graphics "MICRO DRIFT" "Segoe UI" 24 ([System.Drawing.FontStyle]::Bold -bor [System.Drawing.FontStyle]::Italic) $white (New-Object System.Drawing.RectangleF 770, 40, 170, 38) ([System.Drawing.StringAlignment]::Center) ([System.Drawing.StringAlignment]::Center)
    Draw-Text $graphics "SMALL SIZE. BIG THRILLS." "Segoe UI" 12 ([System.Drawing.FontStyle]::Regular) $muted (New-Object System.Drawing.RectangleF 746, 78, 220, 26) ([System.Drawing.StringAlignment]::Center) ([System.Drawing.StringAlignment]::Center)
    $bg.Dispose(); $edge.Dispose(); $active.Dispose(); $white.Dispose(); $muted.Dispose()
    Save-Png $bitmap $graphics (Join-Path $static "bottom_navbar.png")

    $pair = New-Bitmap 330 130
    $bitmap = $pair[0]
    $graphics = $pair[1]
    $bg = New-Object System.Drawing.Drawing2D.LinearGradientBrush((New-Object System.Drawing.Rectangle 0, 0, 330, 130), (New-Color "#1c2733"), (New-Color "#0c141d"), [System.Drawing.Drawing2D.LinearGradientMode]::Vertical)
    Draw-RoundRect $graphics $bg (New-AlphaPen 100 "#d9e6f2" 2) (New-Object System.Drawing.Rectangle 4, 4, 322, 122) 26
    $white = New-Brush "#f7fbff"
    Draw-Text $graphics "READY" "Segoe UI" 20 ([System.Drawing.FontStyle]::Bold) $white (New-Object System.Drawing.RectangleF 130, 25, 120, 32) ([System.Drawing.StringAlignment]::Near) ([System.Drawing.StringAlignment]::Center)
    Draw-Text $graphics "TO DRIFT" "Segoe UI" 20 ([System.Drawing.FontStyle]::Bold) $white (New-Object System.Drawing.RectangleF 130, 58, 130, 32) ([System.Drawing.StringAlignment]::Near) ([System.Drawing.StringAlignment]::Center)
    $green = New-Brush "#18e454"
    $gray = New-Brush "#8190a0"
    $graphics.FillPolygon($green, @((New-Object System.Drawing.Point 132, 95),(New-Object System.Drawing.Point 190, 95),(New-Object System.Drawing.Point 168, 121),(New-Object System.Drawing.Point 110, 121)))
    $graphics.FillPolygon($green, @((New-Object System.Drawing.Point 198, 95),(New-Object System.Drawing.Point 256, 95),(New-Object System.Drawing.Point 234, 121),(New-Object System.Drawing.Point 176, 121)))
    $graphics.FillPolygon($gray, @((New-Object System.Drawing.Point 264, 95),(New-Object System.Drawing.Point 306, 95),(New-Object System.Drawing.Point 284, 121),(New-Object System.Drawing.Point 242, 121)))
    $bg.Dispose(); $white.Dispose(); $green.Dispose(); $gray.Dispose()
    Save-Png $bitmap $graphics (Join-Path $static "drift_badge.png")
}

function New-SmallButton($file, $kind, $label, $active) {
    $pair = New-Bitmap 220 118
    $bitmap = $pair[0]
    $graphics = $pair[1]
    $bgStart = if ($active) { "#14db4f" } else { "#f9fdff" }
    $bgEnd = if ($active) { "#0bbd40" } else { "#eaf3fa" }
    $bg = New-Object System.Drawing.Drawing2D.LinearGradientBrush((New-Object System.Drawing.Rectangle 0, 0, 220, 118), (New-Color $bgStart), (New-Color $bgEnd), [System.Drawing.Drawing2D.LinearGradientMode]::Vertical)
    $edgeColor = if ($active) { "#18e454" } else { "#c9d8e7" }
    $iconColor = if ($active) { "#ffffff" } else { "#101925" }
    $edge = New-AlphaPen 200 $edgeColor 2
    Draw-RoundRect $graphics $bg $edge (New-Object System.Drawing.Rectangle 4, 4, 212, 110) 24
    if ($kind -eq "back") { Draw-Chevron $graphics 62 59 "left" $iconColor 10 }
    if ($kind -eq "remote") { Draw-GearIcon $graphics 62 58 0.55 $iconColor }
    if ($kind -eq "path") { Draw-PulseIcon $graphics 62 58 0.5 $iconColor }
    if ($kind -eq "exchange") { Draw-BluetoothIcon $graphics 62 58 0.55 $iconColor }
    $brush = New-Brush $iconColor
    Draw-Text $graphics $label "Segoe UI" 19 ([System.Drawing.FontStyle]::Bold) $brush (New-Object System.Drawing.RectangleF 100, 34, 98, 46) ([System.Drawing.StringAlignment]::Center) ([System.Drawing.StringAlignment]::Center)
    $bg.Dispose(); $edge.Dispose(); $brush.Dispose()
    Save-Png $bitmap $graphics (Join-Path $static $file)
}

New-Logo
New-Hero
New-StatusPill "btn_blue-1.png" "Connected" $true
New-StatusPill "btn_blue.png" "Connect" $false
New-StatusPill "status_connected.png" "Connected" $true
New-StatusPill "status_disconnected.png" "Disconnected" $false
New-Battery
New-TopIcon "settings_icon.png" "settings"
New-TopIcon "help_icon.png" "help"
New-TopIcon "menu_icon.png" "menu"
New-SpeedCard "btn_speed1.png" "1" "SLOW" $false
New-SpeedCard "btn_speed2.png" "2" "MEDIUM" $true
New-SpeedCard "btn_speed3.png" "3" "FAST" $false
New-LightCard "btn_light-1.png" "STEADY" "steady" $true
New-LightCard "btn_light.png" "PULSE" "pulse" $false
New-LightCard "light_rainbow.png" "RAINBOW" "rainbow" $false
New-CruiseCard "btn_cruise-1.png" $true
New-CruiseCard "btn_cruise.png" $false
New-Dial "bg_ud.png" $false $true
New-Dial "bg_lr.png" $true $true
New-Knob
New-NavAndBadges
New-SmallButton "back.png" "back" "Back" $false
New-SmallButton "privacy.png" "remote" "Help" $false
New-SmallButton "btn_remote-1.png" "remote" "Control" $true
New-SmallButton "btn_remote.png" "remote" "Control" $false
New-SmallButton "btn_gg-1.png" "path" "Tune" $true
New-SmallButton "btn_gg.png" "path" "Tune" $false
New-SmallButton "btn_guiji-1.png" "path" "Track" $true
New-SmallButton "btn_guiji.png" "path" "Track" $false
New-SmallButton "btn_exchange-1.png" "exchange" "Swap" $true
New-SmallButton "btn_exchange.png" "exchange" "Swap" $false
New-SmallButton "cn.png" "remote" "EN" $false

Copy-Item -LiteralPath (Join-Path $static "bg_ud.png") -Destination (Join-Path $static "btn_ud.png") -Force
Copy-Item -LiteralPath (Join-Path $static "bg_lr.png") -Destination (Join-Path $static "btn_lr.png") -Force

Write-Host "Micro Drift image assets refreshed."
