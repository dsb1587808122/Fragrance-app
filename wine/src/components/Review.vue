<template>
  <div class="review">
    <van-pull-refresh v-model="refreshing" @refresh="onRefresh">
      <van-list
        v-model="loading"
        :finished="finished"
        finished-text="没有更多了"
        @load="onLoad"
      >
        <van-cell style="font-size: 16px">商品评价(14)</van-cell>
        <van-cell v-for="(v, index) of 8" :key="index">
          <div class="user-reviews">
            <p class="user">
              <img src="../assets/lax.jpg" alt="" class="user-avatar" />
              <span class="user-name">拉克丝</span>
            </p>
            <div class="comment-item-con">
              <p class="comment-text">超级无敌好闻</p>
            </div>
            <p class="comment-item-time">2020-12-28 10:59:55</p>
          </div>
        </van-cell>
      </van-list>
    </van-pull-refresh>
  </div>
</template>

<script>
export default {
  data() {
    return {
      list: [],
      loading: false,
      finished: false,
      refreshing: false,
    };
  },
  methods: {
    onLoad() {
      setTimeout(() => {
        if (this.refreshing) {
          this.list = [];
          this.refreshing = false;
        }

        for (let i = 0; i < 10; i++) {
          this.list.push(this.list.length + 1);
        }
        this.loading = false;

        if (this.list.length >= 40) {
          this.finished = true;
        }
      }, 1000);
    },
    onRefresh() {
      // 清空列表数据
      this.finished = false;

      // 重新加载数据
      // 将 loading 设置为 true，表示处于加载状态
      this.loading = true;
      this.onLoad();
    },
  },
};
</script>

<style>
/* .left,
.right {
  position: fixed;
} */
/* .details .details-c .van-tabs--line .van-tabs__wrap {
  position: relative;
} */

.review {
  margin-bottom: 50px;
}
.review .user {
  margin: 0 0 8px;
}
.review .user-avatar {
  display: inline-block;
  vertical-align: middle;
  width: 35px;
  height: 35px;
  background-size: contain;
  border-radius: 50%;
}
.review .user-name {
  display: inline-block;
  vertical-align: middle;
  margin-left: 12px;
}
.review .comment-text {
  margin-bottom: 0.3rem;
}
.review .van-cell::after {
  border-bottom: 1px solid #878787;
}
</style>