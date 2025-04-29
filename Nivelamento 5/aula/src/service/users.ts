const url: string = "https://jsonplaceholder.typicode.com/users";

export async function getUsers() {
    try {
        const resposta = await fetch(url)

        if (!resposta.ok) {
            throw new Error("Não foi possível obter os usuários");
        }

        const usuariosJson = resposta.json();

        return usuariosJson;
    } catch (error) {
        console.error("Erro ao obter usuários:", error);
        throw new Error("Erro ao obter usuários");
    }
}