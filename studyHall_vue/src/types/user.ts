
export interface User {
    userId: number;
    userName: string;
    password: string;
    email: string;
    phone: string;
    roleName: string;
    date: string;
}

export interface Register {
    username: string;
    password: string;
    email: string;
}