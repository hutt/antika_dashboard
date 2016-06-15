![verbinski widget](https://raw.github.com/ysim/verbinski/master/screenshots/2013-06-10-11-19.png)

Link to the full repo: <https://github.com/ysim/verbinski>

1. Download the [Climacons](http://adamwhitcroft.com/climacons/) [SVG files](https://github.com/AdamWhitcroft/Climacons/tree/master/SVG) and add them to the folder `assets/images/climacons/`. 
1. Set the environment variables `FORECAST_API_KEY`, `LATITUDE`, and `LONGITUDE`. (You can get your latitude and longitude [here](http://itouchmap.com/latlong.html)). 
1. Copy the files to their respective locations:

        `verbinski.coffee` -> `widgets/verbinski/verbinski.coffee`
        `verbinski.html` -> `widgets/verbinski/verbinski.html`
        `verbinski.scss` -> `widgets/verbinski/verbinski.scss`
        `verbinski.js` -> `assets/javascripts/verbinski.js`
        `verbinski.rb` -> `jobs/verbinski.rb`

1. Put the `verbinski.erb` snippet in one of your dashboards. 

1. Note that you'll have to comment out [line 144 of assets/stylesheets/application.scss](https://github.com/Shopify/dashing/blob/7b2a1e7cbd4bfc7cb256b4d374906ab90ad4360c/templates/project/assets/stylesheets/application.scss#L144); this removes the padding from the widgets so that all the content can fit.

        // padding: 25px 12px;