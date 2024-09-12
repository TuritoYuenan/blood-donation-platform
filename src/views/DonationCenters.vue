<script setup lang="ts">
import { onMounted } from "vue";
import DonationCenter from "../components/DonationCenter.vue"
import store from "../utils/store";

onMounted(async () => {
	if (store.donationCenters.length === 0) store.loadDonationCenters()
})
</script>

<template>
	<header>
		<h1>Nearby Donation Centers</h1>
	</header>
	<article>
		<DonationCenter v-for="center in store.donationCenters" :key="center.center_id" :center />
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
