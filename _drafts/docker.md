---
layout: post
title: "Docker 101"
tags:
- Docker
categories:
- Code
thumbnail_path: blog/personal/docker.jpg
---

Build Once, Configure Once & Run Anywhere

**Introduction**

 1. Isolation
 	- Not running 2 different OS, 1 OS and 10s of Applications running each thinking it has it's own OS.
 	- Concept of light-weight isolation extremely accessible and easy to start developing.
 2. Portable
 	- VMs hard to port them - large files. Hard to synchronise 2 VMs - 20GB file.
 	- Version controlled environment (docker diff like git diff)
 3. Cross Cloud Infra
 	- Run on top of linux.
 	- Run Docker container on top of AWS, your machine.

 **Problems Solved by Docker**

 1. Ineffective Code Pipeline Management.
 2. Inconsistency across environments.
 3. Mismatches in dev and prod environments.
 4. Resource provisioning takes ages.
 5. Increasing bills.

**Basic Concepts and Docker Terminology**


**Docker Client** is the user interface the allows communication between the user and the Docker daemon.
**Docker Daemon** sits on the host machine answering requests for services.
**Docker Index** is a centralized registry allowing backup of Docker container images with public and private access permissions. DockerHub is an example of a Docker Index.
**Docker Containers** are the actual containers running the applications and includes the OS, user added files and the meta data. Processes, Ports and applications are local to containers.
**Docker Images** are all inclusive images that help launch Docker containers.
**DockerFile** is a file containing instructions that help automate image creation. Similar to Ansible.
**Layer** - Each file system that is stacked when Docker mounts rootfs.


**Docker Commands**

1. docker pull - Pull a pre-built image from the Docker Index.
2. docker run - Run the container in one of 3 modes - Background, Foreground, Interactive.
3. docker logs - View the logs of the running job.
4. docker commit - Save the contianer state as an image.
5. docker images - Obtain a list of images.
6. docker diff - Powerful as it provides a list of changes in files and directories. More efficient than Git.
7. docker build - Build docker images from dockerfiles.
8. docker inspect - low level info about containers and images.
9. docker attach - interact with running containers.
10. docker kill - kill the main process of the container. Every container starts with 1 process which determines the lifetime of a container. LAMP stack (4 containers). Supervisor is a recommended best way to run more than 1 process in a container (-n to run in foreground mode).
 	

**Docker Features**

1. Docker File 
	- Automates Image Creation Process
	- Set of instructions to create an image.
	- General DockerFile commands syntax:
		INSTRUCTION argument
		MAINTAINER <author name>
		RUN <command> any batch or shell or exec command
		ADD <src> <destination> copy files from one location to another
		CMD [""] default command for docker to run
		EXPOSE <port> port on which container listens to
			- don't do this. PORT is tied to container and not images.
		ENTRYPOINT ['executable', 'param1', 'param2'] configure a container as an executable
		WORKDIR <dir>	Set working directory
		ENV <key> <value>
		USER <uid> Set UID for use when runnign an image
		
		 ['/data'] Enable access to a directory from a working contianer


2. Docker Hub
	- 5 free repos and then 20 bucks for 10 repos.
	- Public and Private Docker Repositories. (Wordpress)

3. Docker Run
	- Run with tonly the main process
	- Run interactively (-i)
	- Run in daemon mode or foreground mode (the stdout of main process is printed in your shell)

4. Docker Diff
	- A diff of what files have changed since the last commit.

5. Docker Create
	- Using Dockerfile (add a text file and run the file) instead of cramming commands in a single line.

6. Volumes
	- Mount Data Volumes into application container

7. Port Forwarding
	- EXPOSE command


**Case Study**

	1. Quick and Easy Multi-Tenancy Using Docker
		Dev Approach (add tenant id)
			- tedious and code changes
		Ops Solution (New servers per tenant)
			- High Cost, High Maintenance and low utilization
		DevOps Solution
			- New Docker Container for every tenant
			- docker.py

	2. Cars.com (Improved developer workflow)
		- Dev Environment
			Production-like
			Quick
			Repeatable
		- Laptop
			- VM
				- Docker Containers
					Web
					App
					DB
					Redis
					MemCache
		- Randomly sampled fresh production data.
	3. Taulia (QA and Testing)
		- Run different instances of test in different Docker Container
		- Jenkins runs QA jobs
			- Jenkins checks out code from GIT
			- Starts a new contianer
			- Container builds using docker file.
			- Jenkins workspace is attached to container as volume
			- Code is compiled and tests are run.
			- Test resutls are put in the Jenkins workspace
			- Jenkins copies restuls back as Artifacts
	4. PinShape (Code Deployment)
		- Use DockerHub instead of GitHub as code delivery mechanism.
		- DockerHub can send triggers when a new container is pushed.
			-Build containers in staging, test, and push to Docker Hub.
			- Push triggers a pull of containers on instance.
			- Contianers are killed and new containers are started.
