const express=require('express');
const pool=require('../pool');
let router=express.Router();

// 1./insert 添加到用户订单里面
router.get('/insert',(req,res)=>{
  let sql='insert into cwr_order set ?'
  pool.query(sql,[req.query],(err,result)=>{
    if(err) throw err;
    res.send(result);
  })
})

// 2./list 订单商品列表
router.get('/list',(req,res)=>{
  let uname=req.query.uname;
  // 商品表lid和订单表lid匹配   订单表的uname和用户表的uname匹配 然后用订单表lid去匹配商品表的lid数据
  let sql='select * from cwr_laptop l inner join cwr_order o on l.lid=o.lid inner join cwr_user u on o.uname=u.uname where o.uname=?';
  pool.query(sql,[uname],(err,result)=>{
    if(err) throw err;
    res.send(result);
  })
})

// 3./delete 删除订单商品列表
router.get('/delete',(req,res)=>{
  let uname=req.query.uname;
  // 商品表lid和订单表lid匹配   订单表的uname和用户表的uname匹配 然后用订单表lid去匹配商品表的lid数据
  let sql='delete from cwr_order where uname=?';
  pool.query(sql,[uname],(err,result)=>{
    if(err) throw err;
    res.send(result);
  })
})

module.exports=router;