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
    <div>
        <form>
            <select v-model="currentCity" name="city">
                <option v-for="city in cities" :value="city.name">
                    {{ city.name }}
                </option>
            </select>

            <select v-model="currentWorkshop" name="workshop">
                <option
                    v-for="workshop in availableWorkshops"
                    :value="workshop.name"
                >
                    {{ workshop.name }}
                </option>
            </select>

            <select v-model="currentEmployee" name="employee">
                <option
                    v-for="employee in availableEmployees"
                    :value="employee.name"
                >
                    {{ employee.name }}
                </option>
            </select>

            <select v-model="currentBrigade" name="brigade">
                <option v-for="brigade in brigades" :value="brigade.name">
                    {{ brigade.name }}
                </option>
            </select>

            <select v-model="currentShift" name="shift">
                <option v-for="shift in shifts" :value="shift.name">
                    {{ shift.name }}
                </option>
            </select>
        </form>

        <button @click="saveAndPush">save</button>
    </div>
</template>

<style scoped></style>
