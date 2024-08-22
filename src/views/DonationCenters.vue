<script setup lang="ts">
import { onMounted, ref } from 'vue';
import Supabase from '../utils/supabase';
import DonationCenter from '../components/DonationCenter.vue'

const centers = ref();

onMounted(async () => {
	const { data } = await Supabase().from('donation_centers').select('*').limit(10);
	centers.value = data!;
})
</script>

<template>
	<header>
		<h1>Nearby Donation Centers</h1>
	</header>
	<article>
		<DonationCenter v-for="{ name, address, id, is_hospital, open_time, picture } in centers" v-bind:name="name"
			v-bind:address="address" v-bind:id="id" v-bind:is_hospital="is_hospital" v-bind:open_time="open_time"
			v-bind:picture="picture" />
	</article>
</template>

<style scoped>
article>* {
	margin-top: 1rem;
}
</style>
