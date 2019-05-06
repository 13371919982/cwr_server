const express=require('express');
const pool=require('../pool');
let router=express.Router();

// 1.detail 响应lid
router.get('/detail_lid',(req,res)=>{
  let lid=req.query.lid;
  let sql='select*from cwr_laptop where lid=?';
  pool.query(sql,[lid],(err,result)=>{
    if(err) throw err;
    res.send(result);
  })
})

// 2.detail 推荐搭配
router.get('/list',(req,res)=>{
  let kind=req.query.kind;
  let pno=parseInt(req.query.pno);
  let count=parseInt(req.query.count);
  pno=(pno-1)*count;
  let sql='select*from cwr_laptop where kind=? limit ?,?';
  pool.query(sql,[kind,pno,count],(err,result)=>{
    if(err) throw err;
    res.send(result);
  })
})

// 3.detail 猜你喜欢
router.get('/like',(req,res)=>{
  let lid_id=req.query.lid_id;
  let pno=parseInt(req.query.pno);
  let count=parseInt(req.query.count);
  pno=(pno-1)*count;
  let sql='select*from cwr_laptop where lid_id=? limit ?,?';
  pool.query(sql,[lid_id,pno,count],(err,result)=>{
    if(err) throw err;
    res.send(result);
  })
})
module.exports=router;