<script setup lang="ts">
	const navItems = [
		{ name: 'Locations', link: '/locations/centers' },
		{ name: 'Link', link: '/' },
		{ name: 'Sign in', link: '/signin' }
	];
</script>

<template>
	<header class="navbar navbar-expand-md p-3 bg-danger text-bg-danger rounded-3">
		<RouterLink to="/" class="navbar-brand">Containerised BDP</RouterLink>

		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#collapsibleNavbar">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="collapsibleNavbar">
			<nav class="navbar-nav ms-auto mb-2 mb-md-0">
				<RouterLink v-for="item in navItems" :key="item.name" :to="item.link" class="nav-item nav-link">
					{{ item.name }}
				</RouterLink>
			</nav>
		</div>
	</header>
</template>
