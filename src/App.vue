<script setup lang="ts">
import NavigationBar from "./components/NavigationBar.vue";
import Loading from "./components/Loading.vue";
import store from "./utils/store";

const github = "https://github.com/TuritoYuenan/blood-management-system"
</script>

<template>
	<NavigationBar />
	<main>
		<RouterView v-if="!store.isWorking" :key="$route.fullPath" />
		<Loading v-if="store.isWorking" />
	</main>
	<footer>
		<p>
			<span>&COPY; 2024 HttP Team</span> &bull;
			<a :href="github" target="_blank" rel="noreferrer noopener">GitHub Repository</a>
		</p>
	</footer>
</template>

<style scoped>
footer {
	padding: 1rem;
	text-align: center;
}
</style>
