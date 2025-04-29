"use client"


import { User } from "@/core/users";
import { getUsers } from "@/service/users";
import { useEffect, useState } from "react";

export default function Users() {

    const [usuarios, setUsuarios] = useState([]);

    async function obterUsuarios() {
        const u = await getUsers();
        setUsuarios(u);
    }

    useEffect(() => {
        obterUsuarios();
    }, []);

    return (
        <div className="p-4">
            <h1 className="text-2xl font-bold">Usuários</h1>

            {
                usuarios && (
                    <ul className="flex flex-col gap-3 mt-7">
                        
                        {usuarios.map((u: User) => (

                            <li
                                className="flex flex-col gap-3 bg-slate-300 px-3 py-2 rounded-md transition-all"
                                key={u.id}
                            >
                                ID: {u.id} <br />
                                Nome: {u.name} <br />
                                Email: {u.email} <br />
                                Cidade: {u.address.city} <br />
                                Rua: {u.address.street} <br />
                                
                            </li>
                        ))}
                    </ul>
                )
            }
        </div>
    );
}