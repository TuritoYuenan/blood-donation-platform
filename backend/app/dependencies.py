import jwt
from fastapi import Depends, HTTPException
from fastapi.security import OAuth2PasswordBearer
from sqlmodel import Session
from typing import Annotated

from app.db.database import engine
from app.models.token import TokenData
from app.models.user import User


oauth2_scheme = OAuth2PasswordBearer(tokenUrl="token")


def get_db():
	with Session(engine) as session:
		yield session


def get_current_user(token: Annotated[str, Depends(oauth2_scheme)]):
	credentials_exception = HTTPException(
		status_code=401,
		detail="Could not validate credentials",
		headers={"WWW-Authenticate": "Bearer"},
	)

	try:
		payload = jwt.decode(token, "your-secret-key", algorithms=["HS256"])
		username: str = payload.get("sub")
		if username is None:
			raise credentials_exception
		token_data = TokenData(username=username)
	except jwt.InvalidTokenError:
		raise credentials_exception

	# user_obj = UserService.


DatabaseDep = Annotated[Session, Depends(get_db)]
CurrentUserDep = Annotated[User, Depends(get_current_user)]
