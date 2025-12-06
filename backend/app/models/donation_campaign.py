from sqlmodel import Field, SQLModel


class DonationCampaignBase(SQLModel):
	pass


class DonationCampaignCreate(DonationCampaignBase):
	pass


class DonationCampaignRead(DonationCampaignBase):
	pass


class DonationCampaignUpdate(DonationCampaignBase):
	pass


class DonationCampaign(DonationCampaignBase, table=True):
	id: int | None = Field(default=None, primary_key=True)
