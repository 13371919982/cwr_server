const express=require('express');
const pool=require('../pool');
let router=express.Router();

// 1./detail
router.get('/detail',(req,res)=>{
  let lid=req.query.lid;
  let sql='select * from cwr_laptop l inner join cwr_laptop_pic d on l.lid=d.did_id where lid=?';
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

// 4./productLid 查询匹配重复的商品
router.get('/productLid',(req,res)=>{
  let uname=req.query.uname;
  let lid=req.query.lid;
  let sql='select*from cwr_shoppingcart_item where uname=? and lid=?';
  pool.query(sql,[uname,lid],(err,result)=>{
    if(err) throw err;
    res.send(result);
  })
})

// 5./update 如果购物车清单商品重复 只修改数量
router.get('/update',(req,res)=>{
  let lid=req.query.lid;
  let count=req.query.count;
  let sql='update cwr_shoppingcart_item set count=count+? where lid=?';
  pool.query(sql,[count,lid],(err,result)=>{
    if(err) throw err;
    res.send(result);
  })
})

// 6./addcar 加入购物车
router.get('/addcar',(req,res)=>{
  let sql='insert into cwr_shoppingcart_item set ?';
  pool.query(sql,[req.query],(err,result)=>{
    if(err) throw err;
    res.send(result);
  })
})

// 7./additemlid 验证是否有收藏
router.get('/additemlid',(req,res)=>{
  let uname=req.query.uname;
  let lid=req.query.lid;
  let sql='select*from cwr_additem where uname=? and lid=?';
  pool.query(sql,[uname,lid],(err,result)=>{
    if(err) throw err;
    res.send(result);
  })
})

// 8./additem 加入收藏
router.get('/additem',(req,res)=>{
  let sql='insert into cwr_additem set ?';
  pool.query(sql,[req.query],(err,result)=>{
    if(err) throw err;
    res.send(result);
  })
})

// 9./deleteAdditem 取消收藏
router.get('/deleteAdditem',(req,res)=>{
  let lid=req.query.lid;
  let sql='delete from cwr_additem where lid=?';
  pool.query(sql,[lid],(err,result)=>{
    if(err) throw err;
    res.send('1');
  })
})

module.exports=router;