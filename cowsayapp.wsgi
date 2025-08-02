import sys
import os

# Add app directory to Python path
sys.path.insert(0, os.path.dirname(__file__))

# Import the app
from app import app as application
