<script setup lang="ts">
import { DonationCenterSchema } from '../models/database'

defineProps<{ center: DonationCenterSchema }>()
</script>

<template>
	<section>
		<img :src="center.picture ?? 'https://placehold.co/600x400'" alt="image of location">
		<div>
			<h2>{{ center.name }}</h2>
			<small>
				{{ center.is_hospital ? 'Hospital' : 'Donation Location' }}
				&bull; {{ Math.random() > 0.5 ? 'Open' : 'Closed' }}
			</small>
			<p>{{ center.address }}</p>
		</div>
	</section>
</template>

<style scoped>
section {
	border: 2px solid black;
	border-radius: 1rem;
	color: inherit;
	text-decoration: none;
	transition: 1s cubic-bezier(0.075, 0.82, 0.165, 1);
}

section:hover {
	scale: 1.05;
}

img {
	width: 100%;
	height: auto;
	aspect-ratio: 1.5;
	border-radius: 1rem 1rem 0 0;
}

div {
	padding: 0 1rem 1rem;
}
</style>
