<script setup lang="ts">
import account from "../assets/account.svg";
</script>

<template>
	<section>
		<header><img v-bind:src="account" alt="Profile picture"></header>

		<input type="text" name="username" id="username" placeholder="username">
		<input type="password" name="password" id="password" placeholder="password">

		<p>
			<RouterLink to="/">Forget password?</RouterLink>
		</p>

		<button @click="$router.push('/dashboard')">Sign in</button>
	</section>
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
