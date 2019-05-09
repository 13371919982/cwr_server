const express=require('express');
const pool=require('../pool');
let router=express.Router();

// 1.index_carousel 接口
router.get('/index_carousel',(req,res)=>{
  let sql='select*from cwr_index_carousel';
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    res.send(result);
  })
})

// 2.index_pic iid_id=1 接口 
router.get('/index_pic',(req,res)=>{
  let sql='select*from cwr_index_pic';
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    res.send(result);
  })
})

// 3.index_product 接口
router.get('/index_product',(req,res)=>{
  let sql='select*from cwr_index_product';
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    res.send(result);
  })
})

// 4.index_pic iid_id=4 接口
router.get('/index_pic_footer',(req,res)=>{
  let iid_id=req.query.iid_id;
  let sql='select*from cwr_index_pic where iid_id=?';
  pool.query(sql,[iid_id],(err,result)=>{
    if(err) throw err;
    res.send(result);
  })
})
module.exports=router;