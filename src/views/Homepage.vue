<script setup lang="ts">
import Icon from "../components/MaterialIcon.vue";
</script>

<template>
	<header>
		<h1>Blood Management System</h1>
	</header>
	<section>
		<RouterLink to="/donor/appoint">
			<p>For Blood Donor</p>
			<Icon id="volunteer_activism" />
			<p>Appoint for Blood Donation</p>
		</RouterLink>
		<RouterLink to="/staff/dashboard">
			<p>For Medical Staff</p>
			<Icon id="medical_information" />
			<p>View Management Dashboard</p>
		</RouterLink>
	</section>
</template>

<style scoped>
section {
	max-width: 800px;
	margin: auto;
	padding: 1rem;
	display: grid;
	gap: 1rem;
	grid-template-columns: repeat(2, 1fr);
}

section a {
	padding: 1rem;
	display: block;
	color: inherit;
	font-size: large;
	text-align: center;
	text-decoration: none;
	border: 2px solid black;
	border-radius: 1rem;
}

section a span {
	font-size: 8em;
}
</style>
