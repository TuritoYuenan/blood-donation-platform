<script setup lang="ts">
import DonationCenter from '../models/DonationCenter';

const center = defineProps<DonationCenter>();
</script>

<template>
	<section>
		<img :src="center.image" alt="image of location">
		<h2>{{ center.name }}</h2>
		<p>2 km</p>
	</section>
</template>

<style scoped>
section {
	padding: 1rem;
	border: 1px solid black;
	border-radius: 1rem;
}
</style>
