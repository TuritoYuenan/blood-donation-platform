import { createApp } from 'vue'
import { createRouter, createWebHistory, RouteRecordRaw } from 'vue-router'

import './style.css'
import App from './App.vue'

/** Pages for Blood donors */
const donorRoutes: RouteRecordRaw = {
	path: 'donor',
	children: [
		{ path: 'centers', component: () => import('./views/DonationCenters.vue') },
		{ path: 'appoint', component: () => import('./views/DonorAppoint.vue') },
		{ path: 'appointment', component: () => import('./views/DonorAppointment.vue') },
	]
}

/** Pages for Medical staffs */
const staffRoutes: RouteRecordRaw = {
	path: 'staff',
	children: [
		{ path: 'login', component: () => import('./views/StaffLogin.vue') },
		{ path: 'dashboard', component: () => import('./views/StaffDashboard.vue') },
	]
}

/** Router for web app */
const router = createRouter({
	history: createWebHistory(),
	routes: [{
		path: import.meta.env.BASE_URL,
		children: [donorRoutes, staffRoutes],
		component: () => import('./views/Homepage.vue'),
	}],
})

createApp(App).use(router).mount('#app')
