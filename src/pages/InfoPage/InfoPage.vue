<script setup lang="ts">
import { useWorksStore } from "../../app/store/store.ts";

const store = useWorksStore();
</script>

<template>
    <div>
        Город:
        {{ store.data?.currentCity ? store.data?.currentCity : "Не выбрано" }}
    </div>
    <div>
        Цех:
        {{
            store.data?.currentWorkshop
                ? store.data?.currentWorkshop
                : "Не выбрано"
        }}
    </div>
    <div>
        Работник:
        {{
            store.data?.currentEmployee
                ? store.data?.currentEmployee
                : "Не выбрано"
        }}
    </div>
    <div>
        Бригада:
        {{
            store.data?.currentBrigade
                ? store.data?.currentBrigade
                : "Не выбрано"
        }}
    </div>
    <div>
        Смена:
        {{ store.data?.currentShift ? store.data?.currentShift : "Не выбрано" }}
    </div>
</template>

<style scoped></style>
