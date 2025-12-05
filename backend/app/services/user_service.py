from sqlmodel import Session

from app.core.security import hash_password
from app.models.user import User, UserCreate


class UserService:
	@staticmethod
	def create_user(db: Session, user: UserCreate):
		db_user = User.model_validate(user, update={"password_hash": hash_password(user.password)})
		db.add(db_user)
		db.commit()
		db.refresh(db_user)
		return db_user

	@staticmethod
	def get_user(db: Session, user_id: int):
		return db.get(User, user_id)
