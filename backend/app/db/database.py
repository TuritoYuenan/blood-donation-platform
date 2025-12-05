from sqlmodel import SQLModel, create_engine

from app.core.config import DATABASE_URL

"""Database engine. Configurable via the DATABASE_URL environment variable."""
engine = create_engine(DATABASE_URL, echo=True)

def init_db():
	"""
	Create the database and all of its tables.
	"""
	SQLModel.metadata.create_all(engine)
