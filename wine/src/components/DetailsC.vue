<template>
  <div class="details-c">
    <van-tabs
      v-model="activeName"
      title-active-color="#522555"
      title-inactive-color="#999"
    >
      <van-tab title="产品描述" name="a" style="background-color: #fff">
        <div class="product-introduction">
          <img :src="details.details_pic1" alt="" />
          <img :src="details.details_pic2" alt="" />
          <img :src="details.details_pic3" alt="" />
          <img :src="details.details_pic4" alt="" />
          <img :src="details.details_pic5" alt="" />
          <img :src="details.details_pic6" alt="" />
        </div>
      </van-tab>
      <van-tab title="规格参数" name="b" style="background-color: #fff">
        <div class="product-specification">
          <table>
            <tr>
              <td>中文名称</td>
              <td>{{ details.ptitle }}</td>
            </tr>
            <tr>
              <td>英文名称</td>
              <td>{{ details.ename }}</td>
            </tr>
            <tr>
              <td>SKU</td>
              <td>{{ details.sku }}</td>
            </tr>
            <tr>
              <td>规格</td>
              <td>{{ details.pguige }}</td>
            </tr>
          </table>
        </div>
      </van-tab>
      <van-tab title="常见问题" name="c" style="background-color: #fff">
        <div class="product-qna" style="margin-bottom: 65px">
          <h3>FragranceNet 简介</h3>
          <p>
            FragranceNet
            1997年在美国成立，以线上销售香水香氛而著名，自成立以来一直受用户的信赖和好评，目前全球用户已超过600万，在线销售商品高达18000，包括热销的香水、美妆护肤及各类护理产品等。
          </p>

          <h3>在线的产品是否都有货？</h3>
          <p>
            正常情况下所有在线的产品都是有货的，但不排除促销活动或其他原因导致临时缺货的情况。如果您下单后出现缺货，我们会通过邮箱与您联系，告知您发货商品情况。
          </p>
          <h3>购买的商品是否需要缴税</h3>
          <p>目前本站所有商品都无需您支付额外税费。</p>
          <h3>优惠券和优惠码可以同时使用吗？</h3>
          <p>
            优惠券和优惠码不能同时使用，且每个订单只能使用1个优惠券/优惠码。
          </p>

          <h3>FragranceNet中文站下单有金额和数量限制吗？</h3>
          <p>
            应中国海关清关要求，FragranceNet 对订单作如下要求：<br />
            a)
            单笔订单中购买多个商品，商品总金额最高不超过$220；如购买单个商品则不受其影响；<br />
            b) 单笔订单中购买的单个商品（SKU）数量不超过3件；<br />
            c)单笔订单商品重量不超过3kg；<br />
            d)
            因海关清关原因，FragranceNet建议同一个收件人同一天的订单数量不超过1单，否则将产生较为明显的时效延迟。如有需要请更换不同的收件人下单购买。<br />
            * 同一姓名/身份证/电话/地址视为同一收件人。<br />
          </p>

          <h3>为什么要实名认证并上传身份证照片？</h3>
          <p>
            根据海关规定，直邮商品需要办理清关手续，需要您的身份证信息进行实名认证。
          </p>

          <h3>可以用人民币支付吗？</h3>
          <p>
            我们与支付宝，微信和银联在线支付平台合作，您下单选择以上的任意支付方式都可使用人民币支付订单，人民币支付的汇率以该支付机构实时汇率为准。
          </p>

          <h3>下单后是否可以取消订单</h3>
          <p>
            未付款订单会在2小时内自动取消。
            如订单已付款，则无法修改，请确认商品无误后再提交订单。
          </p>

          <h3>如何查询我的订单状态？</h3>
          <p>
            下单成功后，您可以登录到“我的订单”中查看订单状态，发货后订单状态会显示为已发货，可在订单详情中查看物流单号和物流信息。
          </p>

          <h3>下单成功后需要修改个人地址信息怎么办？</h3>
          <p>
            订单支付成功后，仓库即进入备货发货阶段，无法更改订单信息。如果您需要更改配送信息，请将需求通过邮箱发送给客服，我们会联系仓库尽力为您处理，如包裹已发出则无法更改地址信息，敬请谅解。
          </p>

          <h3>下单后，多久发货？</h3>
          <p>
            付款成功后，如无特殊情况包裹将在3-7个工作日内为您打包发出，如遇订单中商品缺货、公共假期或活动期间订单量大的情况，发货时间可能会有延迟，敬请谅解。
          </p>
          <h3>发货后，多久能收到包裹？</h3>
          <p>
            发货后预计10-15个工作日左右配送到您的地址。物流公司的特殊情况和海关的清关速度可能会导致您逾期收货，但我们会尽力保证您的包裹安全快速送达。
          </p>
        </div>
      </van-tab>
    </van-tabs>
  </div>
</template>

<script>
export default {
  data() {
    return {
      activeName: "a",
      // 产品描述
      details: [],
      // 规格参数
    };
  },
  mounted() {
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
};
</script>

<style>
/* 产品描述 */
.product-introduction {
  font-size: 12px;
  line-height: 16px;
  padding: 15px 15px 20px;
}
.product-introduction img {
  width: 100%;
}
/* 规格参数 */
.product-specification {
  padding: 15px;
}
.product-specification table {
  width: 100%;
  border-top: 1px solid #e0e0e0;
  border-left: 1px solid #e0e0e0;
}
.product-specification td:first-child {
  min-width: 75px;
}
.product-specification td {
  text-align: center;
  padding: 8px 0;
  border-right: 1px solid #e0e0e0;
  border-bottom: 1px solid #e0e0e0;
  font-size: 13px;
  color: #999;
}
.product-qna {
  line-height: 1.6;
  padding: 18px 18px 8px;
  font-size: 12px;
}
.product-qna p {
  text-indent: 18px;
  line-height: 1.6;
  font-size: 12px;
}
</style>