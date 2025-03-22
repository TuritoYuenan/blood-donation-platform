<script setup lang="ts"></script>

<template>
	<section class="container p-3">
		<h1>Blood donation near you</h1>
		<p>Find and join a place to donate blood using the list below. It's easy and makes a big difference!</p>
	</section>

	<nav class="container p-3 nav nav-pills nav-fill">
		<RouterLink to="/locations/centers" class="nav-link active" aria-current="page">Centers</RouterLink>
		<RouterLink to="/locations/campaigns" class="nav-link">Campaigns</RouterLink>
	</nav>

	<section class="container p-3">
		<RouterView />
	</section>
</template>
