# Pull base image
FROM python:3.7-slim

# Set environment varibles
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set work directory
RUN mkdir /jclock
WORKDIR /jclock

# Install dependencies
RUN pip install pipenv
COPY Pipfile Pipfile.lock /jclock/
RUN pipenv install --system

# Copy project
COPY ./ScalewayWebsite/ /jclock/

EXPOSE 8000

ENTRYPOINT ["/jclock/docker-entrypoint.sh"]

# Copy db init script
COPY init_db.sql /docker-entrypoint-initdb.d/
