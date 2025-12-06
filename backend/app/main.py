from fastapi import FastAPI
from fastapi.concurrency import asynccontextmanager
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import RedirectResponse

from app.db.database import init_db
from app.routers import (
	appointments,
	authentication,
	donation_centres,
	donation_campaigns,
	users
)

openapi_tags = [
	{
		"name": "Authentication",
		"description": "Operations related to user authentication."
	},
	{
		"name": "Users",
		"description": "Operations related to user management."
	},
	{
		"name": "Donation Centres",
		"description": "Operations related to donation centres."
	},
	{
		"name": "Donation Campaigns",
		"description": "Operations related to donation campaigns."
	},
	{
		"name": "Appointments",
		"description": "Operations related to blood donation appointments."
	}
]

@asynccontextmanager
async def lifespan(app: FastAPI):
	init_db()
	yield
	print("Shutting down...")


app = FastAPI(
	title="Blood Donation Platform API",
	version="1.0.0",
	description="API for managing users and blood donations.",
	contact={
		"name": "Turito Yuenan",
		"email": "turitoyuenan@proton.me",
		"url": "https://turitoyuenan.github.io/"
	},
	openapi_tags=openapi_tags,
	lifespan=lifespan
)


app.add_middleware(
	CORSMiddleware,
	allow_origins=["*"],
	allow_credentials=True,
	allow_methods=["*"],
	allow_headers=["*"],
)


@app.get("/")
async def read_root():
	return RedirectResponse(url="/docs")


app.include_router(appointments.router)
app.include_router(authentication.router)
app.include_router(donation_campaigns.router)
app.include_router(donation_centres.router)
app.include_router(users.router)
