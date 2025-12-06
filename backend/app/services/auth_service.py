from sqlmodel import Session

from app.models.token import Token
from app.models.user import UserCreate


class AuthService:
	@staticmethod
	def register_user(db: Session, user_create: UserCreate) -> Token:
		# Implementation for registering a new user
		pass

	@staticmethod
	def login(db: Session, username: str, password: str) -> Token:
		# Implementation for user login
		pass

	@staticmethod
	def refresh_access_token(db: Session, refresh_token: str) -> Token:
		# Implementation for refreshing access token
		pass
