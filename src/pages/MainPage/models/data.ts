interface City {
  id: number;
  name: string;
  workshops: Workshop[];
}

interface Workshop {
  id: number;
  name: string;
  employees: Employee[];
}

interface Employee {
  id: number;
  name: string;
}

interface Brigade {
  id: number;
  name: string;
}

interface Shift {
  id: number;
  name: string;
}

export const cities: City[] = [
  {
    id: 1,
    name: "Москва",
    workshops: [
      {
        id: 101,
        name: "Цех 1",
        employees: [
          { id: 1001, name: "Иван Иванов" },
          { id: 1002, name: "Петр Петров" },
        ],
      },
      {
        id: 102,
        name: "Цех 2",
        employees: [
          { id: 1003, name: "Сергей Сидоров" },
          { id: 1004, name: "Алексей Алексеев" },
        ],
      },
    ],
  },
  {
    id: 2,
    name: "Санкт-Петербург",
    workshops: [
      {
        id: 201,
        name: "Цех 3",
        employees: [
          { id: 2001, name: "Дмитрий Дмитриев" },
          { id: 2002, name: "Николай Николаев" },
        ],
      },
      {
        id: 202,
        name: "Цех 4",
        employees: [
          { id: 2003, name: "Андрей Андреев" },
          { id: 2004, name: "Виктор Викторов" },
        ],
      },
    ],
  },
];

export const brigades: Brigade[] = [
  { id: 1, name: "Бригада 1" },
  { id: 2, name: "Бригада 2" },
  { id: 3, name: "Бригада 3" },
];

export const shifts: Shift[] = [
  { id: 1, name: "Смена 1" },
  { id: 2, name: "Смена 2" },
  { id: 3, name: "Смена 3" },
];
