import { createApp } from "vue";
import "./style.css";
import App from "./App.vue";
import { router } from "./routing/routing.ts";

createApp(App).use(router).mount("#app");
