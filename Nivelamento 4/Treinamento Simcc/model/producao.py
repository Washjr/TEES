from pydantic import BaseModel, Field
from typing import Optional

class Producao(BaseModel):
    producoes_id: Optional[str] = Field(None, min_length=36, max_length=36)
    pesquisadores_id: str = Field(..., min_length=36, max_length=36)
    issn: str = Field(..., min_length=1, max_length=16)
    nomeartigo: str = Field(..., min_length=2, max_length=200)
    anoartigo: int = Field(...)    
    doi: str = Field(..., min_length=2, max_length=100)
    qualis: str = Field(..., min_length=1, max_length=8)
    nomepesquisador: str = Field(..., min_length=1, max_length=300)
    
    
    
    
