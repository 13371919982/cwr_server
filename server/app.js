const express = require('express');
const bodyParser = require('body-parser');
// const cookieParser = require('cookie-parser');
const cors = require('cors');
const session = require('express-session');
const userRouter = require('./routes/user');
const indexRouter = require('./routes/index');
const productRouter = require('./routes/product');
const detailRouter = require('./routes/detail');

/****** APP ******/
const newsRouter = require('./routes/news');


// 创建web服务器
var app = express();
app.listen(3000);

// cloudo静态资源
app.use( express.static('cwr'));

// 使用body-parser中间件
app.use( bodyParser.urlencoded({
  extended: false
}));

// 使用cookie-parser中间件
// app.use( cookieParser());
// 获取cookie
// app.use((req,res,next)=>{
//   if(req.cookies.uname){
//     req.uname=JSON.parse(req.cookies.uname);
//   }
//   next();
// })

// 跨域
app.use( cors({
  origin: ['http://localhost:8080','http://127.0.0.1:8080'],
  credentials: true
  })
)

app.use(session({
  secret: "128位随机字符",
  resave: false,
  saveUninitialized: true
}))

// 用户挂载
app.use( '/user', userRouter);
// 主页挂载
app.use( '/index', indexRouter);
// 商品挂载
app.use( '/product', productRouter);
// 详情页挂载
app.use( '/detail', detailRouter);

/****** APP ******/
app.use( '/news', newsRouter);


