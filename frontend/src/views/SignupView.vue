<script setup lang="ts">
</script>

<template>
	<header class="container text-center">
		<h1>Join the cause today!</h1>
		<p>Sign up today to schedule and manage your appointments, locate nearby donor centers, track your donation
			history, and access more personalized services.</p>
	</header>

	<form class="container mt-4">
		<fieldset>
			<legend>Personal details</legend>

			<div class="hstack gap-3">
				<div class="form-floating w-100">
					<input type="email" class="form-control" id="floatingInput" placeholder="Turito">
					<label for="floatingInput">First name</label>
				</div>

				<div class="form-floating w-100">
					<input type="email" class="form-control" id="floatingInput" placeholder="Yuenan">
					<label for="floatingInput">Last name</label>
				</div>
			</div>

			<p class="form-text">Enter your name as it shows on your license or passport.</p>

			<div class="hstack gap-3">
				<div class="form-floating w-100">
					<input type="date" class="form-control" id="dob" placeholder="Date of birth"
						aria-label="Date of birth">
					<label for="dob">Date of Birth</label>
				</div>

				<div class="form-floating w-100">
					<input type="text" class="form-control" id="gender" placeholder="Gender" aria-label="Gender">
					<label for="gender">Gender</label>
				</div>
			</div>

			<p class="form-text">Donors are required to be above 18 years old</p>
		</fieldset>

		<fieldset class="mt-4">
			<legend>Contact details</legend>

			<div class="hstack gap-3">
				<div class="form-floating w-100">
					<input type="tel" class="form-control" placeholder="+1 234 567 890" aria-label="Phone number">
					<label for="phone">Phone number</label>
				</div>

				<div class="form-floating w-100">
					<input type="email" class="form-control" placeholder="name@mail.com" aria-label="Email address">
					<label for="email">Email address</label>
				</div>
			</div>

			<p class="form-text"></p>

			<div class="form-floating w-100">
				<input type="text" class="form-control" placeholder="Identity number" aria-label="Identity number">
				<label for="identity">Identity number</label>
			</div>
		</fieldset>

		<div class="hstack mt-4 gap-3">
			<button class="btn btn-danger">Sign up</button>
			<button class="btn btn-secondary">Cancel</button>
		</div>
	</form>
</template>
