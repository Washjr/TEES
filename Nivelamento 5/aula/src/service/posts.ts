const url: string = "https://jsonplaceholder.typicode.com/posts";

export async function getPosts() {
    try {
        const resposta = await fetch(url)

        if (!resposta.ok) {
            throw new Error("Não foi possível obter os posts");
        }

        const postsJson = resposta.json();

        return postsJson;
    } catch (error) {
        console.error("Erro ao obter posts:", error);
        throw new Error("Erro ao obter posts");
    }
}