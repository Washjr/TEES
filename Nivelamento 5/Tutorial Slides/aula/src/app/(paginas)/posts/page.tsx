"use client"

import { Post } from '@/core/posts';
import { getPosts } from '@/service/posts';
import { useEffect, useState } from 'react';

export default function Posts() {

    const [posts, setPosts] = useState([]);

    async function obterPosts() {
        const p = await getPosts();
        setPosts(p);
    }

    useEffect(() => {
        obterPosts();
    }, []);

    return (
        <div className="p-4">
            <h1 className="text-2xl font-bold">Posts</h1>

            {
                posts && (
                    <ul className="flex flex-col gap-3 mt-7">

                        {posts.map((p: Post) => (

                            <li
                                className="flex flex-col gap-3 bg-slate-300 px-3 py-2 rounded-md transition-all"
                                key={p.id}
                            >
                                ID: {p.id} <br />
                                Título: {p.title} <br />
                                Corpo: {p.body} <br />
                                
                            </li>
                        ))}
                    </ul>
                )
            }
        </div>
    );
}