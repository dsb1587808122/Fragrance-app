<template>
  <div class="product-card">
    <div class="search-bar-box mrb">
      <router-link to="/">
        <i class="ui-icon-back"></i>
      </router-link>
      <form class="input-box cmp-dropdownsearch">
        <div class="input-wrap">
          <input
            id="search-input"
            type="search"
            autocomplete="off"
            class="search-input"
          />
          <input id="encodeVal" type="hidden" name="q" />
        </div>
        <button type="submit" class="ml4">
          <i class="ui-icon-search"></i>
        </button>
      </form>
      <router-link to="/" class="right-icon-item"
        ><i class="ui-icon-home"></i
      ></router-link>
    </div>
    <div v-for="(item, i) of list" :key="i" class="mrb">
      <van-card
        :price="`${(item.pprice / 0.24).toFixed(2)}`"
        :desc="`$${item.pprice}`"
        :title="item.ptitle"
        :thumb="item.psrc"
        class="card"
      />
    </div>
  </div>
</template>

<script>
import Vue from "vue";
import { Card, NavBar } from "vant";
Vue.use(NavBar).use(Card);
import { Sidebar, SidebarItem } from "vant";
Vue.use(Sidebar);
Vue.use(SidebarItem);
export default {
  data() {
    return {
      list: [],
    };
  },
  methods: {
    // // 分类商品
    // onChange(index) {
    //   console.log(index);
    //   this.axios.get("/list?id=" + index).then((res) => {
    //     this.list = res.data.results;
    //     console.log(this.list);
    //   });
    // },
    loadData(fid) {
      // 前台请求数据
      let object = {
        fid: fid,
      };
      let str = "?" + this.qs.stringify(object);
      this.axios.get("/productcard" + str).then((res) => {
        // 将获取到的文章数据赋予变量articles
        this.list = res.data.results;
      });
    },
  },
  mounted() {
    // this.onChange();
    this.loadData();
  },
};
</script>
<style>
.product-card {
  height: 1000px;
}
.product-card .search-bar-box {
  overflow: hidden;
  transition: all 0.3s ease;
  background-color: #fff;
  width: 100%;
  height: 44px;
  padding: 8px 12px;
}
.product-card .search-bar-box > * {
  float: left;
}
.product-card .search-bar-box > :not(.input-box) {
  display: block;
  width: 1.64rem;
}
.product-card .ui-icon-back {
  background: url(https://basedata.azoyacdn.com/uploads/basedata/images/8b2dd70571798740bc584309335a501d.png)
    no-repeat -3.4rem 0;
  background-size: 4rem auto;
  width: 1.5rem;
  height: 1.5rem;
  margin-top: 0.5rem;
}
.product-card .search-bar-box .input-box {
  width: 17rem;
  padding-left: 0.8rem;
  border-radius: 1rem;
  background-color: #f2f2f2;
  font-size: 0px;
  height: 1.8rem;
  line-height: 1.5rem;
}
.product-card .search-bar-box .input-box .input-wrap {
  font-size: 0.9rem;
  width: 10rem;
  height: 100%;
}
.product-card .search-bar-box .input-box > * {
  display: inline-block;
  vertical-align: middle;
}
.product-card .search-bar-box .input-box .search-input {
  width: 100%;
  height: 100%;
  background: transparent;
  padding: 0 0.3rem;
  outline: none;
  border: none;
  font-size: 0.9rem;
  -webkit-appearance: none;
}
[type="search"] {
  outline-offset: -2px;
}
[type="button"],
[type="reset"],
[type="submit"],
button {
  cursor: pointer;
  -webkit-appearance: button;
}
button,
input[type="button"] {
  outline: none;
  border: none;
  background: transparent;
}
.ui-icon-search {
  background: url(https://basedata.azoyacdn.com/uploads/basedata/images/8b2dd70571798740bc584309335a501d.png)
    no-repeat -45px -48px;
  background-size: 5rem 7rem;
  width: 1.8rem;
  height: 1.5rem;
}
.ml4 {
  margin-left: 4rem;
}
i {
  display: block;
}
.product-card .mrb {
  margin-bottom: 10px;
}
.product-card .card {
  background: #fff;
}
.product-card .van-card__desc {
  margin-top: 10px;
  font-size: 16px;
  color: #cc3314;
}
.product-card .van-card__price-integer {
  font-size: 13px;
}
.product-card .ui-icon-home {
  background: url("//basedata.azoyacdn.com/uploads/basedata/images/8b2dd70571798740bc584309335a501d.png")
    no-repeat 0 0;
  background-size: 5.5rem auto;
  width: 1.5rem;
  height: 1.5rem;
  margin-top: 0.3rem;
  margin-left: 2rem;
}
</style>