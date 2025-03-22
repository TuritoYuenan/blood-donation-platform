<script setup lang="ts">
import { ref } from 'vue';

const centers = ref([
	{
		CenterID: 'C001',
		CenterName: 'Downtown Donation Center',
		Status: 1,
		PhoneNumber: '123-456-7890',
		Email: 'contact@downtowncenter.com',
		OperatingHours: ['08:00-16:00', '09:00-17:00'],
		Description: 'Main donation center in downtown.'
	},
	{
		CenterID: 'C002',
		CenterName: 'Uptown Donation Center',
		Status: 1,
		PhoneNumber: '987-654-3210',
		Email: 'contact@uptowncenter.com',
		OperatingHours: ['10:00-18:00', '11:00-19:00'],
		Description: 'Main donation center in uptown.'
	}
]);
</script>

<template>
	<div class="row row-cols-md-2">
		<div class="card" v-for="center in centers" :key="center.CenterID">
			<div class="card-header">
				<h4 class="card-title">{{ center.CenterName }}</h4>
			</div>
			<div class="card-body">
				<p>{{ center.Description }}</p>
				<p>{{ center.PhoneNumber }}</p>
				<p>{{ center.Email }}</p>
				<p v-for="hour in center.OperatingHours">{{ hour }}</p>
			</div>
		</div>
	</div>
</template>
