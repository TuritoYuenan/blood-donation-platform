from fastapi import APIRouter


router = APIRouter(prefix="/donation_campaigns", tags=["Donation Campaigns"])


@router.post("/", summary="Create a donation campaign")
async def create_donation_campaign():
	return {"message": "Create donation campaign endpoint"}


@router.get("/", summary="List donation campaigns")
async def list_donation_campaigns():
	return {"message": "List donation campaigns endpoint"}


@router.get("/{campaign_id}", summary="Get a donation campaign")
async def get_donation_campaign(campaign_id: int):
	return {"message": f"Get donation campaign {campaign_id} endpoint"}
