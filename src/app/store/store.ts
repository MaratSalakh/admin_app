import { defineStore } from "pinia";
import { ref } from "vue";

type WorksData = {
    currentCity: string;
    currentWorkshop: string;
    currentEmployee: string;
    currentBrigade: string;
    currentShift: string;
};

export const useWorksStore = defineStore("works", () => {
    const data = ref<WorksData>();

    return { data };
});
