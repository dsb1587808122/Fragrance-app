<template>
  <div class="register">
    <van-nav-bar
      title="用户注册"
      left-text="登录"
      right-text="取消"
      left-arrow
      @click-left="onClickLeft"
      @click-right="onClickRight"
      class="navbarcolor"
    />
    <van-form submit-on-enter>
      <van-field
        clearable
        required
        v-model="username"
        :error-message="usernamemsg"
        name="usernamevail"
        label="用户名"
        placeholder="6~16位字母、数字或下划线（首位必须为字母）"
        @input="usernamevail"
      />

      <van-field
        clearable
        required
        v-model="password"
        :error-message="passwordmsg"
        type="password"
        name="密码"
        label="密码"
        placeholder="6~18位字母、数字或下划线组成"
        @input="passwordvail"
      />

      <van-field
        clearable
        required
        v-model="conpassword"
        :error-message="conpasswordmsg"
        type="password"
        name="重复密码"
        label="重复密码"
        placeholder="请再次输入密码"
        @input="conpasswordvail"
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
          >立 即 注 册</van-button
        >
      </div>
    </van-form>
  </div>
</template>

<script>
import Vue from "vue";
import { Toast } from "vant";
// import { mapActions } from "vuex";
Vue.use(Toast);
export default {
  data() {
    return {
      username: "",
      password: "",
      conpassword: "",
      usernamemsg: "",
      passwordmsg: "",
      conpasswordmsg: "",
    };
  },
  methods: {
    onClickLeft() {
      this.$router.push("/login");
    },
    onClickRight() {
      // 需要进行路由跳转到 me页面
      this.$router.push("/me");
    },
    // 账号
    usernamevail() {
      let reg = /^[a-zA-z]\w{5,16}$/;

      if (reg.test(this.username)) {
        this.usernamemsg = "";
        return true;
      } else if (this.username == "") {
        this.usernamemsg = "";
        return true;
      } else {
        this.usernamemsg = "用户名格式有误";
        return false;
      }
    },
    // 密码
    passwordvail() {
      let reg = /^\w{6,18}$/;

      if (reg.test(this.password)) {
        this.passwordmsg = "";
        return true;
      } else if (this.password == "") {
        this.passwordmsg = "";
        return true;
      } else {
        this.passwordmsg = "密码格式有误";
        return false;
      }
    },
    // 重复密码
    conpasswordvail() {
      if (this.password == this.conpassword) {
        this.conpasswordmsg = "";
        return true;
      } else {
        this.conpasswordmsg = "两次密码不一致";
        return false;
      }
    },
    // 点击注册按钮
    handle() {
      if (
        this.usernamevail() &&
        this.passwordvail() &&
        this.conpasswordvail()
      ) {
        this.axios
          .post(
            "/register",
            "username=" + this.username + "&password=" + this.password
          )
          .then((res) => {
            if (res.data.code == 1) {
              Toast("注册成功");
              this.$router.push("/me");
            } else {
              Toast("用户名已经存在");
            }
          });
      } else {
        Toast("用户名或密码或重复密码错误");
      }
    },
  },
};
</script>

<style>
.register .van-nav-bar__text {
  color: #522555 !important;
  font-size: 15px !important;
}
.register .van-nav-bar__title {
  color: #522555 !important;
  font-weight: 700;
  font-size: 20px !important;
}
.register .van-icon-arrow-left::before {
  color: #522555 !important;
  font-weight: 700;
}
</style>