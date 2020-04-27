import Vue from "vue";
import VueRouter from "vue-router";
import Home from "../views/Home.vue";
import About from "../views/About.vue";
import Contact from "../views/Contact.vue";
import Login from "../views/Login.vue";
import Booking from "../views/Booking.vue";
import Gallary from "../views/Gallary.vue";
import Cart from "../views/Cart.vue";
import RoomDetail from "../views/RoomDetail.vue";
import PageNotFound from "@/views/PageNotFound.vue";





Vue.use(VueRouter);

const routes = [
  {
    path: "/",
    name: "Home",
    component: Home,
  },
  {
    path: "/contact",
    name: "Contact",
    component: Contact,
  },
  {
    path: "/about",
    name: "About",
    component: About,
  },
  {
    path: "/signin",
    name: "Login",
    component: Login,
  },
  {
    path : "/booking",
    name: "Booking",
    component: Booking,
  },
  {
    path:"/allrooms",
    name:"Gallary",
    component:Gallary,
  },
  {
    path:"/cart",
    name:"Cart",
    component:Cart,
  },
  {
    path:"/roomdetail/:id",
    name:"RoomDetail",
    component:RoomDetail,
  },
  {
    path: "*",
    name: "404 - Page not found",
    component: PageNotFound
  }
];

const router = new VueRouter({
  mode: "history",
  base: process.env.BASE_URL,
  routes,
});

export default router;
