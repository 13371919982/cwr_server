//引入express
const express=require('express');
//引入连接池模块
const pool=require('../pool.js');
//创建路由器对象
var router=express.Router();

// 1.用户登录
router.post('/login',(req,res)=>{
  let uname=req.body.uname;
  let upwd=req.body.upwd;
  let sql='select*from cwr_user where uname=? and upwd=?';
  pool.query(sql,[uname,upwd],(err,result)=>{
    if(err) throw err;
    if(result.length>0)
      res.send('登录成功');
    else
      res.send('1');
  });
});

// 2.验证用户是否被占用 
router.get('/code',(req,res)=>{
  let uname=req.query.uname;
  let sql='select uname from cwr_user where uname=?';
  pool.query(sql,[uname],(err,result)=>{
    if(err) throw err;
    if(result.length>0){
      res.send('用户名被占用')
    }else{
      res.send('1')
    }
  })
})

// 3.用户注册
router.post('/reg',(req,res)=>{
  let sql='insert into cwr_user set ?';
  pool.query(sql,[req.body],(err,result)=>{
    if(err) throw err;
    res.send('1');
  })
})

// 4.后台管理 用户列表
router.get('/list',(req,res)=>{
  let sql=`select*from cwr_user`;
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    res.send(result);
  })
})

//导出路由器
module.exports=router;