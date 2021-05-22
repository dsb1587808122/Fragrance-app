<template>
  <div class="details">
    <div class="details-2">
      <van-tabs
        v-model="activeName"
        class="tabs"
        swipeable
        title-active-color="#522555"
        title-inactive-color="#999"
      >
        <div class="left" @click="onClickLeft">
          <van-icon name="arrow-left" size="20px" />
        </div>
        <div class="right" @click="onClickRight">
          <van-icon name="wap-home-o" size="22px" />
        </div>
        <van-tab title="商品" name="a" title-class="tabs-title tabs-left">
          <!-- 商品详情图片 -->
          <div class="details-title-img">
            <div class="details-img">
              <img :src="details.psrc" />
            </div>
          </div>

          <!-- 商品名称及价格 -->
          <div class="details-title-price">
            <div class="section-wrap clearfix">
              <div class="details-price clearfix">
                <div class="details-price-top clearfix">
                  <span class="details-price-new">US${{ details.pprice }}</span>
                  <span class="details-price-old"
                    >US${{ (details.pprice / 0.24).toFixed(2) }}</span
                  >
                </div>
                <div class="details-price-bottom">
                  <span class="details-price-rmb"
                    >参考价: ¥{{
                      (
                        details.pprice / 0.24 +
                        (details.pprice / 0.24) * 0.6
                      ).toFixed(2)
                    }}</span
                  >
                </div>
              </div>
              <div class="details-title">
                {{ details.ptitle }}
              </div>
            </div>
          </div>

          <!-- 商品规格 -->
          <div class="details-guige">
            <dl class="product-guige clearfix">
              <dt class="attr-head">
                <label style="color: #333">规格：</label>
                <span class="attr-selected">{{ details.pguige }}</span>
              </dt>
              <dd class="attr-item cls-selected">{{ details.pguige }}</dd>
            </dl>
          </div>

          <!-- 数量 -->
          <div class="product-qty">
            <div class="selected-wrap">
              <div class="layout-indent">
                <span class="indent-word">数量</span>
                <div class="btn-right">
                  <van-button @click="minus" class="btn-minus">-</van-button>
                  <input type="text" :value="value" />
                  <van-button @click="add" class="btn-add">+</van-button>
                </div>
              </div>
            </div>
          </div>
        </van-tab>
        <van-tab title="评价" name="b" title-class="tabs-title">
          <!-- 商品评价 -->
          <my-review></my-review>
        </van-tab>
        <van-tab title="详情" name="c" title-class="tabs-title tabs-right">
          <!-- 商品详情 -->
          <details-c></details-c>
        </van-tab>
      </van-tabs>
      <van-goods-action class="cart-tabs">
        <van-goods-action-icon icon="chat-o" text="客服" color="#ee0a24" />
        <van-goods-action-icon icon="cart-o" text="购物车" />
        <van-goods-action-icon icon="star" text="已收藏" color="#ff5000" />
        <van-goods-action-button type="warning" text="加入购物车" />
        <van-goods-action-button type="danger" text="立即购买" />
      </van-goods-action>
    </div>
  </div>
</template>

<script>
import DetailsC from "../components/DetailsC.vue";
export default {
  components: { DetailsC },
  data() {
    return {
      value: "0",
      activeName: "a",
      details: [],
    };
  },
  methods: {
    onClickLeft() {
      this.$router.go(-1);
    },
    onClickRight() {
      this.$router.push("/");
    },

    // 商品的数量 开始
    add() {
      if (this.value < 3 && this.value >= 0) {
        this.value++;
      }
    },
    minus() {
      if (this.value > 0) {
        this.value--;
      }
    },
    // 商品的数量 结束
    getdetails() {
      let uid = this.$route.params.uid;
      // console.log(uid);
      this.axios
        .get("/details", {
          params: {
            uid: uid,
          },
        })
        .then((res) => {
          this.details = res.data.results;
          // console.log(this.details);
        });
    },
  },
  mounted() {
    this.getdetails();
  },
};
</script>

<style>
/* .details .van-tabs--line .van-tabs__wrap {
  position: fixed;
  width: 100%;
} */
/* .left,
.right {
  position: fixed;
} */
.left::before {
  content: "";
}
.details {
  width: 100%;
  /* padding: 0 auto; */
  height: 735px;
  background-color: #fff;
}
.details-2 {
  background-color: #f5f5f5;
}
/* /////////////////////////////////////////////// 标签栏 ///////////////////////////////////////////// */
.details .tabs {
  /* position: fixed; */
  z-index: 999;
}
.details .tabs-title {
  font-size: 16px;
}
.details .van-tabs__line {
  background-color: #943579;
}
.details .left {
  position: absolute;
  display: block;
  margin-left: 8px;
  top: 12px;
}
.details .right {
  position: absolute;
  display: block;
  top: 10px;
  margin-right: 8px;
  /* margin-bottom: 24px; */
  right: 0px;
}
.details .tabs-left {
  margin-left: 10px;
}
.details .tabs-right {
  margin-right: 10px;
}
/* /////////////////////////////////////////////// 商品图片 ///////////////////////////////////////////// */
.details .details-title-img {
  width: 100%;
  height: 296px;
  overflow: hidden;
  background: #fff;
  text-align: center;
}
.details .details-img {
  display: inline-block;
  border-bottom: 0.5px solid #ddd;
  margin: 0 8px;
}

.details .details-img img {
  display: block;
  height: 18.5rem;
  margin: 0 auto;
  border-style: none;
}
.details .details-title-price {
  width: 100%;
  height: 115px;
  background-color: #fff;
  font-size: 1rem;
}
/* /////////////////////////////////////////////// 商品名称及价格 ///////////////////////////////////////////// */
.details .details-title-price .section-wrap {
  padding-bottom: 0.55rem;
}
.section-wrap {
  margin: 0 15px;
}
.details .details-price {
  padding-top: 0.5rem;
}
.details .details-price-top {
  vertical-align: middle;
}
.details .details-price-top .details-price-new {
  color: #cc3314;
  font-weight: 700;
  font-size: 1.25rem;
  display: block;
  float: left;
}
.details .details-price-bottom .details-price-rmb {
  display: block;
  margin-top: 5px;
  color: #999;
  font-size: 0.77rem;
}
.details .details-price-top .details-price-old {
  text-decoration: line-through;
  font-size: 0.77rem;
  float: right;
  line-height: 1rem;
  color: #999;
}
.details .details-title {
  line-height: 1.4375rem;
  margin-top: 0.5rem;
  /* font-size: 1.25rem; */
  color: #333;
}
/* /////////////////////////////////////////////// 商品规格 ///////////////////////////////////////////// */
.details .details-guige {
  background-color: #fff;
  height: 100px;
  margin-top: 10px;
  font-size: 14px;
}
.details .product-guige {
  margin: 0 12px;
  padding: 14px 0;
}
.details .attr-head {
  margin-left: 4px;
  margin-bottom: 8px;
}
.details .attr-selected {
  color: #943579;
  margin-left: 2px;
}
.details .attr-item {
  color: #333;
  border: 1px solid #e0e0e0;
  position: relative;
  float: left;
  padding: 8px 24px;
  margin: 8px 0 0 8px;
}
.details .attr-item.cls-selected {
  color: #522555;
  border-color: #522555;
}
.details .attr-item.cls-selected::after {
  background: url(https://basedata.azoyacdn.com/uploads/basedata/images/7b2dea6da0c02886afbfa22efa191c22.png)
    no-repeat -1px -1px;
  background-size: 12rem auto;
  width: 20px;
  height: 20px;
  content: "";
  position: absolute;
  right: 0;
  bottom: 0;
  background-repeat: repeat !important;
}
/* /////////////////////////////////////////////// 商品数量 ///////////////////////////////////////////// */
.details .product-qty {
  line-height: 20px;
  height: 50px;
  margin-top: 8px;
  padding: 8px 0;
  background: #fff;
  font-size: 14px;
}
.details .selected-wrap {
  margin: 0 16px;
}
.details .layout-indent {
  position: relative;
  margin-left: 20px;
}
.details .product-qty .indent-word {
  color: #999;
  line-height: 30px;
}
.details .indent-word {
  position: absolute;
  left: -1.3rem;
  width: 30px;
}
.details .product-qty .btn-minus,
.details .product-qty .btn-add {
  position: relative;
  display: inline-block;
  width: 20px;
  height: 30px;
  font-size: 20px;
  border: 1px solid #ccc;
  background: #fff;
  vertical-align: top;
}
.details .product-qty input {
  display: inline-block;
  width: 60px;
  height: 30px;
  border: 1px solid #ccc;
  border-left: none;
  border-right: none;
  border-radius: 0;
  font-size: 14px;
  text-align: center;
  vertical-align: top;
}
.details .btn-right {
  width: 150px;
  position: relative;
  left: 30px;
}

.cart-tabs {
  width: 100%;
  position: fixed;
  z-index: 999;
}
</style>