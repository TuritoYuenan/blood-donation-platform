import { Database } from "./database"

// Export shorthand for tables because conditional types doesn't work in Vue

/** Schema for donation_centers table */
export type DonationCenterSchema =
	Database["public"]["Tables"]["donation_centers"]["Row"]

/** Schema for working_hours table */
export type WorkingHoursSchema =
	Database["public"]["Tables"]["working_hours"]["Row"]
