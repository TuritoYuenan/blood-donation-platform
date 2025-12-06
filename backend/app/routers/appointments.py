from fastapi import APIRouter


router = APIRouter(prefix="/appointments", tags=["Appointments"])


@router.get(
	"/",
	summary="Get all appointments",
)
async def get_appointments():
	return {"message": "List of appointments"}
