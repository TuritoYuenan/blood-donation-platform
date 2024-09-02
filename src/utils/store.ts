import { reactive } from "vue";
import { DonationCenterSchema } from "../models/database";
import supabase from "./supabase";

export default reactive({
	isWorking: false,

	donationCenters: new Array<DonationCenterSchema>(),
	async loadDonationCenters() {
		this.isWorking = true

		const { data, error } = await supabase().functions
			.invoke<DonationCenterSchema[]>("donation-centers", { method: "GET" })

		if (error) {
			if (error instanceof Error) alert('Error' + error.message)
			return
		}

		this.donationCenters.splice(0, this.donationCenters.length, ...data!)
		this.isWorking = false
	}
})
