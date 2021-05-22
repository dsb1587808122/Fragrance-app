<template>
  <div id="app">
    <router-view />
  </div>
</template>

<style>
#app {
  background: #f5f5f5;
}
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}
.clearfix::before {
  content: " ";
  clear: both;
  display: table;
  height: 0;
  visibility: hidden;
}
.clearfix::after {
  content: " ";
  clear: both;
  display: table;
  height: 0;
  visibility: hidden;
}
.clearfix {
  zoom: 1;
}
ul,
h1,
h2,
h3,
h4,
h5,
h6,
a,
span,
p {
  margin: 0;
  padding: 0;
}
ul {
  list-style: none;
}
a {
  text-decoration: none;
  color: #000;
}
</style>
