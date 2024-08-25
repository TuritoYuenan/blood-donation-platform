import { createClient } from 'jsr:@supabase/supabase-js'
import { Database } from './database.ts'

export default (authKey: string) => (createClient<Database>(
	Deno.env.get('SUPABASE_URL')!,
	Deno.env.get('SUPABASE_ANON_KEY')!,
	{ global: { headers: { Authorization: authKey } } },
))
