from app.service.string_service import StringService


class StringServiceImplementation(StringService):    
    def concatenate(self, str1: str, str2: str) -> str:
        return str1 + str2
        