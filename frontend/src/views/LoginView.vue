<script setup lang="ts">
</script>

<template>
	<header class="container text-center">
		<h1 class="fw-bold">Welcome!</h1>
	</header>

	<form action="" class="container-sm mt-4">
		<div class="form-floating mb-4">
			<input type="email" class="form-control" id="floatingInput" placeholder="name@example.com">
			<label for="floatingInput">Email address</label>
		</div>

		<div class="form-floating mb-4">
			<input type="password" class="form-control" id="floatingPassword" placeholder="thingamajig">
			<label for="floatingPassword">Password</label>
		</div>

		<button type="submit" class="btn btn-dark w-100 fw-bold">Log in</button>
	</form>

	<section class="container pt-4 text-center">
		<p><RouterLink to="/signup">Forgot your password?</RouterLink></p>
		<p><RouterLink to="/signup">Don't have an account?</RouterLink></p>
	</section>
</template>
