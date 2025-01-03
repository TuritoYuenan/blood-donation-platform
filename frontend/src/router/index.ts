import HomeView from '@/views/HomeView.vue'
import { createRouter, createWebHistory } from 'vue-router'

const router = createRouter({
	history: createWebHistory(import.meta.env.BASE_URL),
	routes: [
		// Home page
		{
			path: '/',
			component: HomeView,
		},

		// Info pages
		{
			path: '/about',
			component: () => import('../views/AboutView.vue'),
		},
		{
			path: '/contact-us',
			component: () => import('../views/ContactView.vue'),
		},

		// Personal pages
		{
			path: '/settings',
			component: () => import('../views/SettingsView.vue'),
		},
		{
			path: '/history',
			component: () => import('../views/HistoryView.vue'),
		},
		{
			path: '/profile',
			component: () => import('../views/ProfileView.vue'),
		},

		// Donation pages
		{
			path: '/donation/centers',
			component: () => import('../views/DCentersView.vue'),
		},
		{
			path: '/donation/campaigns',
			component: () => import('../views/DCampaignsView.vue'),
		},

		// Login & Signup
		{
			path: '/login',
			component: () => import('../views/LoginView.vue'),
		},
		{
			path: '/signup',
			component: () => import('../views/SignupView.vue'),
		},

		// Footer pages
		{
			path: '/terms',
			component: () => import('../views/TermsView.vue'),
		},
		{
			path: '/privacy',
			component: () => import('../views/PrivacyView.vue'),
		},
	],
})

export default router
