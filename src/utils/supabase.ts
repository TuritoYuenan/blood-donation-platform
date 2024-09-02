import { createClient } from "@supabase/supabase-js"
import { Database } from "../models/database"

const client = createClient<Database>(
	import.meta.env.VITE_SUPABASE_URL as string,
	import.meta.env.VITE_SUPABASE_KEY as string
)

export default () => client
