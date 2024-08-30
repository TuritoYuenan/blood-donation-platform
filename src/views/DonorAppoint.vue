<script setup lang="ts">
import { RouterLink } from 'vue-router';

async function appoint() {
	return 0
}
</script>

<template>
	<header>
		<h1>Appoint for blood donation</h1>
	</header>

	<form @submit.prevent="appoint">
		<label for="full_name">Full name</label>
		<input type="text" name="full_name" id="full_name" required>
		<label for="email">Email address</label>
		<input type="email" name="email_addr" id="email" required>
		<label for="phone">Phone number</label>
		<input type="tel" name="phone_nmbr" id="phone">
		<label for="citizen">Citizen ID</label>
		<input type="text" name="citizen_id" id="citizen">
		<label for="location">
			<RouterLink to="/donor/centers" target="_blank" rel="noreferrer noopener">
				Donation Center
			</RouterLink>
		</label>
		<select name="gender" id="location">
		</select>
		<label for="gender">Gender</label>
		<select name="gender" id="gender">
			<option value="male">Male</option>
			<option value="female">Female</option>
			<option value="other">Other</option>
		</select>
		<label for="date">Appointment Date</label>
		<input type="date" name="date" id="date">
		<label for="height">Height</label>
		<input type="number" name="height" id="height">
		<label for="weight">Weight</label>
		<input type="number" name="weight" id="weight">
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
</style>
