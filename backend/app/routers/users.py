from fastapi import APIRouter, Depends, HTTPException
from sqlmodel import Session

from app.dependencies import get_db
from app.core.security import hash_password
from app.models.user import User, UserCreate, UserRead


router = APIRouter(prefix="/users", tags=["users"])


@router.post(
	"/",
	summary="Create a new user",
	response_model=UserRead,
)
async def create_user(user: UserCreate, session: Session = Depends(get_db)):
	db_user = User.model_validate(user, update={"password_hash": hash_password(user.password)})
	db_user.password_hash = hash_password(user.password)
	session.add(db_user)
	session.commit()
	session.refresh(db_user)
	return db_user


@router.get(
	"/{user_id}",
	summary="Get user by ID",
	response_model=UserRead,
)
async def get_user(user_id: int, session: Session = Depends(get_db)):
	user = session.get(dict, user_id)
	if not user: raise HTTPException(status_code=404, detail="User not found")
	return user
