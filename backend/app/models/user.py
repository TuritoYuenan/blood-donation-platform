from sqlmodel import Field, SQLModel


# MARK: Generic User


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


class UserUpdate(UserBase):
	password: str | None = None


class User(UserBase, table=True):
	id: int | None = Field(default=None, primary_key=True)
	password_hash: str


# MARK: Staff User


class StaffUserBase(SQLModel):
	id: int = Field(primary_key=True, foreign_key="users.id")
	centre_id: int | None = Field(default=None, foreign_key="donation_centres.id")


# MARK: Donor User

