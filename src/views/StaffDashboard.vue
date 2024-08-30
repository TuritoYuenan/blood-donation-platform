<script setup lang="ts">
import { RouterLink } from 'vue-router';
</script>

<template>
	<header>
		<h1>Dashboard</h1>
	</header>
	<section>
		<h2>Under Conception</h2>
		<p><RouterLink to="/staff/login">Login</RouterLink></p>
	</section>
</template>

<style scoped>
section {
	max-width: 800px;
	margin: auto;
}
</style>
