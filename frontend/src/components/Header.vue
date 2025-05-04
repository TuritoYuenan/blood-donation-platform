<script setup lang="ts">
</script>

<template>
	<header class="navbar navbar-expand-md p-3 bg-danger text-bg-danger rounded-3">
		<RouterLink to="/" class="navbar-brand">Containerised BDP</RouterLink>

		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="collapsibleNavbar">
			<nav class="navbar-nav ms-auto mb-2 mb-md-0">
				<RouterLink class="nav-link" to="/about">About</RouterLink>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false">
						Locations
					</a>
					<ul class="dropdown-menu">
						<li>
							<RouterLink class="dropdown-item" to="/locations/centers">Donation Centers</RouterLink>
						</li>
						<li>
							<RouterLink class="dropdown-item" to="/locations/campaigns">Donation Campaigns</RouterLink>
						</li>
					</ul>
				</li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false">
						My Account
					</a>
					<ul class="dropdown-menu">
						<li>
							<RouterLink class="dropdown-item" to="/signin">Sign in</RouterLink>
						</li>
						<li>
							<RouterLink class="dropdown-item" to="/signup">Sign up</RouterLink>
						</li>
					</ul>
				</li>
			</nav>
		</div>
	</header>
</template>
