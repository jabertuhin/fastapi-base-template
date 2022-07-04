from abc import ABC, abstractstaticmethod


class StringService(ABC):
    @abstractstaticmethod
    def concatenate(self, str1: str, str2: str) -> str:
        raise NotImplementedError()
