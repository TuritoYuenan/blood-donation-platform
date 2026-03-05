from datetime import date
from sqlmodel import Field, SQLModel


class DonationCampaignBase(SQLModel):
	name: str
	description: str | None = None
	start_date: date
	end_date: date
	target_blood_type: str | None = None
	target_amount: float | None = None
	status: str = "active"


class DonationCampaignCreate(DonationCampaignBase):
	pass


class DonationCampaignUpdate(SQLModel):
	name: str | None = None
	description: str | None = None
	start_date: date | None = None
	end_date: date | None = None
	target_blood_type: str | None = None
	target_amount: float | None = None
	status: str | None = None


class DonationCampaignRead(DonationCampaignBase):
	id: int


class DonationCampaign(DonationCampaignBase, table=True):
	id: int | None = Field(default=None, primary_key=True)
