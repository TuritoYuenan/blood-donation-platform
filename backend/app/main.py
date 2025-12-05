from fastapi import FastAPI
from fastapi.concurrency import asynccontextmanager
from fastapi.responses import RedirectResponse

from app.db.database import init_db
from app.routers import users

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


@app.get("/")
async def read_root():
	return RedirectResponse(url="/docs")


app.include_router(users.router)
