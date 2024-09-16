<script setup lang="ts">
import { onMounted, ref } from "vue";
import { RouterLink, useRouter } from "vue-router";
import store from "../utils/store";

const fullName = ref<string>("")
const emailAddr = ref<string>("")
const phoneNmbr = ref<string>("")
const citizenId = ref<string>("")
const location = ref<string>("")
const gender = ref<string>("")
const date = ref<string>("")
const weight = ref<number>(0)
const height = ref<number>(0)

async function appoint() {
	console.log("Submitted")
	useRouter().push({ path: "/donor/result" })
}

onMounted(async () => {
	if (store.donationCenters.length === 0) store.loadDonationCenters()
	if (store.workingHours.size === 0) store.loadWorkingHours()
})
</script>

<template>
	<header>
		<h1>Appoint for blood donation</h1>
	</header>

	<form @submit.prevent="appoint">
		<label for="location">
			<RouterLink to="/donation-centers" target="_blank" rel="noreferrer noopener">
				Donation Center
			</RouterLink>
		</label>
		<select id="location" v-model="location" required>
			<option disabled value="">Please select a donation center to appoint</option>
			<option v-for="center in store.donationCenters" :value="center.center_id">{{ center.name }}</option>
		</select>

		<label for="date">Date to Appoint</label>
		<select id="date" v-model="date" required>
			<option disabled value="">Please select a day to appoint</option>
			<option v-for="date in store.workingHours.get(location)" :value="date.hours_id">
				{{ date.open_time }} - {{ date.close_time }}
			</option>
		</select>

		<label for="full_name">Full name</label>
		<input id="full_name" type="text" v-model.trim="fullName" required>

		<label for="email">Email address</label>
		<input id="email" type="email" v-model.trim="emailAddr" required>

		<label for="phone">Phone number</label>
		<input id="phone" type="tel" v-model.trim="phoneNmbr">

		<label for="citizen">Citizen ID</label>
		<input id="citizen" type="text" v-model.trim="citizenId">

		<label for="gender">Gender</label>
		<select id="gender" v-model="gender">
			<option disabled value="">Please select one</option>
			<option value="male">Male</option>
			<option value="female">Female</option>
			<option value="other">Other</option>
		</select>

		<label for="height">Height</label>
		<input id="height" type="number" v-model="height">

		<label for="weight">Weight</label>
		<input id="weight" type="number" v-model="weight">

		<div></div>
		<div><button type="submit">Send</button></div>
	</form>
</template>

<style scoped>
form {
	max-width: 800px;
	margin: auto;
	padding: 2rem;
	display: grid;
	gap: 0.5rem 1rem;
	grid-template-columns: 25% 75%;
	border-radius: 1rem;
	box-shadow: 0 0 4px black;
}

@media (width <= 600px) {
	form {
		grid-template-columns: 100%;
	}
}

@media (width <= 800px) {
	form {
		border-radius: 0;
	}
}

:is(input, select) {
	border: 1px solid black;
}
</style>
