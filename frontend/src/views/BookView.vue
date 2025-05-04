<script lang="ts">
import { DonationCenter } from '../types'

export default {
	props: { centerId: String, },
	data() {
		return {
			donationCenter: {} as DonationCenter,
			appointmentForm: {
				name: '',
				email: '',
				phone: '',
				date: '',
				time: '',
			},
		};
	},
	methods: {
		async fetchDonationCenter() {
			const response = await fetch(`http://localhost:5230/donation/center/${this.centerId}`);
			if (response.ok) {
				this.donationCenter = await response.json();
			} else {
				console.error('Failed to fetch donation center:', response.statusText);
			}
		},
		async submitForm() {
			const payload = {
				...this.appointmentForm,
				centerId: this.donationCenter.centerid,
			};

			console.log('Submitting form with payload:', payload);

			const response = await fetch(`http://localhost:5230/book`, {
				method: 'POST',
				headers: { 'Content-Type': 'application/json', },
				body: JSON.stringify(payload),
			});

			if (response.ok) {
				console.log('Appointment booked successfully:', await response.text());
			} else {
				console.error('Failed to book appointment:', response.statusText);
			}
		},
	},
	mounted() {
		this.fetchDonationCenter();
	},
}
</script>

<template>
	<section class="container p-3">
		<h1>Donate blood at {{ donationCenter.centername }}</h1>
	</section>

	<form class="container p-3 vstack gap-3" @submit.prevent="submitForm">
		<div class="form-floating">
			<input class="form-control" placeholder="" required v-model="appointmentForm.name" type="text" id="name" />
			<label for="name">Name</label>
		</div>
		<div class="form-floating">
			<input class="form-control" placeholder="" required v-model="appointmentForm.email" type="email"
				id="email" />
			<label for="email">Email</label>
		</div>
		<div class="form-floating">
			<input class="form-control" placeholder="" required v-model="appointmentForm.phone" type="tel" id="phone" />
			<label for="phone">Phone Number</label>
		</div>
		<div class="form-floating">
			<input class="form-control" placeholder="" required v-model="appointmentForm.date" type="date" id="date" />
			<label for="date">Date</label>
		</div>
		<div class="form-floating">
			<input class="form-control" placeholder="" required v-model="appointmentForm.time" type="time" id="time" />
			<label for="time">Time</label>
		</div>
		<button type="submit" class="btn btn-primary">Book Appointment</button>
	</form>
</template>
