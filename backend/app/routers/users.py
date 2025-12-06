from typing import Annotated
from fastapi import APIRouter, Depends, HTTPException
from sqlmodel import Session

from app.dependencies import get_db, get_current_user, oauth2_scheme
from app.models.user import UserRead, UserUpdate
from app.services.user_service import UserService


router = APIRouter(prefix="/users", tags=["Users"])


@router.get(
    "/me",
    summary="Get current user profile",
    response_model=UserRead,
)
async def get_current_user_profile(current_user = Depends(get_current_user)):
    return current_user


@router.get(
    "/{user_id}",
    summary="Get user by ID",
    response_model=UserRead,
)
async def get_user(
    user_id: int,
    db: Session = Depends(get_db),
    current_user = Depends(get_current_user)  # Protected
):
    user = UserService.get_user(db, user_id)
    if not user:
        raise HTTPException(status_code=404, detail="User not found")
    return user


@router.patch(
    "/me",
    summary="Update current user profile",
    response_model=UserRead,
)
async def update_profile(
    user_update: UserUpdate,
    db: Session = Depends(get_db),
    current_user = Depends(get_current_user)
):
    return UserService.update_user(db, current_user.id, user_update)
