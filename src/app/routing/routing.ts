import { createWebHistory, createRouter } from "vue-router";

import MainPage from "../../pages/MainPage/MainPage.vue";
import InfoPage from "../../pages/InfoPage/InfoPage.vue";

const routes = [
    { path: "/", component: MainPage },
    { path: "/info", component: InfoPage },
];

export const router = createRouter({
    history: createWebHistory(),
    routes,
});
