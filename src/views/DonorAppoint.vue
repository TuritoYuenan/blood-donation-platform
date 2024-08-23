<script setup lang="ts">
import { onMounted } from 'vue'
import { useRoute } from 'vue-router'
import supabase from '../utils/supabase'

async function getDonationCenter(id: string) {
	const { data } = await supabase().from('donation_centers').select('*').eq('id', id).limit(1).single()
	return data
}

const id = useRoute().params.id as string
const center = getDonationCenter(id)

onMounted(async () => await center)
</script>

<template>
	<header>
		<h1>Appoint for blood donation</h1>
	</header>

	<form action="" method="post">
		<p>
			<input type="text" name="center_id" id="center_id" v-bind:value="id" hidden>
		</p>
	</form>
</template>

<style scoped></style>
