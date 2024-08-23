<script setup lang="ts">
import { RouterLink } from 'vue-router'
</script>

<template>
	<h1>Blood Management System</h1>
	<p><RouterLink to="/donor/centers">Enter as Blood Donor</RouterLink></p>
	<p><RouterLink to="/staff/dashboard">Enter as Medical Staff</RouterLink></p>
</template>
