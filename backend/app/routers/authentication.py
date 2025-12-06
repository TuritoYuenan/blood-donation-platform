from fastapi import APIRouter, Depends, status
from fastapi.security import OAuth2PasswordRequestForm
from sqlmodel import Session

from app.dependencies import get_db
from app.models.token import Token
from app.models.user import UserCreate
from app.services.auth_service import AuthService

router = APIRouter(prefix="/auth", tags=["Authentication"])


@router.post(
	"/register",
	summary="Register a new user",
	response_model=Token,
	status_code=status.HTTP_201_CREATED,
)
async def register(user: UserCreate, db: Session = Depends(get_db)):
	return AuthService.register_user(db, user)


@router.post(
	"/login",
	summary="Login and get access token",
	response_model=Token,
)
async def login(form_data: OAuth2PasswordRequestForm = Depends(), db: Session = Depends(get_db)):
	return AuthService.login(db, form_data.username, form_data.password)
