<script setup lang="ts">
import NavigationBar from './components/NavigationBar.vue';
const github = 'https://github.com/TuritoYuenan/blood-management-system'
</script>

<template>
	<NavigationBar />
	<main>
		<RouterView />
	</main>
	<footer>
		<p>
			&COPY; 2024 HttP Team.
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
