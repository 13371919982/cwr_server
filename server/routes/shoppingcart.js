const express=require('express');
const pool=require('../pool');
let  router=express.Router();

// 1./cartList 购物车清单
router.get('/cartList',(req,res)=>{
  let uname=req.query.uname;
  // 商品表lid和购物车表lid匹配   购物车表的uname和用户表的uname匹配 然后从购物车表的uname查数据
  let sql='select * from cwr_laptop l inner join cwr_shoppingcart_item s on l.lid=s.lid inner join cwr_user u on s.uname=u.uname where s.uname=?';
  pool.query(sql,[uname],(err,result)=>{
    if(err) throw err;
    res.send(result);
  })
})

module.exports=router;