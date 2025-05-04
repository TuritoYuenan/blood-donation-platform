<script setup lang="ts">
</script>

<template>
	<header class="container p-3 text-center">
		<h1>Welcome back!</h1>
		<p>Sign in using your email address to continue your blood donation journey</p>
	</header>

	<form class="container-sm mt-4">
		<div class="vstack gap-3">
			<div class="form-floating w-100">
				<input type="email" class="form-control" id="floatingInput" placeholder="name@example.com">
				<label for="floatingInput">Email address</label>
			</div>
			<div class="form-floating w-100">
				<input type="password" class="form-control" id="floatingPassword" placeholder="thingamajig">
				<label for="floatingPassword">Password</label>
			</div>
			<button type="submit" class="btn btn-danger">Sign in</button>
			<p class="hstack gap-3 flex-wrap justify-content-around">
				<RouterLink to="/signup">Forgot your password?</RouterLink>
				<RouterLink to="/signup">Don't have an account?</RouterLink>
			</p>
		</div>
	</form>
</template>
