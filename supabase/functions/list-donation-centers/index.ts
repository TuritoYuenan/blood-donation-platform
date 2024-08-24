import supabase from '../_shared/supabase.ts';
import cors from '../_shared/cors.ts';

Deno.serve(async (req) => {
	try {
		const { data, error } = await supabase(req.headers.get('Authorization')!)
			.from('donation_centers')
			.select('*')

		if (error) throw error

		return new Response(
			JSON.stringify(data),
			{ status: 200, headers: { ...cors, 'Content-Type': 'application/json' } }
		)
	} catch (error) {
		return new Response(
			String(error?.message ?? error),
			{ status: 500 }
		)
	}
})
