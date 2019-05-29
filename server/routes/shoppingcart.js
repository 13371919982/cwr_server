const express=require('express');
const pool=require('../pool');
let router=express.Router();

// 1./cartList 购物车清单
router.get('/cartList',(req,res)=>{
  let uname=req.query.uname;
  // 商品表lid和购物车表lid匹配   购物车表的uname和用户表的uname匹配 然后用购物车表lid去匹配商品表的lid数据
  let sql='select * from cwr_laptop l inner join cwr_shoppingcart_item s on l.lid=s.lid inner join cwr_user u on s.uname=u.uname where s.uname=?';
  pool.query(sql,[uname],(err,result)=>{
    if(err) throw err;
    res.send(result);
  })
})

// 2./delete 删除购物车商品
router.get('/delete',(req,res)=>{
  let lid=req.query.lid;
  let sql='delete from cwr_shoppingcart_item where lid=?'
  pool.query(sql,[lid],(err,result)=>{
    if(err) throw err;
    res.send(result);
  })
})

// 3./count 数量 
router.get('/count',(req,res)=>{
  let count=req.query.count;
  let uname=req.query.uname;
  let sql='update cwr_shoppingcart_item set count=count+? where uname=?';
  pool.query(sql,[count,uname],(err,result)=>{
    if(err) throw err;
    console.log(count);
  })
})

module.exports=router;