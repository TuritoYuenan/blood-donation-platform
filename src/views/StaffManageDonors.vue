<script setup lang="ts">
import { onMounted } from 'vue';
import store from '../utils/store';

// onMounted(async () => {
// 	if (store.donors.length === 0) store.loadDonors()
// })
</script>

<template>
	<div class="staff-manage-donors">
		<div class="header">
			<div class="navigation">
				<ul>
					<li>Form</li>
					<li>Health</li>
					<li>Blood</li>
				</ul>
			</div>
			<div class="date-filter">
				<!-- //<input type="date" v-model="selectedDate" /> -->
				<!-- <button @click="searchDonors">Search</button> -->
			</div>
		</div>

		<div class="donor-table">
			<table>
				<thead>
					<tr>
						<th>Name</th>
						<th>Date</th>
						<th>CCCD</th>
					</tr>
				</thead>
				<!-- <tbody>
					<tr v-for="donor in store.donors" :key="donor.donor_id">
						<td>{{ donor.full_name }}</td>
						<td>{{ donor.created }}</td>
						<td>{{ donor.citizen_id }}</td>
						<td><button @click="transferToNextStage(donor.id)">→</button></td>
					</tr>
				</tbody> -->
			</table>
		</div>
	</div>
</template>


<style scoped>
.staff-manage-donors {
	width: 100%;
	padding: 20px;
	font-family: Arial, sans-serif;
}

.header {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.logo {
	width: 100px;
}

.navigation ul {
	list-style-type: none;
	display: flex;
	gap: 10px;
}

.navigation ul li {
	cursor: pointer;
	padding: 5px 10px;
	background-color: #f0f0f0;
	border-radius: 5px;
}

.date-filter {
	display: flex;
	align-items: center;
	gap: 10px;
}

.donor-table {
	margin-top: 20px;
}

table {
	width: 100%;
	border-collapse: collapse;
}

th,
td {
	border: 1px solid #ddd;
	padding: 8px;
}

th {
	background-color: #f4f4f4;
}

button {
	background-color: #007BFF;
	color: white;
	border: none;
	padding: 5px 10px;
	cursor: pointer;
	border-radius: 3px;
}
</style>