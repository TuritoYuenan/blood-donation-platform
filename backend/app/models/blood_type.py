from sqlmodel import Field, SQLModel


class BloodType(SQLModel, table=True):
	__tablename__ = "blood_types"

	id: int | None = Field(default=None, primary_key=True)
	type: str = Field(index=True, unique=True, nullable=False)
	description: str | None = Field(default=None, nullable=True)
