## georefr

[![experimental](http://badges.github.io/stability-badges/dist/experimental.svg)](http://github.com/badges/stability-badges)

https://mrjoh3.shinyapps.io/georefr/

`georefr` is a simple `shiny` application for georeferencing images. Images may be scaned maps or aerial images (`.jpg`, `.png`). 

Georeferencing is done by matching two clicks on the image to 2 points on the interactive map. The hard work is done using the package `[affinething](https://github.com/hypertidy/affinething)`.

```r
setExtent(image_input, affinething::domath(map_points, image_clicks, r = image_input))
```
`georefr` is developing and will definately change. Change requests, suggestions and issues are welcome.
