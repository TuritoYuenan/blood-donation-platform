import { createApp } from "vue"
import { createRouter, createWebHashHistory } from "vue-router"

import "./style.css"
import App from "./App.vue"

/** Router for web app */
const router = createRouter({
	history: createWebHashHistory(import.meta.env.BASE_URL),
	routes: [
		// Homepage
		{ path: "/", component: () => import("./views/Homepage.vue") },

		// Pages for Blood donors
		{ path: "/donation-centers", component: () => import("./views/DonationCenters.vue") },
		{ path: "/donor/appoint", component: () => import("./views/DonorAppoint.vue") },
		{ path: "/donor/result", component: () => import("./views/DonorAppointResult.vue") },
		{ path: "/donor/amend", component: () => import("./views/DonorAppointEdit.vue") },
		{ path: "/donor/info", component: () => import("./views/DonorAppointment.vue") },

		// Pages for Medical staffs
		{ path: "/staff/login", component: () => import("./views/StaffLogin.vue") },
		{ path: "/staff/home", component: () => import("./views/StaffHome.vue") },
		{ path: "/staff/managedonors", component: () => import("./views/StaffManageDonors.vue") }
	],
})

createApp(App).use(router).mount("#app")
