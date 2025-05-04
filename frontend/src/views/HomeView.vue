<script lang="ts">
export default {
};
</script>

<template>
	<section id="hero-banner" class="container p-3">
		<div class="row">
			<div class="col">
				<h1>Cho đi để nhận lại</h1>
				<p>Connect donors to recipients and streamline the blood donation process with a purpose-driven app.</p>
				<RouterLink to="/locations/campaigns" class="px-3 py-2 d-inline-block bg-danger text-bg-danger rounded">Donate now!</RouterLink>
			</div>
			<div class="col">
				<img src="" alt="">
			</div>
		</div>
	</section>

	<section id="info" class="container p-3 text-center">
		<div class="row row-cols-1 row-cols-sm-2 row-cols-md-4">
			<div class="col">
				<span class="navbar-toggler-icon"></span>
				<p>Can I give blood?</p>
			</div>
			<div class="col">
				<span class="navbar-toggler-icon"></span>
				<p>Where to give blood?</p>
			</div>
			<div class="col">
				<span class="navbar-toggler-icon"></span>
				<p>Blood supply level</p>
			</div>
			<div class="col">
				<span class="navbar-toggler-icon"></span>
				<p>How to give blood?</p>
			</div>
		</div>
	</section>
</template>
