<template>
  <div class="me">
    <!-- 顶部 -->
    <van-nav-bar title="个人中心" class="navbarcolor" />
    <!-- 用户 -->
    <div class="head-banner">
      <div class="head-banner-box">
        <div class="header-button-setting"></div>
        <div class="head-bar">
          <div class="head-bar-left">
            <div class="head-bar-left-img">
              <img :src="userInfo.avatar" alt="" />
            </div>
            <div v-if="isLogined == 1">
              <span>您好，{{ userInfo.user_name || userInfo.username }}</span>
              &nbsp;
              <van-button class="out-btn" @click="logout">退出</van-button>
            </div>
            <div v-else>
              <router-link to="/login" class="user">登录</router-link>
              &nbsp;
              <router-link to="/register" class="user">注册</router-link>
            </div>
          </div>
        </div>
      </div>
      <div class="head-banner-imgbox">
        <img
          src="https://img-resource.azoyacdn.com/media/581d9b3614af9e4cfe60b2b17898b11c/134595/36b94c227e8041c8531dd6bc53541c7b.jpg"
          alt=""
        />
      </div>
    </div>
    <!-- 用户功能 -->
    <div class="user-center">
      <div class="menu-box">
        <ul>
          <li class="menu-box-li">
            <router-link to="" style="font-weight: 700">
              我的订单
              <van-icon name="arrow" />
            </router-link>
          </li>
        </ul>
      </div>
      <div class="main">
        <div class="items-box">
          <div class="items-box-li">
            <router-link
              to=""
              class="li-each"
              v-for="(p, i) of names1"
              :key="i"
            >
              <div class="li-each-top">
                <van-icon :name="icons1[i]" size="25px" />
              </div>
              <h4 class="li-each-bottom">{{ names1[i] }}</h4>
            </router-link>
          </div>
        </div>
      </div>
      <div class="menu-box" style="margin-top: 1rem">
        <ul>
          <li class="menu-box-li">
            <router-link to="" style="font-weight: 700">
              我的服务
              <van-icon name="arrow" />
            </router-link>
          </li>
        </ul>
      </div>
      <div class="main">
        <div class="items-box">
          <div class="items-box-li">
            <router-link to="" class="li-each" v-for="(v, i) of names" :key="i">
              <div class="li-each-top">
                <van-icon :name="icons[i]" size="22px" />
              </div>
              <h4 class="li-each-bottom">{{ names[i] }}</h4>
            </router-link>
          </div>
        </div>
      </div>
      <div class="menu-box" style="margin: 1rem 0 5rem 0">
        <ul>
          <li
            class="menu-box-li"
            v-for="(item, index) of li_title"
            :key="index"
          >
            <router-link to="" style="font-weight: 700">
              {{ item }}
              <van-icon name="arrow" />
            </router-link>
          </li>
        </ul>
      </div>
    </div>

    <!-- 底部 -->
    <my-footer></my-footer>
  </div>
</template>

<script>
import { mapState, mapMutations } from "vuex";
export default {
  data() {
    return {
      isLogin: 0,
      li_title: ["关于我们", "常见问题"],
      names: ["优惠券", "收藏夹", "评价晒单", "地址", "闲置换钱", "售后服务"],
      icons: [
        "coupon-o",
        "like-o",
        "chat-o",
        "free-postage",
        "balance-o",
        "flower-o",
      ],
      names1: ["代付款", "已付款", "已发货", "已完成", "已取消"],
      icons1: ["pending-payment", "certificate", "logistics", "sign", "close"],
    };
  },
  computed: {
    ...mapState(["isLogined", "userInfo"]),
  },
  methods: {
    ...mapMutations(["logoutMutation"]),
    // 用户注销
    logout() {
      localStorage.clear();
      this.logoutMutation();
    },
  },
};
</script>

<style>
.me .van-nav-bar__content {
  background-image: linear-gradient(to right, #522555, #943579, #522555);
}
.me .van-nav-bar__title {
  color: #fff;
}
.me .head-banner {
  position: relative;
}
.me .head-banner-box {
  position: absolute;
  left: 0;
  right: 0;
}
.me .header-button-setting {
  height: 1.88rem;
  line-height: 1.88rem;
  position: relative;
}
.me .head-bar,
.me .head-bar-left {
  display: flex;
  align-items: center;
}
.me .head-bar {
  padding: 1rem 1rem;
}
.me .head-bar-left {
  flex: 1;
  overflow: hidden;
}
.me .head-bar-left-img {
  width: 4rem;
  height: 4rem;
  border: 1px solid transparent;
  border-radius: 50%;
  overflow: hidden;
}
.me .head-bar-left-img img {
  width: 100%;
}
.me .head-bar-left span,
.me .user {
  margin-left: 16px;
  font-size: 16px;
  color: #9904e5;
}
.me .out-btn {
  padding: 0 !important;
  margin: 0;
  height: 0 !important;
  background-color: transparent;
  border: none;
  border-radius: 0;
  outline: none;
  top: -7px;
}
.me .head-banner-imgbox {
  font-size: 0;
  width: 100%;
  background: transparent;
}
.me .head-banner-imgbox img {
  width: 100%;
}
.me .user-center {
  overflow: hidden;
  position: relative;
}
.me .menu-box {
  border: 0;
  background-color: #fff;
}
.me .menu-box-li a {
  position: relative;
  box-sizing: border-box;
  display: block;
  line-height: 3rem;
  font-size: 1rem;
  color: #333;
  padding: 0 0.8rem;
  height: 3rem;
  border-bottom: 1px solid #e5e5e5;
}
.me .van-icon-arrow::before {
  position: relative;
  left: 16rem;
}
.me .main {
  padding-top: 1.4rem;
  background-color: #fff;
}
.me .items-box {
  padding: 1.4rem;
}
.me .items-box-li {
  display: flex;
  justify-content: space-between;
  flex-wrap: wrap;
  flex-basis: 20%;
  /* font-size: 0; */
}
.me .items-box-li .li-each {
  display: block;
  width: 3.5rem;
  text-align: center;
}
.me .li-each-top {
  padding-bottom: 0.5rem;
}
.me .items-box-li .li-each .li-each-bottom {
  padding-bottom: 1rem;
  font-size: 14px;
  font-weight: normal;
}
</style>