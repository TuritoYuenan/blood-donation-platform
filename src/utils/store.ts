import { reactive } from "vue";
import { DonationCenterSchema } from "../models/database";
import supabase from "./supabase";

const centers = reactive<DonationCenterSchema[]>([])

if (centers.length == 0) {
	const { data } = await supabase().functions
		.invoke<DonationCenterSchema[]>("donation-centers", { method: "GET" })
	data?.forEach((center) => centers.push(center))
}

export { centers }
