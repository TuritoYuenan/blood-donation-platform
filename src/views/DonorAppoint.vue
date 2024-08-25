<script setup lang="ts">
import { onMounted, ref } from 'vue'
import { DonationCenterSchema } from '../models/database'
import supabase from '../utils/supabase'
import { useRoute } from 'vue-router'

const id = useRoute().query.id
const center = ref<DonationCenterSchema>()

onMounted(async () => {
	const { data } = await supabase().functions.invoke<DonationCenterSchema>(
		'donation-center', { method: 'GET', body: { id: id } }
	)
	center.value = data!
})
</script>

<template>
	<header>
		<h1>Appoint for blood donation</h1>
		<p>Center: {{ center?.name }}</p>
	</header>

	<form action="" method="post">
		<input type="text" name="center_id" id="center_id" v-bind:value="id" hidden>
		<p>
			<label for="full_name">Full name</label>
			<input type="text" name="full_name" id="full_name">
		</p>
	</form>
</template>

<style scoped></style>
