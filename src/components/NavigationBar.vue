<script setup lang="ts">
import Icon from "./MaterialIcon.vue";
</script>

<template>
	<nav>
		<RouterLink to="/">
			<span id="logo" class="material-symbols-rounded">logo</span>
		</RouterLink>
		<div class="menu" v-if="$route.path.startsWith('/donor')">
			<RouterLink to="/donor/result"><Icon id="description" /> View form</RouterLink>
			<RouterLink to="/donor/amend"><Icon id="edit_note" /> Edit info</RouterLink>
		</div>
		<div class="menu" v-else-if="$route.path.startsWith('/staff')">
			<RouterLink to=""></RouterLink>
		</div>
	</nav>
</template>

<style scoped>
nav {
	padding-inline: 1rem;
	display: flex;
	justify-content: space-between;
	background-color: crimson;
}

nav a {
	color: white;
	text-decoration: none;
}

.menu {
	display: flex;
	align-items: center;
	justify-content: center;
}

.menu a {
	padding: 1rem;
}

#logo {
	padding: 1rem;
	font-size: 2em;
}
</style>
