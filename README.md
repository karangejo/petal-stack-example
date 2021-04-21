# Steps for setup 

```bash
mix phx.new petal_stack --live
cd petal_stack/assets/
npm i tailwindcss postcss autoprefixer postcss-loader@4.2 --save-dev
```
configure tailwind

```bash
vim webpack.config.js
use: [
  MiniCssExtractPlugin.loader,
  'css-loader',
  'postcss-loader', // Add this
  'sass-loader',
],

vim postcss.config.js
module.exports = {
    plugins: {
        tailwindcss: {},
        autoprefixer: {}
    }
}

npx tailwindcss init

vim tailwind.config.js
module.exports = {
  purge: [
    '../lib/**/*.ex',
    '../lib/**/*.leex',
    '../lib/**/*.eex',
    './js/**/*.js'
  ],
  theme: {},
  variants: {},
  plugins: []
};

vim package.json
"deploy": "NODE_ENV=production webpack --mode production"

vim assets/css/app.scss
@tailwind base;
@tailwind components;

@tailwind utilities;

@import "./phoenix.css"; // remove this and delete file
```
configure alpinejs

```bash
npm install alpinejs

vim assets/js/app.js
import Alpine from "alpinejs"

let csrfToken = document.querySelector("meta[name='csrf-token']").getAttribute("content")
let liveSocket = new LiveSocket("/live", Socket, {
  params: { _csrf_token: csrfToken },
  dom: {
    onBeforeElUpdated(from, to) {
      if (from.__x) { Alpine.clone(from.__x, to) }
    }
  }
})
```


# PetalStack

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `npm install` inside the `assets` directory
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
