<script setup lang="ts">
import { RouterView } from 'vue-router'
import Header from "./components/Header.vue";
import Footer from "./components/Footer.vue"
</script>

<template>
	<section class="sticky-top p-3">
		<Header />
	</section>
	<main class="px-5 py-4">
		<RouterView />
	</main>
	<section class="p-3">
		<Footer />
	</section>
</template>
