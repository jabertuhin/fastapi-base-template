from typing import Dict
from fastapi import APIRouter, Depends

from app.service.implementation.string_service import StringServiceImplementation


router = APIRouter(prefix="/string")


@router.post("/concatenate", tags=["String Operations"])
async def concatenate(
    str1: str,
    str2: str,
    string_service: StringServiceImplementation = Depends(StringServiceImplementation),
) -> Dict[str, str]:
    return string_service.concatenate(str1=str1, str2=str2)
