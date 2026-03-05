from fastapi import APIRouter, Depends, HTTPException
from sqlmodel import Session, select

from app.dependencies import get_db
from app.models.donation_centre import DonationCentre, DonationCentreCreate, DonationCentreRead, DonationCentreUpdate


router = APIRouter(prefix="/donation_centres", tags=["Donation Centres"])

@router.get("/", response_model=list[DonationCentreRead])
async def get_donation_centres(db: Session = Depends(get_db)):
	centres = db.exec(select(DonationCentre)).all()
	return centres


@router.get("/{centre_id}", response_model=DonationCentreRead)
async def get_donation_centre(centre_id: int, db: Session = Depends(get_db)):
	centre = db.get(DonationCentre, centre_id)
	if not centre: raise HTTPException(status_code=404, detail="Donation centre not found")
	return centre


@router.post("/", response_model=DonationCentreRead)
async def create_donation_centre(centre: DonationCentreCreate, db: Session = Depends(get_db)):
	db_centre = DonationCentre.model_validate(centre)
	db.add(db_centre)
	db.commit()
	db.refresh(db_centre)
	return db_centre


@router.put("/{centre_id}", response_model=DonationCentreRead)
async def update_donation_centre(centre_id: int, centre: DonationCentreUpdate, db: Session = Depends(get_db)):
	db_centre = db.get(DonationCentre, centre_id)
	if not db_centre:
		raise HTTPException(status_code=404, detail="Donation centre not found")

	centre_data = centre.model_dump(exclude_unset=True)
	for key, value in centre_data.items():
		setattr(db_centre, key, value)

	db.add(db_centre)
	db.commit()
	db.refresh(db_centre)
	return db_centre


@router.delete("/{centre_id}")
async def delete_donation_centre(centre_id: int, db: Session = Depends(get_db)):
	db_centre = db.get(DonationCentre, centre_id)
	if not db_centre:
		raise HTTPException(status_code=404, detail="Donation centre not found")

	db.delete(db_centre)
	db.commit()
	return {"message": "Donation centre deleted successfully"}
