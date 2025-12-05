from sqlmodel import Field, SQLModel


class UserBase(SQLModel):
	__tablename__ = "users"
	email: str
	user_type: str  # staff/donor
	first_name: str
	last_name: str
	date_of_birth: str | None = None
	phone_number: str | None = None
	address: str | None = None
	pfp_url: str | None = None


class UserCreate(UserBase):
	password: str


class UserRead(UserBase):
	id: int


class User(UserBase, table=True):
	id: int | None = Field(default=None, primary_key=True)
	password_hash: str
