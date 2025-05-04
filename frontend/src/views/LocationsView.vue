<script lang="ts">
export default {
	methods: {
		isActive(path: string) {
			return this.$route.path === path;
		},
	}
};
</script>

<template>
	<section class="container p-3">
		<h1>Blood donation near you</h1>
		<p>Find and join a place to donate blood using the list below. It's easy and makes a big difference!</p>
	</section>

	<nav class="container p-3 nav nav-pills nav-fill">
		<RouterLink class="nav-link" :class="{ active: isActive('/locations/centers') }" to="/locations/centers"
			replace>Centers</RouterLink>
		<RouterLink class="nav-link" :class="{ active: isActive('/locations/campaigns') }" to="/locations/campaigns"
			replace>Campaigns</RouterLink>
	</nav>

	<section class="container p-3">
		<RouterView />
	</section>
</template>
