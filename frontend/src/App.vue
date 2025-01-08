<script setup lang="ts">
import { RouterView } from 'vue-router'
import NavigationBar from "./components/NavigationBar.vue";
import Footer from "./components/Footer.vue"
</script>

<template>
	<NavigationBar />
	<main class="px-5 py-4">
		<RouterView />
	</main>
	<Footer />
</template>
