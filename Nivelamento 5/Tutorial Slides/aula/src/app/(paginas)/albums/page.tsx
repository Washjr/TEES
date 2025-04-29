"use client"


import { Album } from '@/core/albums';
import { getAlbums } from '@/service/albums';
import { useEffect, useState } from 'react';

export default function Albums() {

    const [albums, setAlbums] = useState([]);

    async function obterAlbums() {
        const a = await getAlbums();
        setAlbums(a);
    }

    useEffect(() => {
        obterAlbums();
    }, []);

    return (
        <div className="p-4">
            <h1 className="text-2xl font-bold">Albums</h1>

            {
                albums && (
                    <ul className="flex flex-col gap-3 mt-7">

                        {albums.map((a: Album) => (

                            <li
                                className="flex flex-col gap-3 bg-slate-300 px-3 py-2 rounded-md transition-all"
                                key={a.id}
                            >                                
                                ID: {a.id} <br />
                                Título: {a.title} <br />
                                
                            </li>
                        ))}
                    </ul>
                )
            }
        </div>
    );
}