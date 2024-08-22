import { createApp } from 'vue'
import { createRouter, createWebHistory } from 'vue-router'

import './style.css'
import App from './App.vue'

const router = createRouter({
	history: createWebHistory(),
	routes: [
		// Homepage
		{ path: '/', component: () => import('./views/Homepage.vue') },

		// Pages for Blood donors
		{ path: '/donor/centers', component: () => import('./views/DonationCenters.vue') },
		{ path: '/donor/appoint', component: () => import('./views/DonorAppoint.vue') },
		{ path: '/donor/appointment', component: () => import('./views/DonorAppointment.vue') },

		// Pages for Medical staffs
		{ path: '/staff/login', component: () => import('./views/StaffLogin.vue') },
		{ path: '/staff/dashboard', component: () => import('./views/StaffDashboard.vue') },
	],
})

createApp(App).use(router).mount('#app')
