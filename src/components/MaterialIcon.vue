<script setup lang="ts">
defineProps<{ id: string }>()
</script>

<template>
	<span class="material-symbols-rounded">{{ id }}</span>
</template>
