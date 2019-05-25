const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const session = require('express-session');
const user = require('./routes/user');
const index = require('./routes/index');
const product = require('./routes/product');
const detail = require('./routes/detail');
const shoppingcart = require('./routes/shoppingcart');

/****** APP ******/
const news = require('./routes/news');


// 创建web服务器
var app = express();
app.listen(3000);

// cloudo静态资源
app.use( express.static('cwr'));

// 使用body-parser中间件
app.use( bodyParser.urlencoded({
  extended: false
}));

// 跨域
app.use( cors({
  origin: ['http://localhost:8080','http://127.0.0.1:8080'],
  credentials: true
  })
)

app.use(session({
  secret: "128位随机字符",
  cookie:{
    // 过期时间ms
    maxAge:60*1000*30
  },
  resave: false,
  saveUninitialized: true
}))

// 用户挂载
app.use( '/user', user);
// 主页挂载
app.use( '/index', index);
// 商品挂载
app.use( '/product', product);
// 详情页挂载
app.use( '/detail', detail);
// 购物车挂载
app.use( '/shoppingcart', shoppingcart);

/****** APP ******/
app.use( '/news', news);


