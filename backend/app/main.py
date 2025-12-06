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

@asynccontextmanager
async def lifespan(app: FastAPI):
	init_db()
	yield
	print("Shutting down...")


app = FastAPI(
	title="Blood Donation Platform API",
	version="1.0.0",
	description="API for managing users and blood donations.",
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
