import { reactive } from "vue";
import { DonationCenterSchema, WorkingHoursSchema } from "../models/sugar";
import supabase from "./supabase";

export default reactive({
	/** Global state indicating whether there is a working task */
	isWorking: false,

	/** List of donation centers */
	donationCenters: [] as DonationCenterSchema[],

	/** Fetch list of donation centers from database */
	async loadDonationCenters() {
		this.isWorking = true

		const { data, error } = await supabase()
			.from("donation_centers")
			.select("*")

		if (error) {
			if (error instanceof Error) alert('Error' + error.message)
			return
		}

		this.donationCenters.splice(0, this.donationCenters.length, ...data!)
		this.isWorking = false
	}
})
