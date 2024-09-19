<script setup lang="ts">
import { onMounted } from "vue";
import { RouterLink, useRouter } from "vue-router";
import store from "../utils/store";

onMounted(() => {
	if (!store.isLoggedIn) {
		useRouter().push({ path: "/staff/login" })
	}
})
</script>

<template>
	<header>
		<h1>Dashboard</h1>
	</header>
	<section>
		<h2>Under Conception</h2>
		<p>
			<RouterLink to="/staff/login">Login</RouterLink>
		</p>
	</section>
</template>

<style scoped>
section {
	max-width: 800px;
	margin: auto;
}
</style>
