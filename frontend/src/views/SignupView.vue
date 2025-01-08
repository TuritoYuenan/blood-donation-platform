<script setup lang="ts">
</script>

<template>
	<header class="container text-center">
		<h1 class="fw-bold">Sign up!</h1>
		<p>Sign up today to schedule and manage your appointments, locate nearby donor centers, track your donation
			history, and access more personalized services.</p>
	</header>

	<form action="" class="container-sm mt-4">
		<fieldset>
			<legend>Personal details</legend>

			<div class="row">
				<div class="col mb-2">
					<input type="text" class="form-control" placeholder="First name" aria-label="First name">
				</div>

				<div class="col mb-2">
					<input type="text" class="form-control" placeholder="Last name" aria-label="Last name">
				</div>
			</div>

			<p>Enter your name as it shows on your license or passport.</p>

			<div class="row">
				<div class="col mb-2">
					<input type="text" class="form-control" placeholder="Gender" aria-label="Gender">
				</div>

				<div class="col mb-2">
					<input type="date" class="form-control" placeholder="Date of birth" aria-label="Date of birth">
				</div>
			</div>
		</fieldset>

		<fieldset>
			<legend>Contact details</legend>

			<input type="email" class="form-control" placeholder="Email address" aria-label="Email address">

			<div class="row">
				<div class="col my-2">
					<input type="tel" class="form-control" placeholder="Phone number" aria-label="Phone number">
				</div>

				<div class="col my-2">
					<input type="text" class="form-control" placeholder="Identity number" aria-label="Identity number">
				</div>
			</div>
		</fieldset>

		<button class="btn btn-outline-dark me-2">Cancel</button>
		<button class="btn btn-dark">Sign up</button>
	</form>
</template>
