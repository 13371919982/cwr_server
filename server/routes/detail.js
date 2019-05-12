const express=require('express');
const pool=require('../pool');
let router=express.Router();

// 1./detail
router.get('/detail',(req,res)=>{
  let lid=req.query.lid;
  let sql='select * from cwr_laptop l inner join cwr_laptop_pic d on l.lid =d.did_id where lid=?';
  pool.query(sql,[lid],(err,result)=>{
    if(err) throw err;
    res.send(result);
  })
})

// 2./list 推荐搭配
router.get('/list',(req,res)=>{
  let kind=req.query.kind;
  let sql='select*from cwr_laptop where kind=?';
  pool.query(sql,[kind],(err,result)=>{
    if(err) throw err;
    res.send(result);
  })
})

// 3./like 猜你喜欢
router.get('/like',(req,res)=>{
  let lid_id=req.query.lid_id;
  let sql='select*from cwr_laptop where lid_id=?';
  pool.query(sql,[lid_id],(err,result)=>{
    if(err) throw err;
    res.send(result);
  })
})

module.exports=router;