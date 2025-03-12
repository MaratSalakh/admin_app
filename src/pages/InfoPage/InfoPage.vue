<script setup lang="ts">
import { useWorksStore } from "../../app/store/store.ts";

const store = useWorksStore();
</script>

<template>
    <div>{{ store.data?.currentCity }}</div>
    <div>{{ store.data?.currentWorkshop }}</div>
    <div>{{ store.data?.currentEmployee }}</div>
    <div>{{ store.data?.currentBrigade }}</div>
    <div>{{ store.data?.currentShift }}</div>
</template>

<style scoped></style>
