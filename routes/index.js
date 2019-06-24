const express=require('express');
const pool=require('../pool');
let router=express.Router();

// 1.index_carousel
router.get('/carousel',(req,res)=>{
  let sql='select*from cwr_index_carousel';
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    res.send(result);
  })
})

// 2./pic
router.get('/pic',(req,res)=>{
  let sql='select*from cwr_index_pic';
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    res.send(result);
  })
})

// 3./productList
router.get('/productList',(req,res)=>{
  let sql='select*from cwr_laptop';
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    res.send(result);
  })
})

// 4./pic iid_id=4 接口
router.get('/code',(req,res)=>{
  let iid_id=req.query.iid_id;
  let sql='select*from cwr_index_pic where iid_id=?';
  pool.query(sql,[iid_id],(err,result)=>{
    if(err) throw err;
    res.send(result);
  })
})
module.exports=router;