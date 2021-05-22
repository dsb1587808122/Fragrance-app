<template>
  <div class="my-index clearfix">
    <!-- 页头开始 -->
    <div
      class="index-header clearfix"
      style="potision: fixed; padding-bottom: 63px"
    >
      <router-link to="/" class="new-logo">
        <img
          src="https://img-resource.azoyacdn.com/media/4306bf97496445231c1f8fe295acf957/10173/6d98adceffdacbb9b9e4106d4b3e125c.png"
          alt=""
          class="header-img"
        />
      </router-link>
      <form action="/">
        <van-search
          v-model="value"
          show-action
          placeholder="娇兰"
          @search="onSearch"
          @cancel="onCancel"
          class="index-search"
        >
          <template #action>
            <div @click="onSearch">搜索</div>
          </template>
        </van-search>
      </form>
    </div>
    <!-- 页头结束 -->

    <!-- 轮播图开始 -->
    <van-swipe class="my-swipe" :autoplay="2000">
      <van-swipe-item v-for="(c, i) of carousel" :key="i">
        <van-image width="100%" height="100%" :src="c.src" />
      </van-swipe-item>
    </van-swipe>
    <!-- 轮播图结束 -->

    <!-- 商品选项卡开始 -->
    <van-grid :border="false" :column-num="4">
      <van-grid-item
        v-for="(f, i) of fenlei"
        :key="i"
        :to="`/productcard/${list.id}`"
      >
        <van-image :src="f.fsrc" width="2.5rem" height="2.5rem" fit="cover" />
        <span>{{ f.fenlei }}</span>
      </van-grid-item>
    </van-grid>
    <!-- 商品选项卡结束 -->

    <!-- 商品 开始 -->
    <div class="index-product clearfix">
      <div class="index-h1">热卖推荐</div>
      <van-grid :column-num="2">
        <van-grid-item
          class="product"
          v-for="(item, i) of index.slice(0, 14)"
          :key="i"
        >
          <router-link
            :to="`/details/${item.uid.toString()}`"
            class="product-a"
          >
            <van-image :src="item.psrc" class="product-img"></van-image>
            <div class="index-title">
              {{ item.ptitle }}
            </div>
            <div class="index-prices">
              <span class="index-price-new">${{ item.pprice }}</span>
              <span class="index-price-old"
                >${{ (item.pprice / 0.24).toFixed(2) }}</span
              >
            </div>
            <div class="cankaojia">
              参考价: ¥{{
                (item.pprice / 0.24 + (item.pprice / 0.24) * 0.6).toFixed(2)
              }}
            </div>
          </router-link>
          <van-button class="cart"></van-button>
        </van-grid-item>
      </van-grid>
    </div>
    <div class="index-product clearfix">
      <div class="index-h1">新品推荐</div>
      <van-grid :column-num="2">
        <van-grid-item
          class="product"
          v-for="(item, i) of index.slice(14, 27)"
          :key="i"
        >
          <router-link
            :to="`/details/${item.uid.toString()}`"
            class="product-a"
          >
            <van-image :src="item.psrc" class="product-img"></van-image>
            <div class="index-title">
              {{ item.ptitle }}
            </div>
            <div class="index-prices">
              <span class="index-price-new">${{ item.pprice }}</span>
              <span class="index-price-old"
                >${{ (item.pprice / 0.24).toFixed(2) }}</span
              >
            </div>
            <div class="cankaojia">
              参考价: ¥{{
                (item.pprice / 0.24 + (item.pprice / 0.24) * 0.6).toFixed(2)
              }}
            </div>
          </router-link>
          <van-button class="cart"></van-button>
        </van-grid-item>
      </van-grid>
    </div>
    <!-- 商品 结束 -->

    <!-- 精选活动开始 -->
    <div class="index-huodong">
      <div class="index-h1">精选活动</div>
      <van-row class="van_row">
        <van-col span="9" offset="1">
          <van-image
            src="https://img-resource.azoyacdn.com/media/2695d66af6f99109e78ab92c955db0ba/22160/9253557189f6e6d85a6e727a5b43adee.jpg"
          ></van-image>
        </van-col>
        <van-col span="12" offset="1">
          <van-image
            src="https://img-resource.azoyacdn.com/media/a05feee258f224ed3dfed64c4180c8d0/16457/7195b91583712283d090dbd3d93e6397.jpg"
          ></van-image>
          <van-image
            src="https://img-resource.azoyacdn.com/media/a05feee258f224ed3dfed64c4180c8d0/16775/4055d103aca52fefbd539c6d610a839e.jpg"
          ></van-image>
        </van-col>
      </van-row>
    </div>
    <!-- 精选活动结束 -->

    <!-- 畅销推荐 开始 -->
    <!-- 滑块导航CSS，后修改 -->
    <div class="index-product clearfix">
      <div class="index-h1">畅销推荐</div>

      <!-- 滑块导航 -->
      <van-grid clickable :column-num="6" class="slide-box">
        <van-grid-item text="路由跳转" to="/" class="slide-item active">
          平价香水
        </van-grid-item>
        <van-grid-item
          text="路由跳转"
          to="/"
          class="slide-item"
          v-for="(v, i) of sg"
          :key="i"
        >
          {{ v }}
        </van-grid-item>
      </van-grid>
      <van-grid :column-num="2">
        <van-grid-item
          class="product"
          v-for="(item, i) of index.slice(27, 32)"
          :key="i"
        >
          <router-link
            :to="`/details/${item.uid.toString()}`"
            class="product-a"
          >
            <van-image :src="item.psrc" class="product-img"></van-image>
            <div class="index-title">
              {{ item.ptitle }}
            </div>
            <div class="index-prices">
              <span class="index-price-new">${{ item.pprice }}</span>
              <span class="index-price-old"
                >${{ (item.pprice / 0.24).toFixed(2) }}</span
              >
            </div>
            <div class="cankaojia">
              参考价: ¥{{
                (item.pprice / 0.24 + (item.pprice / 0.24) * 0.6).toFixed(2)
              }}
            </div>
          </router-link>
          <van-button class="cart"></van-button>
        </van-grid-item>
      </van-grid>
      <van-button size="large" class="index-button">查看更多 >></van-button>
    </div>
    <!-- 畅销推荐 结束 -->

    <!-- 优选专题 开始 -->
    <div class="index-product clearfix">
      <div class="index-h1">优选专题</div>
      <div v-for="(a, b) of 2" :key="b">
        <div style="padding: 0 16px">
          <van-image :src="yximg[b]"></van-image>
        </div>
        <!-- 栅格 滑块 商品 开始 -->
        <van-grid :column-num="4" class="slide-box">
          <van-grid-item
            style="padding: 0 1rem !important"
            class="slide-itme special-list"
            v-for="(item, i) of index.slice(8, 12)"
            :key="i"
            :to="`/details/${item.uid.toString()}`"
          >
            <div class="list-a">
              <van-image :src="item.psrc" class="list-img"></van-image>

              <div class="desc-name">
                {{ item.ptitle }}
              </div>
              <div class="desc-price product-price">
                <span class="index-price-new">${{ item.pprice }}</span>
                <span class="price-was"
                  >${{ (item.pprice / 0.24).toFixed(2) }}</span
                >
              </div>
              <div class="product-rmbprice price-rmb-wrap">
                参考价：￥{{
                  (item.pprice / 0.24 + (item.pprice / 0.24) * 0.6).toFixed(2)
                }}
              </div>
            </div>
          </van-grid-item>
        </van-grid>
      </div>
    </div>
    <!-- 优选专题 结束 -->

    <!-- 底部 开始 -->
    <div class="index-footer">
      ©2019 fragrancenet.cn All Rights Reserved.
      <br />
      Designed by Azoya.粤ICP备13081207号-9
    </div>
    <!-- 底部 结束 -->

    <my-footer></my-footer>
  </div>
</template>

<script>
import { Toast } from "vant";
import Vue from "vue";
import { Lazyload } from "vant";
import { Sidebar, SidebarItem } from "vant";
Vue.use(Sidebar);
Vue.use(SidebarItem);
// import MyFooter from "../components/MyFooterbar.vue";
Vue.use(Lazyload);
export default {
  // components: {
  //   MyFooter,
  // },
  name: "Home",
  data() {
    return {
      // 分类
      fenlei: [],
      // 全部商品
      index: [],
      // 搜索
      value: "",
      // 轮播图
      carousel: [],
      // 滑块
      sg: ["高颜值香水", "面部护理", "礼盒套装", "人气美妆", "身体洗护"],
      // 优选专题
      yximg: [
        "https://img-resource.azoyacdn.com/media/987ee44ebe9ffe53f625f65752ea6138/141987/97501c4970d40bca2e5ea86867466b57.jpg",
        "https://img-resource.azoyacdn.com/media/66f677cea6316e40b8e3720c572645cb/41677/c3dd9263885611fdc5982eb789aa6f64.jpg",
      ],
      // 详情
      details: [],
      list: [],
    };
  },
  methods: {
    // 搜索
    onSearch(val) {
      console.log(val);
      Toast(val);
    },
    onCancel() {
      Toast("取消");
    },
    // 全部商品信息
    getperfume() {
      this.axios.get("/index").then((res) => {
        this.index = res.data.results;
        console.log(this.index);
      });
    },
    // 分类
    classFont() {
      this.axios.get("/fenlei").then((res) => {
        this.fenlei = res.data.results;
        console.log(this.fenlei);
      });
    },
    // 分类商品
    onChange(index) {
      this.axios.get("/list?id=" + index).then((res) => {
        this.list = res.data.results;
        console.log(this.list);
      });
    },
    // 详情
    getdetails() {
      let uid = this.$route.params.uid;
      this.axios
        .get("/details", {
          params: {
            uid: uid,
          },
        })
        .then((res) => {
          this.details = res.data.results;
          console.log(this.details);
        });
    },
  },
  mounted() {
    this.axios.get("/carousel").then((res) => {
      this.carousel = res.data.result;
      // console.log(this.carousel);
    });
    this.getperfume();
    this.classFont();
    this.getdetails();
    this.onChange();
  },
};
</script>


<style>
.index-header {
  height: 3rem;
  line-height: 3rem;
  width: 100%;
  background-color: #fff;
  z-index: 100;
  text-align: center;
  position: fixed;
}
.my-swipe {
  margin-top: 65px;
}
.new-logo {
  box-sizing: border-box;
  display: block;
  width: 8rem;
  height: 1.56rem;
  margin: 1rem auto auto 1rem;
  float: left;
}
.header-img {
  height: 1.5rem;
}
.index-search {
  float: right;
  width: 11.5rem;
  height: 1.56rem;
  line-height: 1.56rem;
  margin: 1.2rem 1.5rem 0 0;
  box-sizing: content-box;
  border: 0.08rem solid #000;
  border-radius: 1.29rem;
  color: #999;
  outline: none;
}
.my-index .van-search__content {
  background: transparent !important;
  padding: 0 !important;
}
.my-index .van-grid-item__content {
  padding: 16px 0 !important;
}
.index-product {
  background: #fff;
  margin-top: 1rem;
  position: relative;
}
.index-h1 {
  margin-top: 1.2rem;
  font-family: PingFangSC-Medium;
  font-size: 1.25rem;
  height: 1.25rem;
  line-height: 1.25rem;
  color: #333;
  text-align: center;
  margin-bottom: 1.2rem;
  font-weight: 700;
}
.index-product .van-grid-item__content:first-child {
  margin-top: 0;
}
.product .van-grid-item__content {
  box-sizing: border-box !important;
  width: 11rem !important;
  float: left !important;
  height: 15rem !important;
  text-align: center !important;
  position: relative !important;
  padding: 0 0.5rem !important;
  border: none !important;
  margin-left: 0.5rem;
}
.product a .product-img {
  display: block;
  width: 7rem !important;
  height: 7rem !important;
  float: none !important;
  margin: 15px 24px 0 !important;
}
.product .index-title {
  margin-top: 0.5rem;
}
.index-title {
  color: #212121;
  font-size: 0.85rem;
  text-align: left;
  line-height: 1.2rem;
  overflow: hidden;
  text-overflow: ellipsis;
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
}
.index-prices {
  overflow: hidden;
  padding-top: 0.5rem;
  text-align: left;
}
.index-price-new {
  font-size: 1rem;
  font-weight: 700;
}
.index-price-old {
  color: #999 !important;
  padding-top: 0.08rem;
  text-decoration: line-through;
  font-size: 0.9rem;
  margin-left: 0.5rem;
}
.index-prices span {
  display: inline-block;
  color: #333;
  text-align: left;
  font-family: PingFangSC-Medium;
}
.cankaojia {
  text-align: left;
  font-size: 0.78rem;
  color: #999;
  margin-top: 0.28rem;
}
.cart {
  position: absolute !important;
  bottom: 1rem !important;
  right: 1rem !important;
  width: 2rem !important;
  height: 2rem !important;
  border: 1.2px solid #522555 !important;
  background: #522555 url(.././assets/cart.png) 50% no-repeat !important;
  border-radius: 100% !important;
}
.index-huodong {
  background: #fff;
  padding: 1.5rem 0;
  margin-top: 1rem;
  height: 22rem;
  box-sizing: border-box;
}
.my-index .van_row {
  margin-top: 1.3rem;
}
.index-huodong .index-h1 {
  margin-top: 0;
}
.my-index .van-col--9 {
  width: 40% !important;
}
.my-index .van-col--12 {
  width: 53% !important;
}
.my-index .van-col--offset-1 {
  margin-left: 2.16667% !important;
}
.index-button {
  margin: 1.5rem 0 !important;
  border: 1px solid #999 !important;
  border-radius: 2rem !important;
  font-size: 0.28rem;
  color: #333 !important;
}
/* 滑块商品 */
.slide-box {
  display: -webkit-box !important;
  overflow-x: scroll !important;
  padding-left: 10px;
}
.slide-box::-webkit-scrollbar {
  width: 0 !important;
  height: 0 !important;
  display: none !important;
}
.slide-item {
  width: 4rem;
  height: 2.2rem;
  line-height: 1.9rem;
  font-size: 0.8rem;
  color: #666;
  text-align: center;
  margin-right: 1.5rem;
}
.slide-item.active {
  border-bottom: 0.4rem solid #943579;
  color: #943579;
  font-size: 0.8rem;
}
.slide-box [class*="van-hairline"]::after {
  border: none !important;
  content: none !important;
}
/* 滑块商品样式 */
.list-a {
  display: block;
  width: 8rem;
  height: 17rem;
  /* margin-left: 1.2rem; */
}
.special-list {
  text-align: center;
  height: 20rem;
}
.list-img {
  width: 100%;
}
.desc-name {
  line-height: 1.5rem;
  font-size: 1rem;
  font-family: ArialMT;
  color: #333;
  overflow: hidden;
  text-overflow: ellipsis;
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
  text-align: left;
}
.special-list .desc-price {
  margin-top: 1rem;
  font-size: 1rem;
  text-align: left;
  line-height: 1rem;
}
.special-list .index-price-new {
  color: #333;
  font-size: 1rem;
  font-weight: 700;
}
.special-list .price-was {
  display: block;
  font-size: 1rem;
  margin-top: 5px;
  color: #999;
  text-decoration: line-through;
}
.special-list .price-rmb-wrap {
  /* margin-top: 0.1rem; */
  font-size: 0.9rem;
  color: #999;
  text-align: left;
}
.index-footer {
  width: 100%;
  height: 4rem;
  padding: 1rem 0;
  margin-bottom: 5rem;
  background: #522555;
  line-height: 0.9rem;
  text-align: center;
  font-size: 0.9rem;
  color: #a694a8;
}
</style>