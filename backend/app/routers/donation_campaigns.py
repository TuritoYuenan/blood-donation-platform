from fastapi import APIRouter, Depends, HTTPException
from sqlmodel import Session, select

from app.dependencies import get_db
from app.models.donation_campaign import (
	DonationCampaign,
	DonationCampaignCreate,
	DonationCampaignRead,
	DonationCampaignUpdate
)


router = APIRouter(prefix="/donation_campaigns", tags=["Donation Campaigns"])


@router.get("/", response_model=list[DonationCampaignRead])
async def list_donation_campaigns(db: Session = Depends(get_db)):
	campaigns = db.exec(select(DonationCampaign)).all()
	return campaigns


@router.get("/{campaign_id}", response_model=DonationCampaignRead)
async def get_donation_campaign(campaign_id: int, db: Session = Depends(get_db)):
	campaign = db.get(DonationCampaign, campaign_id)
	if not campaign:
		raise HTTPException(status_code=404, detail="Donation campaign not found")
	return campaign


@router.post("/", response_model=DonationCampaignRead)
async def create_donation_campaign(campaign: DonationCampaignCreate, db: Session = Depends(get_db)):
	db_campaign = DonationCampaign.model_validate(campaign)
	db.add(db_campaign)
	db.commit()
	db.refresh(db_campaign)
	return db_campaign


@router.put("/{campaign_id}", response_model=DonationCampaignRead)
async def update_donation_campaign(campaign_id: int, campaign: DonationCampaignUpdate, db: Session = Depends(get_db)):
	db_campaign = db.get(DonationCampaign, campaign_id)
	if not db_campaign:
		raise HTTPException(status_code=404, detail="Donation campaign not found")

	campaign_data = campaign.model_dump(exclude_unset=True)
	for key, value in campaign_data.items():
		setattr(db_campaign, key, value)

	db.add(db_campaign)
	db.commit()
	db.refresh(db_campaign)
	return db_campaign


@router.delete("/{campaign_id}")
async def delete_donation_campaign(campaign_id: int, db: Session = Depends(get_db)):
	db_campaign = db.get(DonationCampaign, campaign_id)
	if not db_campaign:
		raise HTTPException(status_code=404, detail="Donation campaign not found")

	db.delete(db_campaign)
	db.commit()
	return {"message": "Donation campaign deleted successfully"}
