<script setup lang="ts">
import { centers } from '../utils/store'
import DonationCenter from '../components/DonationCenter.vue'
</script>

<template>
	<header>
		<h1>Nearby Donation Centers</h1>
	</header>
	<article>
		<DonationCenter v-for="center in centers" :center />
	</article>
</template>

<style scoped>
article {
	max-width: 800px;
	margin: auto;
	display: grid;
	gap: 1rem;
	grid-template-columns: repeat(2, 1fr);
}
</style>
