FROM python:3

# Copy the current directory contents into the container at /app
COPY . /usr/src/app

# Set the working directory to /usr/src/app
WORKDIR /usr/src/app

# Install pip-compile and any needed packages specified in requirements.txt 
# referenced by requirements.inv
RUN pip install -U pip pip-tools \
&& pip-compile requirements.in \
&& pip-compile --upgrade \
&& pip-sync

# Make port 5000 available to the world outside this container
EXPOSE 5000

# run the command
CMD [ "python", "./app.py" ]