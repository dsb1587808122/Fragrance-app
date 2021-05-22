import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import axios from "axios"
import qs from "qs"
import moment from "moment"

// 引入 VantUI 组件库
import Vant from 'vant'
import 'vant/lib/index.css';

// 底部导航
import MyFooter from "./components/MyFooterbar.vue"

import Review from "./components/Review.vue"
import DetailsC from "./components/DetailsC.vue"

Vue.use(Vant);
// 底部导航
Vue.component('my-footer', MyFooter)
Vue.component('my-review', Review)
Vue.component('details-c', DetailsC)

axios.defaults.baseURL = "http://127.0.0.1:3000"

Vue.prototype.axios = axios;
Vue.prototype.moment = moment;
Vue.prototype.qs = qs;

Vue.config.productionTip = false

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
