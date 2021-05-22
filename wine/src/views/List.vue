<template>
  <div class="list clearfix">
    <!-- 搜索框 -->
    <div class="list-seach">
      <form action="/">
        <van-search
          v-model="value"
          placeholder="请输入搜索关键词"
          @search="onSearch"
        />
      </form>
    </div>
    <!-- 搜索框 -->

    <!-- 侧边导航卡 开始 -->
    <van-sidebar v-model="activeKey" class="list-sidebar" @change="onChange">
      <van-sidebar-item
        v-for="(f, i) of fenlei"
        :key="i"
        :title="f.fenlei"
      ></van-sidebar-item>
    </van-sidebar>
    <!-- 侧边导航卡 结束 -->

    <!-- 右边数据 开始 -->
    <div class="list-product">
      <van-grid :column-num="8" :border="false" class="item">
        <van-grid-item
          :to="`/details/${item.uid.toString()}`"
          v-for="(item, i) of list"
          :key="i"
        >
          <van-image :src="item.psrc" class="list-img"></van-image>
          <div class="list-title">
            {{ item.ptitle }}
          </div>
          <div class="list-prices">
            <span class="list-price-new">${{ item.pprice }}</span>
            <span class="list-price-old"
              >${{ (item.pprice / 0.24).toFixed(2) }}</span
            >
          </div>
          <div class="list-cankaojia">
            参考价: ¥{{
              (item.pprice / 0.24 + (item.pprice / 0.24) * 0.6).toFixed(2)
            }}
          </div>
          <van-button class="list-button">查看详情</van-button>
        </van-grid-item>
      </van-grid>
    </div>
    <!-- 右边数据 结束 -->

    <!-- 底部导航 开始 -->
    <my-footer></my-footer>
    <!-- 底部导航 结束 -->
  </div>
</template>

<script>
import Vue from "vue";
import { Sidebar, SidebarItem, Toast } from "vant";
Vue.use(Sidebar);
Vue.use(SidebarItem);
export default {
  data() {
    return {
      value: "",

      // 侧边导航
      activeKey: 0,
      // 分类
      fenlei: [],
      // 分类商品
      details: [],
      list: [],
    };
  },
  methods: {
    onSearch(val) {
      Toast(val);
    },
    // 分类商品
    onChange(index) {
      this.axios.get("/list?id=" + index).then((res) => {
        this.list = res.data.results;
        console.log(this.list);
      });
    },
    // 分类
    classFont() {
      this.axios.get("/fenlei").then((res) => {
        this.fenlei = res.data.results;
        console.log(this.fenlei);
      });
    },
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
    this.classFont();
    this.onChange();
    this.getdetails();
  },
};
</script>

<style>
.list .van-grid.item .van-grid-item__content {
  padding: 0 !important;
}
.list .list-seach {
  width: 100%;
  height: 4rem;
  position: fixed;
  z-index: 99999;
}
.list .van-search__content {
  box-sizing: border-box !important;
  padding-left: 1rem !important;
  border: 0.1rem solid #e5e5e5 !important;
  border-radius: 1rem !important;
  background-color: #fff;
}
.list .list-sidebar {
  margin-top: 3.63rem;
}
/* 侧边导航 开始 */
.list .van-sidebar {
  width: 6rem;
  overflow: hidden;
  height: 560px !important;
  float: left;
}
.list .van-sidebar-item--select,
.van-sidebar-item--select:active {
  color: #522555 !important;
  font-weight: 700 !important;
  background-color: #fff !important;
}
.list .van-sidebar-item {
  box-sizing: border-box;
  width: 100%;
  height: 5rem;
  border-left: 0.06rem solid transparent;
  background-color: #fafafa;
  text-align: center;
  line-height: 3rem;
  font-size: 1rem;
}
.van-sidebar-item--select::before {
  position: absolute;
  left: 0;
  width: 5px;
  height: 120px !important;
  background-color: #522555 !important;
  -webkit-transform: translateY(-50%);
  transform: translateY(-50%);
  content: "";
}
/* 侧边导航 结束 */
.list .list-product {
  margin-bottom: 4rem;
  margin-top: 3.63rem;
  padding-bottom: 1rem;
  background: #fafafa;
}
.list .list-img {
  width: 70%;
}
.list .list-title {
  font-size: 14px;
  color: #212121;
  line-height: 20px;
  margin: 0.5rem 0 0.15rem 0;
  overflow: hidden;
  text-overflow: ellipsis;
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
}
.list .list-prices {
  width: 100%;
  overflow: hidden;
  padding-top: 0.4rem;
  font-family: PingFangSC-Medium;
}
.list .list-price-new {
  font-size: 14px;
  font-weight: 700;
  color: #333;
  text-align: left;
  padding-left: 0.2rem;
}
.list .list-price-old {
  color: #999;
  padding-left: 2rem;
  text-decoration: line-through;
  font-size: 14px;
}
.list .list-cankaojia {
  text-align: center;
  width: 100%;
  font-size: 14px;
  margin-top: 0.5rem;
  color: #999;
  font-weight: 600;
}
.list .list-button {
  width: 100%;
  height: 25px !important;
  border-radius: 30px;
  font-size: 12px !important;
  color: #fff;
  background-color: #522555;
}
</style>