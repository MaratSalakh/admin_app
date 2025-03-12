<script setup lang="ts">
import { computed, ref } from "vue";
import { cities } from "../../entities/cities.ts";
import { useRouter } from "vue-router";
import { brigades } from "../../entities/brigades.ts";
import { shifts } from "../../entities/shifts.ts";
import { useWorksStore } from "../../app/store/store.ts";

const router = useRouter();
const store = useWorksStore();

const currentCity = ref("");
const currentWorkshop = ref("");
const currentEmployee = ref("");
const currentBrigade = ref("");
const currentShift = ref("");

const currentCityData = computed(() =>
    cities.find((city) => city.name === currentCity.value),
);
const availableWorkshops = computed(() => currentCityData?.value?.workshops);
const availableEmployees = computed(() => {
    const workshop = availableWorkshops?.value?.find(
        (workshop) => workshop.name === currentWorkshop.value,
    );

    return workshop?.employees;
});

const saveAndPush = () => {
    store.data = {
        currentCity: currentCity.value,
        currentWorkshop: currentWorkshop.value,
        currentEmployee: currentEmployee.value,
        currentBrigade: currentBrigade.value,
        currentShift: currentShift.value,
    };
    router.push("/info");
};
</script>

<template>
    <div class="container">
        <form class="form">
            <select class="form__select" v-model="currentCity" name="city">
                <option value="">-- Выберите город --</option>
                <option v-for="city in cities" :value="city.name">
                    {{ city.name }}
                </option>
            </select>

            <select
                class="form__select"
                v-model="currentWorkshop"
                name="workshop"
            >
                <option value="">-- Выберите цех --</option>
                <option
                    v-for="workshop in availableWorkshops"
                    :value="workshop.name"
                >
                    {{ workshop.name }}
                </option>
            </select>

            <select
                class="form__select"
                v-model="currentEmployee"
                name="employee"
            >
                <option value="">-- Выберите работника --</option>
                <option
                    v-for="employee in availableEmployees"
                    :value="employee.name"
                >
                    {{ employee.name }}
                </option>
            </select>

            <select
                class="form__select"
                v-model="currentBrigade"
                name="brigade"
            >
                <option value="">-- Выберите бригаду --</option>
                <option v-for="brigade in brigades" :value="brigade.name">
                    {{ brigade.name }}
                </option>
            </select>

            <select class="form__select" v-model="currentShift" name="shift">
                <option value="">-- Выберите смену --</option>
                <option v-for="shift in shifts" :value="shift.name">
                    {{ shift.name }}
                </option>
            </select>
        </form>

        <button class="form__button" @click="saveAndPush">Сохранить</button>
    </div>
</template>

<style scoped>
.container {
    margin: 16px;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    row-gap: 8px;
}

.form {
    padding: 1rem;
    border-radius: 10px;
    border: 1px solid grey;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    row-gap: 8px;
}
.form__button {
    width: 100px;
}
.form__select {
    min-width: 200px;
    width: fit-content;
}
</style>
