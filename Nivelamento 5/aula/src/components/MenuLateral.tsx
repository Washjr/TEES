import Link from 'next/link';

import MenuItem from './MenuItem';

export default function MenuLateral() {
    return (
        <div className="bg-sky-400 p-4 h-full w-[200px]">

            <Link href="\">
                <MenuItem item="Home"/>
            </Link>

            <Link href="\users">
                <MenuItem item="Usuários"/>
            </Link>

            <Link href="\posts">
                <MenuItem item="Posts"/>
            </Link>

            <Link href="\albums">
                <MenuItem item="Albums"/>
            </Link>
        </div>
    );
}