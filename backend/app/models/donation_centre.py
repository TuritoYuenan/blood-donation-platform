from sqlmodel import Field, SQLModel


class DonationCentreBase(SQLModel):
	__tablename__ = "donation_centres"
	name: str
	address: str
	status: str
	phone_number: str | None = None
	email: str | None = None
	operating_hours: str | None = None
	description: str | None = None


class DonationCentreCreate(DonationCentreBase):
	pass


class DonationCentreUpdate(SQLModel):
	name: str | None = None
	address: str | None = None
	status: str | None = None
	phone_number: str | None = None
	email: str | None = None
	operating_hours: str | None = None
	description: str | None = None


class DonationCentreRead(DonationCentreBase):
	id: int


class DonationCentre(DonationCentreBase, table=True):
	id: int | None = Field(default=None, primary_key=True)
