const express=require('express');
const pool=require('../pool');
let router=express.Router();

// 1./newsList 新闻列表
router.get('/newsList',(req,res)=>{
  let sql=`select*from cwr_news`;
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    res.send(result)
  })
})

// 2./newsDetail 新闻详情
router.get('/newsDetail',(req,res)=>{
  let nid=req.query.nid;
  let sql=`select*from cwr_news where nid=?`;
  pool.query(sql,[nid],(err,result)=>{
    if(err) throw err;
    res.send(result);
  })
})

module.exports=router;