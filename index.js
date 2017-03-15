import App from './Application/Main.elm'
import 'normalize.css'
import 'style-loader!css-loader!elm-css-webpack-loader!./Application/Stylesheets.elm'


App.Main.embed(document.getElementById('app'))
