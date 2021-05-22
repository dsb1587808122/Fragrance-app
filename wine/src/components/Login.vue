<template>
  <div class="login">
    <van-nav-bar
      title="用户登录"
      right-text="注册"
      left-arrow
      @click-left="onClickLeft"
      @click-right="onClickRight"
      class="navbarcolor"
    />
    <van-form submit-on-enter>
      <van-field
        clearable
        left-icon="user-circle-o"
        v-model="username"
        label="用户名"
        placeholder="请输入您的账号"
      />
      <van-field
        clearable
        left-icon="closed-eye"
        v-model="password"
        type="password"
        label="密码"
        placeholder="请输入您的密码"
      />
      <div>
        <van-button
          round
          block
          type="info"
          native-type="submit"
          color="#522555"
          style="font-size: 17px"
          @click="handle"
          >立 即 登 录</van-button
        >
      </div>
    </van-form>
  </div>
</template>

<script>
import Vue from "vue";
import { Toast, Dialog } from "vant";
// import { mapActions } from "vuex";
Vue.use(Toast);
Vue.use(Dialog);
export default {
  data() {
    return {
      username: "",
      password: "",
      avatar: "",
    };
  },
  methods: {
    onClickLeft() {
      // 返回的是me
      this.$router.push("/me");
    },
    onClickRight() {
      this.$router.push("/register");
    },

    // 登录按钮
    handle() {
      let obj = {
        username: this.username,
        password: this.password,
        avatar: this.avatar,
      };
      let str = this.qs.stringify(obj);
      this.axios.post("/login", str).then((res) => {
        //登录失败
        if (!res.data.code) {
          Dialog.confirm({
            title: "登陆失败",
            message: "原因：用户名不存在/用户名 或 密码 错误，是否注册新用户？",
          })
            .then(() => {
              this.$router.push("/register");
            })
            .catch(() => {});
        }
        // 登录成功 -- 后续还需要继续调整
        if (res.data.code == 1) {
          // 提交Mutations,以改变用户的登录状态及信息
          this.$store.commit(
            "loginMutation",
            res.data.userInfo,
            res.data.userInfo.avatar
          );
          // 将用户登录状态的相关信息存储到WebStorage中
          localStorage.setItem("isLogined", 1);
          //因为在webStorage中,键值只能为字符串,所以
          //需要通过JSON.stringify()将服务器返回对象数据转换为字符串类型,然后再通过setItem()方法添加到WebStorage中
          localStorage.setItem(
            "userInfo",
            JSON.stringify(res.data.userInfo),
            JSON.stringify(res.data.userInfo.avatar)
          );
          // 跳转到我的页面
          this.$router.push("/me");
        }
      });
    },
  },
};
</script>

<style>
.login .van-nav-bar__text {
  color: #522555 !important;
  font-size: 15px !important;
}
.login .van-nav-bar__title {
  color: #522555 !important;
  font-weight: 700;
  font-size: 20px !important;
}
.login .van-icon-arrow-left::before {
  color: #522555 !important;
  font-weight: 700;
}
</style>