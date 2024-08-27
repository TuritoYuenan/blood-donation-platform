<script setup lang="ts">
import { ref } from 'vue'
import supabase from '../utils/supabase'
import account from "../assets/account.svg"

const loading = ref(false)
const email = ref('')

async function handleLogin() {
	loading.value = true
	const { error } = await supabase().auth.signInWithOtp({
		email: email.value,
		options: {
			shouldCreateUser: false,
		}
	})
	try {
		if (error) throw error
		alert('Check your email for the login link!')
	} catch (error) {
		if (error instanceof Error) {
			alert(error.message)
		}
	} finally {
		loading.value = false
	}
}
</script>

<template>
	<form @submit.prevent="handleLogin">
		<header><img v-bind:src="account" alt="Profile picture"></header>

		<input required type="email" placeholder="email" v-model="email">

		<button type="submit" :value="loading ? 'Loading' : 'Send magic link'" :disabled="loading" />
	</form>
</template>

<style scoped>
section {
	padding-block: 2rem;
	display: flex;
	flex-direction: column;
	gap: 1rem;
}

section * {
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
