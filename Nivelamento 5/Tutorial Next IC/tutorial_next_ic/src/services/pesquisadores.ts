const url: string =
  "http://localhost:8080/researcherName?name=&graduate_program_id=";

const getPesquisadores = async () => {
  const resposta = await fetch(url, {
    method: "GET",
    mode: "cors",
    headers: {
      "Content-Type": "application/json",
    },
  });

  if (!resposta.ok) {
    throw new Error("Não foi possível buscar os pesquisadores");
  }

  return resposta.json();
};

export default getPesquisadores;
