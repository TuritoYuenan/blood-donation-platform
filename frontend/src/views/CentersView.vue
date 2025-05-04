<script lang="ts">
import { RouterLink } from 'vue-router';
import { DonationCenter } from '../types';

export default {
	data() {
		return {
			centers: [] as DonationCenter[],
			centersPerPage: 10,
			currentPage: 1,
		};
	},
	methods: {
		async fetchDonationCenters() {
			try {
				const response = await fetch('http://localhost:5230/donation/centers');
				if (!response.ok) {
					throw new Error('Network response was not ok');
				}
				this.centers = await response.json();
			} catch (error) {
				console.error('Error fetching centers:', error);
			}
		},
	},
	computed: {
		paginatedCenters() {
			const start = (this.currentPage - 1) * this.centersPerPage;
			const end = start + this.centersPerPage;
			return this.centers.slice(start, end);
		},
		totalPages() {
			return Math.ceil(this.centers.length / this.centersPerPage);
		},
	},
	mounted() {
		this.fetchDonationCenters();
	},
}
</script>

<template>
	<div id="grid-views">
		<div class="card" v-for="center in paginatedCenters" :key="center.centerid">
			<div class="card-body">
				<h4 class="card-title">{{ center.centername }}</h4>
				<p>
					<span>{{ center.email }}</span> &bull;
					<span>{{ center.phonenumber }}</span> &bull;
					<span>{{ center.operatinghours }}</span>
				</p>
				<p>{{ center.description }}</p>
			</div>
			<div class="card-footer">
				<RouterLink :to="`/book?centerid=${center.centerid}`" class="btn btn-danger">
					Book an appointment
				</RouterLink>
			</div>
		</div>
	</div>
</template>

<style scoped>
#grid-views {
	display: grid;
	gap: 1rem;
	grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
}
</style>
