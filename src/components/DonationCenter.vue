<script setup lang="ts">
import { DonationCenterSchema } from '../models/database';

const center: DonationCenterSchema = defineProps<DonationCenterSchema>();
</script>

<template>
	<section>
		<img :src="center.picture ?? ''" alt="image of location">
		<h2>{{ center.name }}</h2>
		<p>{{ center.address }}</p>
		<p>{{ center.is_hospital ? 'Hospital' : 'Donation Location' }}</p>
	</section>
</template>

<style scoped>
section {
	padding: 1rem;
	border: 1px solid black;
	border-radius: 1rem;
}
</style>
