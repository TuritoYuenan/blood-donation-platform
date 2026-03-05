<script lang="ts">
import { RouterLink } from 'vue-router';
import { DonationCenter } from '../types';

const API_URL = import.meta.env.VITE_BACKEND_URL;

export default {
	data() {
		return {
			centers: [] as DonationCenter[],
			centersPerPage: 10,
			currentPage: 1,
			showModal: false,
			isEditing: false,
			currentCenter: {
				name: '',
				address: '',
				status: 'active',
				phone_number: '',
				email: '',
				operating_hours: '',
				description: ''
			} as DonationCenter,
			error: '',
			success: ''
		};
	},
	methods: {
		async fetchDonationCenters() {
			try {
				const response = await fetch(`${API_URL}/donation_centres/`);
				if (!response.ok) {
					throw new Error('Failed to fetch donation centers');
				}
				this.centers = await response.json();
			} catch (error) {
				console.error('Error fetching centers:', error);
				this.error = 'Failed to load donation centers';
			}
		},
		openCreateModal() {
			this.isEditing = false;
			this.currentCenter = {
				name: '',
				address: '',
				status: 'active',
				phone_number: '',
				email: '',
				operating_hours: '',
				description: ''
			};
			this.showModal = true;
			this.error = '';
			this.success = '';
		},
		openEditModal(center: DonationCenter) {
			this.isEditing = true;
			this.currentCenter = { ...center };
			this.showModal = true;
			this.error = '';
			this.success = '';
		},
		closeModal() {
			this.showModal = false;
			this.currentCenter = {
				name: '',
				address: '',
				status: 'active',
				phone_number: '',
				email: '',
				operating_hours: '',
				description: ''
			};
		},
		async saveCenter() {
			try {
				const url = this.isEditing
					? `${API_URL}/donation_centres/${this.currentCenter.id}`
					: `${API_URL}/donation_centres/`;
				const method = this.isEditing ? 'PUT' : 'POST';

				const response = await fetch(url, {
					method,
					headers: {
						'Content-Type': 'application/json',
					},
					body: JSON.stringify(this.currentCenter),
				});

				if (!response.ok) {
					throw new Error(`Failed to ${this.isEditing ? 'update' : 'create'} center`);
				}

				this.success = `Center ${this.isEditing ? 'updated' : 'created'} successfully!`;
				this.closeModal();
				await this.fetchDonationCenters();

				setTimeout(() => {
					this.success = '';
				}, 3000);
			} catch (error) {
				console.error('Error saving center:', error);
				this.error = `Failed to ${this.isEditing ? 'update' : 'create'} center`;
			}
		},
		async deleteCenter(center: DonationCenter) {
			if (!confirm(`Are you sure you want to delete "${center.name}"?`)) {
				return;
			}

			try {
				const response = await fetch(`${API_URL}/donation_centres/${center.id}`, {
					method: 'DELETE',
				});

				if (!response.ok) {
					throw new Error('Failed to delete center');
				}

				this.success = 'Center deleted successfully!';
				await this.fetchDonationCenters();

				setTimeout(() => {
					this.success = '';
				}, 3000);
			} catch (error) {
				console.error('Error deleting center:', error);
				this.error = 'Failed to delete center';
			}
		}
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
	<div class="container mt-4">
		<div class="d-flex justify-content-between align-items-center mb-4">
			<h1>Donation Centers</h1>
			<button class="btn btn-primary" @click="openCreateModal">
				<i class="bi bi-plus-circle"></i> Add New Center
			</button>
		</div>

		<!-- Success/Error Messages -->
		<div v-if="success" class="alert alert-success alert-dismissible fade show" role="alert">
			{{ success }}
			<button type="button" class="btn-close" @click="success = ''" aria-label="Close"></button>
		</div>
		<div v-if="error" class="alert alert-danger alert-dismissible fade show" role="alert">
			{{ error }}
			<button type="button" class="btn-close" @click="error = ''" aria-label="Close"></button>
		</div>

		<!-- Centers Grid -->
		<div id="grid-views" v-if="centers.length > 0">
			<div class="card" v-for="center in paginatedCenters" :key="center.id">
				<div class="card-body">
					<div class="d-flex justify-content-between align-items-start mb-2">
						<h4 class="card-title">{{ center.name }}</h4>
						<span class="badge" :class="center.status === 'active' ? 'bg-success' : 'bg-secondary'">
							{{ center.status }}
						</span>
					</div>
					<p class="text-muted mb-2">
						<i class="bi bi-geo-alt"></i> {{ center.address }}
					</p>
					<p class="mb-2">
						<span v-if="center.email">
							<i class="bi bi-envelope"></i> {{ center.email }}
						</span>
						<span v-if="center.phone_number" class="ms-3">
							<i class="bi bi-telephone"></i> {{ center.phone_number }}
						</span>
					</p>
					<p v-if="center.operating_hours" class="mb-2">
						<i class="bi bi-clock"></i> {{ center.operating_hours }}
					</p>
					<p v-if="center.description" class="text-muted">{{ center.description }}</p>
				</div>
				<div class="card-footer d-flex justify-content-between">
					<RouterLink :to="`/book?centerid=${center.id}`" class="btn btn-danger btn-sm">
						<i class="bi bi-calendar-plus"></i> Book Appointment
					</RouterLink>
					<div>
						<button class="btn btn-outline-primary btn-sm me-2" @click="openEditModal(center)">
							<i class="bi bi-pencil"></i> Edit
						</button>
						<button class="btn btn-outline-danger btn-sm" @click="deleteCenter(center)">
							<i class="bi bi-trash"></i> Delete
						</button>
					</div>
				</div>
			</div>
		</div>

		<div v-else class="text-center py-5">
			<p class="text-muted">No donation centers found.</p>
		</div>

		<!-- Pagination -->
		<nav v-if="totalPages > 1" class="mt-4">
			<ul class="pagination justify-content-center">
				<li class="page-item" :class="{ disabled: currentPage === 1 }">
					<a class="page-link" @click="currentPage = Math.max(1, currentPage - 1)" href="#">Previous</a>
				</li>
				<li class="page-item" v-for="page in totalPages" :key="page" :class="{ active: currentPage === page }">
					<a class="page-link" @click="currentPage = page" href="#">{{ page }}</a>
				</li>
				<li class="page-item" :class="{ disabled: currentPage === totalPages }">
					<a class="page-link" @click="currentPage = Math.min(totalPages, currentPage + 1)" href="#">Next</a>
				</li>
			</ul>
		</nav>

		<!-- Modal -->
		<div v-if="showModal" class="modal d-block" tabindex="-1" style="background-color: rgba(0,0,0,0.5);">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">{{ isEditing ? 'Edit Center' : 'Add New Center' }}</h5>
						<button type="button" class="btn-close" @click="closeModal"></button>
					</div>
					<div class="modal-body">
						<form @submit.prevent="saveCenter">
							<div class="mb-3">
								<label for="name" class="form-label">Name *</label>
								<input type="text" class="form-control" id="name" v-model="currentCenter.name" required>
							</div>
							<div class="mb-3">
								<label for="address" class="form-label">Address *</label>
								<input type="text" class="form-control" id="address" v-model="currentCenter.address" required>
							</div>
							<div class="row">
								<div class="col-md-6 mb-3">
									<label for="email" class="form-label">Email</label>
									<input type="email" class="form-control" id="email" v-model="currentCenter.email">
								</div>
								<div class="col-md-6 mb-3">
									<label for="phone" class="form-label">Phone Number</label>
									<input type="text" class="form-control" id="phone" v-model="currentCenter.phone_number">
								</div>
							</div>
							<div class="row">
								<div class="col-md-6 mb-3">
									<label for="status" class="form-label">Status *</label>
									<select class="form-control" id="status" v-model="currentCenter.status" required>
										<option value="active">Active</option>
										<option value="inactive">Inactive</option>
									</select>
								</div>
								<div class="col-md-6 mb-3">
									<label for="hours" class="form-label">Operating Hours</label>
									<input type="text" class="form-control" id="hours" v-model="currentCenter.operating_hours"
										placeholder="e.g., Mon-Fri 9AM-5PM">
								</div>
							</div>
							<div class="mb-3">
								<label for="description" class="form-label">Description</label>
								<textarea class="form-control" id="description" rows="3" v-model="currentCenter.description"></textarea>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" @click="closeModal">Cancel</button>
						<button type="button" class="btn btn-primary" @click="saveCenter">
							{{ isEditing ? 'Update' : 'Create' }} Center
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</template>

<style scoped>
#grid-views {
	display: grid;
	gap: 1rem;
	grid-template-columns: repeat(auto-fill, minmax(350px, 1fr));
}

.modal {
	display: block;
}

.pagination a {
	cursor: pointer;
}
</style>
