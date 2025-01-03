<script setup lang="ts">
</script>

<template>
	<nav class="navbar navbar-expand-sm bg-dark" data-bs-theme="dark">
		<div class="container-fluid">
			<RouterLink to="/" class="navbar-brand">Containerised BDP</RouterLink>

			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="collapsibleNavbar">
				<ul class="navbar-nav">
					<li class="nav-item">
						<RouterLink to="/" class="nav-link">Link</RouterLink>
					</li>
					<li class="nav-item">
						<RouterLink to="/" class="nav-link">Link</RouterLink>
					</li>
					<li class="nav-item">
						<RouterLink to="/" class="nav-link">Link</RouterLink>
					</li>
				</ul>
			</div>
		</div>
	</nav>
</template>
