import Vue from 'vue'
import VueRouter from 'vue-router'
import Index from '../views/Index.vue'

// List
import List from "../views/List.vue"
// me
import Me from "../views/Me.vue"
// details
import Details from "../views/details.vue"
// ProductCard
import ProductCard from "../views/ProductCard.vue"
// ShoppingCard
import ShoppingCart from "../views/ShoppingCart.vue"

// Login
import Login from "../components/Login.vue"
// Register
import Register from "../components/Register.vue"
// Review
import Review from "../components/Review.vue"


Vue.use(VueRouter)

const routes = [
  {
    path: "/shoppingcart",
    component: ShoppingCart,
    name: "ShoppingCart",
    meta: {
      title: "购物车",

    }
  },
  {
    path: "/productcard/:fid",
    component: ProductCard,
    name: "ProductCard",
    meta: { title: "商品列表", }
  },
  {
    path: "/review",
    component: Review,
    name: "Review",
    meta: { titile: "评论" }
  },
  {
    path: "/details/:uid",
    component: Details,
    name: "Details",
    meta: { title: "商品详情" }
  },
  {
    path: "/me",
    component: Me,
    name: "Me",
    meta: { title: "我的个人中心" }
  },
  {
    path: "/register",
    component: Register,
    name: "Register",
    meta: { title: "用户注册" }
  },
  {
    path: "/login",
    component: Login,
    name: "Login",
    meta: { title: "用户登录" }
  },
  {
    path: "/list",
    component: List,
    name: "List",
    meta: { title: "全部商品的分类列表" }
  },
  {
    path: '/',
    name: 'index',
    component: Index,
    meta: { title: "Fragrance中文网" }
  },
  // {
  //   path: '/about',
  //   name: 'About',
  //   // route level code-splitting
  //   // this generates a separate chunk (about.[hash].js) for this route
  //   // which is lazy-loaded when the route is visited.
  //   component: () => import(/* webpackChunkName: "about" */ '../views/About.vue')
  // }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})
// 一个spa应用中，如何修改网页当中的标签，可以使用全局守卫导航 
router.beforeEach((to, from, next) => {
  // 从from跳到to
  document.title = to.meta.title
  console.log(to);
  // if()
  if (to.meta.islogin) {
    if (localStorage.getItem('uname') || sessionStorage.getItem('uname')) {
      next();
    } else {
      if (to.path == 'me') {
        next()
      } else {
        next({ path: '/me' })
      }
    }

  } else {
    next();
  }


})
export default router
