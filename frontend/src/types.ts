export type DonationCenter = {
	id?: number;
	name: string;
	address: string;
	status: string;
	phone_number?: string;
	email?: string;
	operating_hours?: string;
	description?: string;
}

export type DonationCampaign = {
	id?: number;
	name: string;
	description?: string;
	start_date: string;
	end_date: string;
	target_blood_type?: string;
	target_amount?: number;
	status?: string;
}
