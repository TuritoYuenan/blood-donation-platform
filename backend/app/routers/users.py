from fastapi import APIRouter, Depends, HTTPException
from sqlmodel import Session

from app.dependencies import get_db
from app.models.user import UserCreate, UserRead
from app.services.user_service import UserService


router = APIRouter(prefix="/users", tags=["Users"])


@router.post(
	"/",
	summary="Create a new user",
	response_model=UserRead,
	status_code=201,
)
async def create_user(user: UserCreate, db: Session = Depends(get_db)):
	return UserService.create_user(db, user)


@router.get(
	"/{user_id}",
	summary="Get user by ID",
	response_model=UserRead,
)
async def get_user(user_id: int, db: Session = Depends(get_db)):
	user = UserService.get_user(db, user_id)
	if not user: raise HTTPException(status_code=404, detail="User not found")
	return user
