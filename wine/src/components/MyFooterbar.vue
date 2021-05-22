<template>
  <div>
    <van-tabbar v-model="active" active-color="#522555" inactive-color="#999">
      <van-tabbar-item icon="wap-home-o" to="/">首页</van-tabbar-item>
      <van-tabbar-item icon="apps-o" to="/list">分类</van-tabbar-item>
      <van-tabbar-item icon="shopping-cart-o" to="/shoppingcart"
        >购物车</van-tabbar-item
      >
      <van-tabbar-item icon="contact" to="/me">我的</van-tabbar-item>
    </van-tabbar>
  </div>
</template>

<script>
export default {
  data() {
    return {
      active: 0,
    };
  },
};
</script>