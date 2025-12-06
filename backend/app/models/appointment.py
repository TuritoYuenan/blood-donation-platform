from sqlmodel import Field, SQLModel


class AppointmentBase(SQLModel):
	date: str
	time: str
	description: str


class AppointmentCreate(AppointmentBase):
	pass


class AppointmentRead(AppointmentBase):
	id: int


class AppointmentUpdate(SQLModel):
	date: str | None = None
	time: str | None = None
	description: str | None = None


class Appointment(AppointmentBase, table=True):
	__tablename__ = "appointments"
	id: int | None = Field(default=None, primary_key=True)
