export type Json =
	| string
	| number
	| boolean
	| null
	| { [key: string]: Json | undefined }
	| Json[]

export type Database = {
	graphql_public: {
		Tables: {
			[_ in never]: never
		}
		Views: {
			[_ in never]: never
		}
		Functions: {
			graphql: {
				Args: {
					operationName?: string
					query?: string
					variables?: Json
					extensions?: Json
				}
				Returns: Json
			}
		}
		Enums: {
			[_ in never]: never
		}
		CompositeTypes: {
			[_ in never]: never
		}
	}
	public: {
		Tables: {
			donation_centers: {
				Row: {
					address: string
					id: string
					is_hospital: boolean
					name: string
					picture: string | null
				}
				Insert: {
					address?: string
					id?: string
					is_hospital: boolean
					name: string
					picture?: string | null
				}
				Update: {
					address?: string
					id?: string
					is_hospital?: boolean
					name?: string
					picture?: string | null
				}
				Relationships: []
			}
			donation_queries: {
				Row: {
					center_id: string
					date: string
					donor_id: string
					id: string
					registered: string
				}
				Insert: {
					center_id: string
					date: string
					donor_id: string
					id: string
					registered?: string
				}
				Update: {
					center_id?: string
					date?: string
					donor_id?: string
					id?: string
					registered?: string
				}
				Relationships: [
					{
						foreignKeyName: "donation_queries_center_id_fkey"
						columns: ["center_id"]
						isOneToOne: false
						referencedRelation: "donation_centers"
						referencedColumns: ["id"]
					},
					{
						foreignKeyName: "donation_queries_donor_id_fkey"
						columns: ["donor_id"]
						isOneToOne: false
						referencedRelation: "donors"
						referencedColumns: ["id"]
					},
				]
			}
			donation_units: {
				Row: {
					amount: number
					blood_type: Database["public"]["Enums"]["blood_type"]
					query_id: string
				}
				Insert: {
					amount?: number
					blood_type: Database["public"]["Enums"]["blood_type"]
					query_id?: string
				}
				Update: {
					amount?: number
					blood_type?: Database["public"]["Enums"]["blood_type"]
					query_id?: string
				}
				Relationships: [
					{
						foreignKeyName: "donation_units_query_id_fkey"
						columns: ["query_id"]
						isOneToOne: true
						referencedRelation: "donation_queries"
						referencedColumns: ["id"]
					},
				]
			}
			donors: {
				Row: {
					blood_type: Database["public"]["Enums"]["blood_type"]
					citizen_id: string
					created: string
					email_address: string
					full_name: string
					gender: Database["public"]["Enums"]["gender"]
					height: number | null
					id: string
					phone_number: string | null
					weight: number | null
				}
				Insert: {
					blood_type: Database["public"]["Enums"]["blood_type"]
					citizen_id: string
					created?: string
					email_address: string
					full_name: string
					gender: Database["public"]["Enums"]["gender"]
					height?: number | null
					id?: string
					phone_number?: string | null
					weight?: number | null
				}
				Update: {
					blood_type?: Database["public"]["Enums"]["blood_type"]
					citizen_id?: string
					created?: string
					email_address?: string
					full_name?: string
					gender?: Database["public"]["Enums"]["gender"]
					height?: number | null
					id?: string
					phone_number?: string | null
					weight?: number | null
				}
				Relationships: []
			}
			working_hours: {
				Row: {
					center_id: string
					close_time: string
					day_of_week: number
					id: string
					open_time: string
				}
				Insert: {
					center_id: string
					close_time: string
					day_of_week?: number
					id?: string
					open_time: string
				}
				Update: {
					center_id?: string
					close_time?: string
					day_of_week?: number
					id?: string
					open_time?: string
				}
				Relationships: [
					{
						foreignKeyName: "working_hours_center_id_fkey"
						columns: ["center_id"]
						isOneToOne: false
						referencedRelation: "donation_centers"
						referencedColumns: ["id"]
					},
				]
			}
		}
		Views: {
			[_ in never]: never
		}
		Functions: {
			[_ in never]: never
		}
		Enums: {
			blood_type: "O+" | "O-" | "A+" | "A-" | "B+" | "B-" | "AB+" | "AB-"
			gender: "male" | "female" | "attack_helicopter" | "others"
		}
		CompositeTypes: {
			[_ in never]: never
		}
	}
}

type PublicSchema = Database[Extract<keyof Database, "public">]

export type Tables<
	PublicTableNameOrOptions extends
		| keyof (PublicSchema["Tables"] & PublicSchema["Views"])
		| { schema: keyof Database },
	TableName extends PublicTableNameOrOptions extends
		{ schema: keyof Database } ? keyof (
			& Database[PublicTableNameOrOptions["schema"]]["Tables"]
			& Database[PublicTableNameOrOptions["schema"]]["Views"]
		)
		: never = never,
> = PublicTableNameOrOptions extends { schema: keyof Database } ? (
		& Database[PublicTableNameOrOptions["schema"]]["Tables"]
		& Database[PublicTableNameOrOptions["schema"]]["Views"]
	)[TableName] extends {
		Row: infer R
	} ? R
	: never
	: PublicTableNameOrOptions extends keyof (
		& PublicSchema["Tables"]
		& PublicSchema["Views"]
	) ? (
			& PublicSchema["Tables"]
			& PublicSchema["Views"]
		)[PublicTableNameOrOptions] extends {
			Row: infer R
		} ? R
		: never
	: never

export type TablesInsert<
	PublicTableNameOrOptions extends
		| keyof PublicSchema["Tables"]
		| { schema: keyof Database },
	TableName extends PublicTableNameOrOptions extends
		{ schema: keyof Database }
		? keyof Database[PublicTableNameOrOptions["schema"]]["Tables"]
		: never = never,
> = PublicTableNameOrOptions extends { schema: keyof Database }
	? Database[PublicTableNameOrOptions["schema"]]["Tables"][TableName] extends
		{
			Insert: infer I
		} ? I
	: never
	: PublicTableNameOrOptions extends keyof PublicSchema["Tables"]
		? PublicSchema["Tables"][PublicTableNameOrOptions] extends {
			Insert: infer I
		} ? I
		: never
	: never

export type TablesUpdate<
	PublicTableNameOrOptions extends
		| keyof PublicSchema["Tables"]
		| { schema: keyof Database },
	TableName extends PublicTableNameOrOptions extends
		{ schema: keyof Database }
		? keyof Database[PublicTableNameOrOptions["schema"]]["Tables"]
		: never = never,
> = PublicTableNameOrOptions extends { schema: keyof Database }
	? Database[PublicTableNameOrOptions["schema"]]["Tables"][TableName] extends
		{
			Update: infer U
		} ? U
	: never
	: PublicTableNameOrOptions extends keyof PublicSchema["Tables"]
		? PublicSchema["Tables"][PublicTableNameOrOptions] extends {
			Update: infer U
		} ? U
		: never
	: never

export type Enums<
	PublicEnumNameOrOptions extends
		| keyof PublicSchema["Enums"]
		| { schema: keyof Database },
	EnumName extends PublicEnumNameOrOptions extends { schema: keyof Database }
		? keyof Database[PublicEnumNameOrOptions["schema"]]["Enums"]
		: never = never,
> = PublicEnumNameOrOptions extends { schema: keyof Database }
	? Database[PublicEnumNameOrOptions["schema"]]["Enums"][EnumName]
	: PublicEnumNameOrOptions extends keyof PublicSchema["Enums"]
		? PublicSchema["Enums"][PublicEnumNameOrOptions]
	: never
