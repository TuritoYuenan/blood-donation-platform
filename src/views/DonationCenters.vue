<script setup lang="ts">
import { onMounted, ref } from 'vue'
import { QueryData } from '@supabase/supabase-js';
import supabase from '../utils/supabase'
import DonationCenter from '../components/DonationCenter.vue'

const query = supabase().from('donation_centers').select('*').limit(10);
const centers = ref<QueryData<typeof query>>()

onMounted(async () => {
	const { data } = await query
	centers.value = data!
})
</script>

<template>
	<header>
		<h1>Nearby Donation Centers</h1>
	</header>
	<article>
		<DonationCenter v-for="{ name, address, id, is_hospital, open_time, picture } in centers" v-bind:name
			v-bind:address v-bind:id v-bind:is_hospital v-bind:open_time v-bind:picture />
	</article>
</template>

<style scoped>
article>* {
	margin-top: 1rem;
}
</style>
