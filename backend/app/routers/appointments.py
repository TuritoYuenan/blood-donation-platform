from fastapi import APIRouter
from sqlmodel import select

from app.dependencies import DatabaseDep
from app.models.appointment import Appointment, AppointmentCreate, AppointmentRead


router = APIRouter(prefix="/appointments", tags=["Appointments"])


@router.get(
	"/",
	summary="Get all appointments",
	response_model=list[AppointmentRead]
)
async def get_appointments(db: DatabaseDep):
	return db.exec(select(Appointment)).all()


@router.post(
	"/",
	summary="Create a new appointment",
	response_model=AppointmentRead
)
async def create_appointment(app: AppointmentCreate, db: DatabaseDep):
	db_app = Appointment.model_validate(app)
	db.add(db_app)
	db.commit()
	db.refresh(db_app)
	return db_app
