from typing import List, Type

from cat.factory.embedder import EmbedderSettings
from cat.mad_hatter.decorators import hook
from langchain_community.embeddings import OllamaEmbeddings
from pydantic import ConfigDict


class OllamaEmbedderConfig(EmbedderSettings):
    base_url: str
    model: str = "nomic-embed-text"
    num_ctx: int = 2048
    repeat_last_n: int = 64
    repeat_penalty: float = 1.1
    temperature: float = 0.8

    _pyclass: Type = OllamaEmbeddings

    model_config = ConfigDict(
        json_schema_extra={
            "humanReadableName": "Ollama Embedder",
            "description": "Embedder configuration for Ollama",
            "link": "https://ollama.ai/library",
        }
    )


@hook
def factory_allowed_embedders(allowed, cat) -> List:
    allowed.append(OllamaEmbedderConfig)
    return allowed
