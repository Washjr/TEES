const url: string = "https://jsonplaceholder.typicode.com/albums";

export async function getAlbums() {
    try {
        const resposta = await fetch(url)

        if (!resposta.ok) {
            throw new Error("Não foi possível obter os albums");
        }

        const albumsJson = resposta.json();

        return albumsJson;
    } catch (error) {
        console.error("Erro ao obter albums:", error);
        throw new Error("Erro ao obter albums");
    }
}