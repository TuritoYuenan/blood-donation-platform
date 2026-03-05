<script lang="ts">
import { DonationCampaign } from '../types';

const API_URL = import.meta.env.VITE_BACKEND_URL;

export default {
	data() {
		return {
			campaigns: [] as DonationCampaign[],
			campaignsPerPage: 10,
			currentPage: 1,
			showModal: false,
			isEditing: false,
			currentCampaign: {
				name: '',
				description: '',
				start_date: '',
				end_date: '',
				target_blood_type: '',
				target_amount: undefined,
				status: 'active'
			} as DonationCampaign,
			error: '',
			success: ''
		};
	},
	methods: {
		async fetchDonationCampaigns() {
			try {
				const response = await fetch(`${API_URL}/donation_campaigns/`);
				if (!response.ok) {
					throw new Error('Failed to fetch donation campaigns');
				}
				this.campaigns = await response.json();
			} catch (error) {
				console.error('Error fetching campaigns:', error);
				this.error = 'Failed to load donation campaigns';
			}
		},
		openCreateModal() {
			this.isEditing = false;
			this.currentCampaign = {
				name: '',
				description: '',
				start_date: '',
				end_date: '',
				target_blood_type: '',
				target_amount: undefined,
				status: 'active'
			};
			this.showModal = true;
			this.error = '';
			this.success = '';
		},
		openEditModal(campaign: DonationCampaign) {
			this.isEditing = true;
			this.currentCampaign = { ...campaign };
			this.showModal = true;
			this.error = '';
			this.success = '';
		},
		closeModal() {
			this.showModal = false;
			this.currentCampaign = {
				name: '',
				description: '',
				start_date: '',
				end_date: '',
				target_blood_type: '',
				target_amount: undefined,
				status: 'active'
			};
		},
		async saveCampaign() {
			try {
				const method = this.isEditing ? 'PUT' : 'POST';
				const url = this.isEditing
					? `${API_URL}/donation_campaigns/${this.currentCampaign.id}`
					: `${API_URL}/donation_campaigns/`;

				const response = await fetch(url, {
					method,
					headers: {
						'Content-Type': 'application/json',
					},
					body: JSON.stringify(this.currentCampaign),
				});

				if (!response.ok) {
					throw new Error(`Failed to ${this.isEditing ? 'update' : 'create'} campaign`);
				}

				this.success = `Campaign ${this.isEditing ? 'updated' : 'created'} successfully!`;
				this.closeModal();
				await this.fetchDonationCampaigns();

				setTimeout(() => {
					this.success = '';
				}, 3000);
			} catch (error) {
				console.error('Error saving campaign:', error);
				this.error = `Failed to ${this.isEditing ? 'update' : 'create'} campaign`;
			}
		},
		async deleteCampaign(campaign: DonationCampaign) {
			if (!confirm(`Are you sure you want to delete "${campaign.name}"?`)) {
				return;
			}

			try {
				const response = await fetch(`${API_URL}/donation_campaigns/${campaign.id}`, {
					method: 'DELETE',
				});

				if (!response.ok) {
					throw new Error('Failed to delete campaign');
				}

				this.success = 'Campaign deleted successfully!';
				await this.fetchDonationCampaigns();

				setTimeout(() => {
					this.success = '';
				}, 3000);
			} catch (error) {
				console.error('Error deleting campaign:', error);
				this.error = 'Failed to delete campaign';
			}
		},
		formatDate(dateString: string) {
			if (!dateString) return '';
			const date = new Date(dateString);
			return date.toLocaleDateString('en-US', { year: 'numeric', month: 'long', day: 'numeric' });
		},
		getCampaignStatus(campaign: DonationCampaign) {
			const today = new Date();
			const startDate = new Date(campaign.start_date);
			const endDate = new Date(campaign.end_date);

			if (campaign.status !== 'active') return campaign.status;
			if (today < startDate) return 'upcoming';
			if (today > endDate) return 'ended';
			return 'active';
		}
	},
	computed: {
		paginatedCampaigns() {
			const start = (this.currentPage - 1) * this.campaignsPerPage;
			const end = start + this.campaignsPerPage;
			return this.campaigns.slice(start, end);
		},
		totalPages() {
			return Math.ceil(this.campaigns.length / this.campaignsPerPage);
		},
	},
	mounted() {
		this.fetchDonationCampaigns();
	},
}
</script>

<template>
	<div class="container mt-4">
		<div class="d-flex justify-content-between align-items-center mb-4">
			<h1>Donation Campaigns</h1>
			<button class="btn btn-primary" @click="openCreateModal">
				<i class="bi bi-plus-circle"></i> Add New Campaign
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

		<!-- Campaigns Grid -->
		<div id="grid-views" v-if="campaigns.length > 0">
			<div class="card" v-for="campaign in paginatedCampaigns" :key="campaign.id">
				<div class="card-body">
					<div class="d-flex justify-content-between align-items-start mb-2">
						<h4 class="card-title">{{ campaign.name }}</h4>
						<span class="badge"
							:class="{
								'bg-success': getCampaignStatus(campaign) === 'active',
								'bg-info': getCampaignStatus(campaign) === 'upcoming',
								'bg-secondary': getCampaignStatus(campaign) === 'ended',
								'bg-warning': getCampaignStatus(campaign) === 'inactive'
							}">
							{{ getCampaignStatus(campaign) }}
						</span>
					</div>
					<p v-if="campaign.description" class="text-muted mb-3">{{ campaign.description }}</p>
					<div class="campaign-details">
						<p class="mb-2">
							<i class="bi bi-calendar-event"></i>
							<strong>Start:</strong> {{ formatDate(campaign.start_date) }}
						</p>
						<p class="mb-2">
							<i class="bi bi-calendar-check"></i>
							<strong>End:</strong> {{ formatDate(campaign.end_date) }}
						</p>
						<p v-if="campaign.target_blood_type" class="mb-2">
							<i class="bi bi-droplet"></i>
							<strong>Target Blood Type:</strong> {{ campaign.target_blood_type }}
						</p>
						<p v-if="campaign.target_amount" class="mb-2">
							<i class="bi bi-bullseye"></i>
							<strong>Target Amount:</strong> {{ campaign.target_amount }} units
						</p>
					</div>
				</div>
				<div class="card-footer d-flex justify-content-end">
					<button class="btn btn-outline-primary btn-sm me-2" @click="openEditModal(campaign)">
						<i class="bi bi-pencil"></i> Edit
					</button>
					<button class="btn btn-outline-danger btn-sm" @click="deleteCampaign(campaign)">
						<i class="bi bi-trash"></i> Delete
					</button>
				</div>
			</div>
		</div>

		<div v-else class="text-center py-5">
			<p class="text-muted">No donation campaigns found.</p>
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
						<h5 class="modal-title">{{ isEditing ? 'Edit Campaign' : 'Add New Campaign' }}</h5>
						<button type="button" class="btn-close" @click="closeModal"></button>
					</div>
					<div class="modal-body">
						<form @submit.prevent="saveCampaign">
							<div class="mb-3">
								<label for="name" class="form-label">Campaign Name *</label>
								<input type="text" class="form-control" id="name" v-model="currentCampaign.name" required>
							</div>
							<div class="mb-3">
								<label for="description" class="form-label">Description</label>
								<textarea class="form-control" id="description" rows="3" v-model="currentCampaign.description"></textarea>
							</div>
							<div class="row">
								<div class="col-md-6 mb-3">
									<label for="start_date" class="form-label">Start Date *</label>
									<input type="date" class="form-control" id="start_date" v-model="currentCampaign.start_date" required>
								</div>
								<div class="col-md-6 mb-3">
									<label for="end_date" class="form-label">End Date *</label>
									<input type="date" class="form-control" id="end_date" v-model="currentCampaign.end_date" required>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6 mb-3">
									<label for="blood_type" class="form-label">Target Blood Type</label>
									<select class="form-control" id="blood_type" v-model="currentCampaign.target_blood_type">
										<option value="">Any</option>
										<option value="A+">A+</option>
										<option value="A-">A-</option>
										<option value="B+">B+</option>
										<option value="B-">B-</option>
										<option value="AB+">AB+</option>
										<option value="AB-">AB-</option>
										<option value="O+">O+</option>
										<option value="O-">O-</option>
									</select>
								</div>
								<div class="col-md-6 mb-3">
									<label for="target_amount" class="form-label">Target Amount (units)</label>
									<input type="number" class="form-control" id="target_amount"
										v-model.number="currentCampaign.target_amount" min="0" step="1">
								</div>
							</div>
							<div class="mb-3">
								<label for="status" class="form-label">Status *</label>
								<select class="form-control" id="status" v-model="currentCampaign.status" required>
									<option value="active">Active</option>
									<option value="inactive">Inactive</option>
								</select>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" @click="closeModal">Cancel</button>
						<button type="button" class="btn btn-primary" @click="saveCampaign">
							{{ isEditing ? 'Update' : 'Create' }} Campaign
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

.campaign-details p {
	font-size: 0.95rem;
}
</style>
