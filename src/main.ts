import { createApp } from 'vue'
import { createMemoryHistory, createRouter, RouteRecordRaw } from 'vue-router'

import './style.css'
import App from './App.vue'
import HomeView from './views/HomeView.vue'
import LoginView from './views/LoginView.vue'
import DashboardView from './views/DashboardView.vue'
import LocationsView from './views/LocationsView.vue'

const routes: RouteRecordRaw[] = [
	{ path: '/', component: HomeView },
	{ path: '/login', component: LoginView },
	{ path: '/locations', component: LocationsView },
	{ path: '/dashboard', component: DashboardView }
]

const router = createRouter({
	history: createMemoryHistory(),
	routes: routes,
})

createApp(App).use(router).mount('#app')
