# TaskFlow CI/CD

TaskFlow CI/CD is a simple static dashboard project designed to demonstrate containerization and CI/CD automation with GitHub Actions.

The app itself is an HTML/CSS frontend, and deployment is intended to happen through an automated pipeline.

## Project Overview

- Frontend: Static HTML/CSS dashboard
- Container: Nginx (Alpine) image
- CI: GitHub Actions workflow for Docker build/push
- CD: GitHub Actions workflow to trigger Render deployment

## Tech Stack

- HTML5
- CSS3
- Docker
- Nginx (alpine)
- GitHub Actions
- Render Deploy Hook

## Repository Structure

- `index.html`: Main dashboard page
- `style.css`: Global and dashboard styles
- `Dockerfile`: Container build definition
- `ci.yml`: CI workflow for building and pushing Docker image
- `cd.yml`: CD workflow for deployment trigger
- `.dockerignore`: Docker context ignore rules

## Run Locally (Without Docker)

Because this is a static app, you can open the page directly in your browser.

Option 1:

1. Open `index.html` in a browser.

Option 2 (recommended for cleaner local testing):

1. Start a simple local web server from the project root:

	python3 -m http.server 8080

2. Open:

	http://localhost:8080

## Run With Docker

Build the image:

docker build -t taskflow-cicd:latest .

Run the container:

docker run -d -p 8080:80 --name taskflow-cicd taskflow-cicd:latest

Open:

http://localhost:8080

Stop and remove container:

docker stop taskflow-cicd && docker rm taskflow-cicd

## CI/CD Workflows

### CI Workflow (`ci.yml`)

Triggered on pull requests to `develop`.

Intended steps:

1. Checkout repository
2. Login to DockerHub
3. Build Docker image
4. Push image to DockerHub

### CD Workflow (`cd.yml`)

Triggered on push to `develop`.

Intended steps:

1. Checkout repository
2. Trigger Render deploy hook
3. Confirm deployment trigger

## Required GitHub Secrets

Add these repository secrets in GitHub:

- `DOCKER_USERNAME`
- `DOCKER_PASSWORD`
- `RENDER_HOOK`

## Notes and Current Fixes Needed

The current repository is close to functional but needs a few corrections for fully working automation:

1. `Dockerfile` uses `/user/share/nginx/html`; Nginx default path should be `/usr/share/nginx/html`.
2. `ci.yml` Docker build tag command formatting is currently invalid and should be corrected.
3. `cd.yml` has indentation/syntax issues in the workflow steps and needs cleanup.
4. Navigation links in `index.html` point to pages not present in this repository.

## Suggested Next Improvements

1. Add missing pages (`task-list.html`, `add-task.html`, etc.) or remove inactive navigation links.
2. Add GitHub Actions workflow validation and linting.
3. Add image push step in CI after successful build.
4. Add versioned image tags (for example: commit SHA and `latest`).
5. Add a preview/staging deployment environment.

## License

Add a license file if this project is intended for public use.
