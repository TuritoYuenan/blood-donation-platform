<script setup lang="ts">
import { RouterView } from 'vue-router'
import Header from "./components/Header.vue";
import Footer from "./components/Footer.vue"
</script>

<template>
	<section class="p-3 sticky-top">
		<Header />
	</section>
	<main class="p-3">
		<RouterView />
	</main>
	<section class="p-3">
		<Footer />
	</section>
</template>
