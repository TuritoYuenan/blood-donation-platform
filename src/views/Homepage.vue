<script setup lang="ts">
import Icon from "../components/MaterialIcon.vue";
</script>

<template>
	<header>
		<h1>Blood Management System</h1>
	</header>
	<article>
		<RouterLink to="/donor/appoint">
			<p>For Blood Donor</p>
			<Icon id="volunteer_activism" />
			<p>Appoint for Blood Donation</p>
		</RouterLink>
		<RouterLink to="/staff/home">
			<p>For Medical Staff</p>
			<Icon id="medical_information" />
			<p>Access Management Tools</p>
		</RouterLink>
	</article>
</template>

<style scoped>
article {
	max-width: 800px;
	margin: auto;
	padding: 1rem;
	display: grid;
	gap: 1rem;
	grid-template-columns: 1fr 1fr;
}

article a {
	padding: 1rem;
	display: block;
	color: inherit;
	font-size: large;
	text-align: center;
	text-decoration: none;
	border-radius: 1rem;
	box-shadow: 0 0 4px black;
	transition: 1s cubic-bezier(0.075, 0.82, 0.165, 1);
}

article a:hover {
	scale: 1.05;
}

article a span {
	font-size: 8em;
}

@media (width <= 600px) {
	article {
		display: flex;
		flex-direction: column;
	}
}
</style>
