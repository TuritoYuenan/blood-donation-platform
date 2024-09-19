<script setup lang="ts">
import { onMounted, ref } from "vue"
import supabase from "../utils/supabase"
import account from "../assets/account.svg"
import { useRouter } from "vue-router";
import store from "../utils/store";

const router = useRouter()
const loading = ref<boolean>(false)
const email = ref<string>("")

async function handleLoginMock() {
	store.isLoggedIn = true
	router.push("/staff/home")
}

async function handleLogin() {
	loading.value = true

	const { error } = await supabase().auth.signInWithOtp({
		email: email.value,
		options: { shouldCreateUser: false }
	})

	try {
		if (error) throw error
		alert("Check your email for the login link!")
	} catch (error) {
		if (error instanceof Error) alert(error.message)
	} finally {
		loading.value = false
	}
}

onMounted(() => {
	if (store.isLoggedIn) {
		router.push("/staff/home")
	}
})
</script>

<template>
	<form @submit.prevent="handleLoginMock">
		<header><img v-bind:src="account" alt="Profile picture"></header>

		<input type="email" placeholder="email" v-model="email" required>

		<button type="submit" :value="loading ? 'Loading' : 'Send magic link'" :disabled="loading">
			Send magic link
		</button>
	</form>
</template>

<style scoped>
form {
	max-width: 600px;
	margin: auto;
	padding-block: 2rem;
	display: flex;
	flex-direction: column;
	gap: 1rem;
}

form * {
	margin: auto;
	display: block;
}

header img {
	width: 8rem;
	height: auto;
	border: 2px solid black;
	border-radius: 50%;
}

input {
	width: 100%;
	height: 3em;
}
</style>
