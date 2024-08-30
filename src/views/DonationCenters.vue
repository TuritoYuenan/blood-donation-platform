<script setup lang="ts">
import { onMounted, ref } from 'vue'
import { DonationCenterSchema } from '../models/database'
import supabase from '../utils/supabase'
import DonationCenter from '../components/DonationCenter.vue'

const centers = ref<DonationCenterSchema[]>()

onMounted(async () => {
	const { data } = await supabase().functions.invoke<DonationCenterSchema[]>(
		'donation-centers', { method: 'GET' }
	)
	centers.value = data!
})
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
