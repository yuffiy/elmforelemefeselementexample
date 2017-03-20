module Component.Icon.Element exposing (element)


{-| Loading icon

加载状态

@docs loading

-}


import Html as H          exposing (Html, div)
import Html.Attributes    exposing (style)
import Svg as S           exposing (Svg, svg, g, path)
import Svg.Attributes     exposing (..)
import Html.CssHelpers

import Component.Icon.Stylesheets as Style
import Component.Icon.Icon exposing (Config, config)


{ class } =
    Html.CssHelpers.withNamespace "Icon"


element : Config -> Html msg
element { color, size } =
    let
        px s =
            toString s ++ "px"
    in
        div [ class [ Style.Icon ]
            ]
        [ svg [ viewBox "0 0 162 42"
              , width  "100%"
              , height "auto"            
              ]
              [ g [ strokeWidth "1"
                  , transform "translate(-70.000000, -19.000000)"
                  ]
                    [ S.path
                          [ fill color
                          , d "M227.083383,47.9112611 C227.083383,47.9112611 227.398157,47.9031958 227.995773,47.9112611 C228.593389,47.9193264 228.756098,48.3677878 228.756098,48.3677878 C228.756098,48.3677878 229.955283,50.5735727 230.276749,51.106948 C230.562935,51.5817358 230.219877,51.5730618 230.140955,51.5653008 C230.141715,51.5642356 230.124684,51.5634747 230.124684,51.5634747 C230.124684,51.5634747 230.131223,51.5643878 230.140955,51.5653008 C230.137457,51.5701704 229.801546,51.5812793 226.323058,51.5634747 C221.472182,50.9051632 221.304911,46.541681 221.304911,46.541681 L221.304911,38.7807271 L218.56774,38.7807271 L218.56774,35.8893913 C218.56774,35.4952566 219.023935,35.4328646 219.023935,35.4328646 L221.304911,35.4328646 L221.304911,32.5415288 C221.304911,32.0699368 221.761106,31.9328266 221.761106,31.9328266 C221.761106,31.9328266 223.366609,31.4738651 224.300744,31.2066448 C224.6841,31.0970783 224.802407,31.3241243 224.802407,31.3241243 C224.802407,31.3241243 224.954472,31.2434712 224.954472,31.5919533 L224.954472,35.5850402 L228.908163,35.5850402 C229.29304,35.5850402 229.364359,36.0415669 229.364359,36.0415669 L229.364359,38.9329027 L224.954472,38.9329027 L224.954472,45.6286276 C224.954472,47.5748009 227.083383,47.9112611 227.083383,47.9112611 L227.083383,47.9112611 Z M215.374374,51.2591236 L212.941333,51.2591236 C212.464001,51.2591236 212.485138,50.6504213 212.485138,50.6504213 L212.485138,39.3894294 C212.485138,38.7054002 211.572748,38.476376 211.572748,38.476376 L206.554601,38.476376 C205.805985,38.476376 205.794276,39.3894294 205.794276,39.3894294 L205.794276,50.8025969 C205.794276,51.2501452 205.33808,51.2591236 205.33808,51.2591236 L202.90504,51.2591236 C202.370075,51.2591236 202.448844,50.6504213 202.448844,50.6504213 L202.448844,36.4980936 C202.448844,35.3613421 203.81743,35.1285135 203.81743,35.1285135 L214.461984,35.1285135 C215.524918,35.1285135 215.830569,36.4980936 215.830569,36.4980936 L215.830569,50.4982458 C215.830569,51.2942761 215.374374,51.2591236 215.374374,51.2591236 L215.374374,51.2591236 Z M198.038958,44.8677498 L188.610925,44.8677498 L188.610925,47.1503833 C188.610925,47.9728922 189.67538,48.2156122 189.67538,48.2156122 L197.278633,48.2156122 C197.81968,48.2156122 198.191023,48.6721389 198.191023,48.6721389 C198.191023,48.6721389 198.854483,50.0525235 199.103413,50.6504213 C199.352344,51.2483191 198.647218,51.2591236 198.647218,51.2591236 L187.242339,51.2591236 C185.868888,51.2591236 185.569624,49.5851924 185.569624,49.5851924 L185.569624,36.6502691 C185.569624,35.906435 186.634079,35.5850402 186.634079,35.5850402 L198.038958,35.5850402 C199.185072,35.5850402 199.407543,36.9546203 199.407543,36.9546203 L199.407543,43.4981697 C199.407543,44.6022034 198.038958,44.8677498 198.038958,44.8677498 L198.038958,44.8677498 Z M196.366242,39.3894294 C196.366242,39.3894294 196.270441,38.6285515 195.605917,38.6285515 L189.37125,38.6285515 C189.37125,38.6285515 188.610925,38.832619 188.610925,39.3894294 L188.610925,41.0633606 C188.610925,41.0633606 188.632822,41.8242384 189.37125,41.8242384 L195.605917,41.8242384 C195.605917,41.8242384 196.366242,41.6363016 196.366242,40.911185 L196.366242,39.3894294 L196.366242,39.3894294 Z M182.072128,51.2591236 L179.639087,51.2591236 C179.318077,51.2591236 179.182892,50.8025969 179.182892,50.8025969 L179.182892,39.3894294 C179.182892,38.6816608 178.270501,38.476376 178.270501,38.476376 L175.989525,38.476376 C175.353133,38.476376 175.2292,39.3894294 175.2292,39.3894294 L175.2292,50.8025969 C175.2292,51.1812097 174.773005,51.2591236 174.773005,51.2591236 L172.339964,51.2591236 C172.00162,51.2591236 171.883769,50.8025969 171.883769,50.8025969 L171.883769,39.3894294 C171.883769,38.6658345 170.971379,38.476376 170.971379,38.476376 L168.690403,38.476376 C167.994401,38.476376 167.930078,39.3894294 167.930078,39.3894294 L167.930078,50.8025969 C167.930078,51.2910805 167.473883,51.2591236 167.473883,51.2591236 L165.040842,51.2591236 C164.585103,51.2591236 164.584647,50.8025969 164.584647,50.8025969 L164.584647,36.345918 C164.584647,35.5084959 165.801167,35.1285135 165.801167,35.1285135 L181.007672,35.1285135 C182.228298,35.1285135 182.528323,36.6502691 182.528323,36.6502691 L182.528323,50.8025969 C182.528323,51.3282113 182.072128,51.2591236 182.072128,51.2591236 L182.072128,51.2591236 Z M160.022695,44.8677498 L150.594662,44.8677498 L150.594662,47.1503833 C150.594662,47.9728922 151.659117,48.2156122 151.659117,48.2156122 L159.26237,48.2156122 C159.803417,48.2156122 160.17476,48.6721389 160.17476,48.6721389 C160.17476,48.6721389 160.838068,50.0525235 161.08715,50.6504213 C161.336081,51.2483191 160.630955,51.2591236 160.630955,51.2591236 L149.226076,51.2591236 C147.852625,51.2591236 147.553361,49.5851924 147.553361,49.5851924 L147.553361,36.6502691 C147.553361,35.906435 148.617816,35.5850402 148.617816,35.5850402 L160.022695,35.5850402 C161.168809,35.5850402 161.391281,36.9546203 161.391281,36.9546203 L161.391281,43.4981697 C161.391281,44.6022034 160.022695,44.8677498 160.022695,44.8677498 L160.022695,44.8677498 Z M158.34998,39.3894294 C158.34998,39.3894294 158.254179,38.6285515 157.589654,38.6285515 L151.354987,38.6285515 C151.354987,38.6285515 150.594662,38.832619 150.594662,39.3894294 L150.594662,41.0633606 C150.594662,41.0633606 150.616559,41.8242384 151.354987,41.8242384 L157.589654,41.8242384 C157.589654,41.8242384 158.34998,41.6363016 158.34998,40.911185 L158.34998,39.3894294 L158.34998,39.3894294 Z M145.272385,51.2591236 L139.493913,51.2591236 C139.493913,51.2591236 135.265288,51.0594692 134.931962,46.8460321 C134.91858,42.5189199 134.931962,29.0414908 134.931962,29.0414908 L137.669133,29.0414908 C137.669133,29.0414908 138.581523,29.0249037 138.581523,29.9545442 L138.581523,45.9329787 C138.581523,45.9329787 138.899491,47.2547757 140.710434,47.7590855 C142.756621,47.7487376 143.143474,47.7590855 143.143474,47.7590855 C143.143474,47.7590855 143.936494,47.5049523 144.51206,48.5199634 C145.087626,49.5349744 145.72858,50.6504213 145.72858,50.6504213 C145.72858,50.6504213 145.820123,51.2591236 145.272385,51.2591236 L145.272385,51.2591236 Z M115.92383,50.3460702 L115.92383,30.2588953 C115.92383,29.3682117 116.684155,29.1936664 116.684155,29.1936664 L130.97827,29.1936664 C131.777676,29.1936664 131.434465,30.1067198 131.434465,30.1067198 C131.434465,30.1067198 130.988915,31.3414723 130.67414,31.9328266 C130.359365,32.5241808 129.76175,32.5415288 129.76175,32.5415288 L120.485782,32.5415288 C119.622052,32.5415288 119.573391,33.3024067 119.573391,33.3024067 L119.573391,38.3242004 L130.06588,38.3242004 C130.681439,38.3242004 130.37001,39.0850782 130.37001,39.0850782 C130.37001,39.0850782 129.584138,40.7614443 129.305555,41.2155362 C129.026971,41.6696281 128.393164,41.6720629 128.393164,41.6720629 L119.573391,41.6720629 L119.573391,46.9982077 C119.573391,47.7240852 120.333717,47.9112611 120.333717,47.9112611 L130.06588,47.9112611 C130.771614,47.9112611 130.97827,48.3677878 130.97827,48.3677878 C130.97827,48.3677878 131.942059,49.872652 132.346856,50.4982458 C132.751805,51.1238395 132.194791,51.2591236 132.194791,51.2591236 L116.83622,51.2591236 C116.201957,51.2591236 115.92383,50.3460702 115.92383,50.3460702 Z M106.790347,49.0825565 C106.779854,50.8255754 105.874459,51.214384 105.874459,51.214384 C105.874459,51.214384 90.2506875,60.2423517 89.2348929,60.8079883 C88.2283744,61.2400147 87.5556386,60.8079883 87.5556386,60.8079883 C87.5556386,60.8079883 71.2075811,51.3266895 70.6108778,50.9098807 C70.0140225,50.4930718 70.0001846,49.8438908 70.0001846,49.8438908 C70.0001846,49.8438908 70.0166076,31.0693824 70.0001846,30.2000034 C69.9837616,29.3304722 71.0687457,28.6771825 71.0687457,28.6771825 L87.4029653,19.2359059 C88.4085715,18.7051176 89.3875663,19.2359059 89.3875663,19.2359059 C89.3875663,19.2359059 103.817323,27.6233667 105.416439,28.5248547 C106.983774,29.2700585 106.790347,30.80901 106.790347,30.80901 C106.790347,30.80901 106.800079,47.4626475 106.790347,49.0825565 L106.790347,49.0825565 Z M100.398749,30.239569 C97.05423,28.3145481 89.1754355,23.7494333 89.1754355,23.7494333 C89.1754355,23.7494333 88.4067467,23.333994 87.6172249,23.7494333 L74.7928188,31.1381658 C74.7928188,31.1381658 73.9409504,31.6496278 73.9538759,32.3300048 C73.9668014,33.0103818 73.9538759,47.7035415 73.9538759,47.7035415 C73.9538759,47.7035415 73.9646725,48.2116557 74.433337,48.5377679 C74.9018494,48.8638802 87.7370522,56.284113 87.7370522,56.284113 C87.7370522,56.284113 88.2653262,56.6222471 89.0554562,56.284113 C89.8530374,55.8414343 102.119669,48.7760749 102.119669,48.7760749 C102.119669,48.7760749 102.830573,48.4717237 102.838785,47.1076219 C102.841065,46.7142481 102.841978,45.1873185 102.84213,43.2688411 L88.4000558,52.0200014 L88.4000558,48.6721389 C88.4000558,47.2970805 89.4645112,46.3895054 89.4645112,46.3895054 L102.238736,38.6920087 C102.720782,38.188612 102.820233,37.3822336 102.840761,37.0772738 C102.840305,35.6789325 102.839697,34.4574192 102.839241,33.6836065 L88.4000558,42.4329407 L88.4000558,38.9329027 C88.4000558,37.5578442 89.3124461,36.9546203 89.3124461,36.9546203 L100.398749,30.239569 Z"
                          ]
                          []
                    ]
              ]
        ]