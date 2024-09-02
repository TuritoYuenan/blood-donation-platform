<script setup lang="ts">
import { ref } from 'vue';
import { RouterLink } from 'vue-router';
import { centers } from '../utils/store';

const fullName = ref<string>('')
const emailAddr = ref<string>('')
const phoneNmbr = ref<string>('')
const citizenId = ref<string>('')
const location = ref<string>('')
const gender = ref<string>('')
const date = ref<string>('')
const weight = ref<number>(0)
const height = ref<number>(0)

async function appoint() {
	alert('Submitted')
}
</script>

<template>
	<header>
		<h1>Appoint for blood donation</h1>
	</header>

	<form @submit.prevent="appoint">
		<label for="full_name">Full name</label>
		<input id="full_name" type="text" v-model.trim="fullName" required>

		<label for="email">Email address</label>
		<input id="email" type="email" v-model.trim="emailAddr" required>

		<label for="phone">Phone number</label>
		<input id="phone" type="tel" v-model.trim="phoneNmbr">

		<label for="citizen">Citizen ID</label>
		<input id="citizen" type="text" v-model.trim="citizenId">

		<label for="location">
			<RouterLink to="/donation-centers" target="_blank" rel="noreferrer noopener">
				Donation Center
			</RouterLink>
		</label>
		<select id="location" v-model="location" required>
			<option disabled value="">Please select one</option>
			<option v-for="center in centers" :value="center.id">{{ center.name }}</option>
		</select>

		<label for="date">Appointment Date</label>
		<select id="date" v-model="date" required>
			<option disabled value="">Please select one</option>
		</select>

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
	grid-template-columns: auto 3fr;
	border: 2px solid black;
}

form label {
	margin-inline: 1rem;
	text-align: center;
}

input, select {
	border: 1px solid black;
}
</style>
