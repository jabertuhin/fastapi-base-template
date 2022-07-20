from abc import ABC, abstractmethod


class StringService(ABC):
    @abstractmethod
    def concatenate(self, str1: str, str2: str) -> str:
        raise NotImplementedError()
