# Creating your first JX install on GKE

## Let's get started!

This guide will show you how to install `jx` and use it to create a cluster on Google Kubernetes Engine.

**Time to complete**: About 25 minutes

Click the **Next** button to move to the next step.

## Prerequisites

To run this tutorial you need to:

  * Create and/or select a project.
  
      * To create a project: `gcloud projects create <project-name>`
      
      * To select the project in which this tutorial will be executed: `gcloud config set project <PROJECT_ID>`
         
  * Billing must be enabled (note there's a $300 credit, free tier for new accounts)

## Step 1 - Installing Dependencies

The first thing we need to do is install the `jx` binary and add it to your PATH.

```bash
source ./install-jx.sh
```

**Tip**: Click the copy button on the side of the code box and paste the command in the Cloud Shell terminal to run it.

This may take a few minutes to complete as it downloads everything it requires.

## Step 2 - Create a cluster

To create the cluster, run the following:

```bash
jx create cluster gke --skip-login
```

This will guide you through creating a cluster on GKE.

### Missing Dependencies

JX will attempt to locate any required dependencies, if it discovers that some are missing
it will prompt to install them for you in the `~/.jx/bin` folder.  It is recommended that
you allow `jx` to install any missing dependencies.

### Configure your cluster

JX will then provide you with defaults for the basic configuration options for your cluster. You will be prompted to make some selections, for example:

* Google Cloud Zone - select a zone that is near to you

The defaults provided include:
* A generated name for your cluster
* Cluster type `Zonal`
* Machine type - `n1-standard-2`
* Minimum number of Nodes - `3`
* Maximum number of Nodes - `5`
* Use of preemptible VMs - `No`
* Access Google Cloud Storage / Google Container Registry - `Yes`
* Enable Cloud Build, Container Registry & Container Analysis APIs - `Yes`
* Enable Kaniko for building container images - `No`

Your cluster < name > in < zone > should be created for you. 🎉

### GitHub connectivity

If this is the first time you have run `jx` in this cloudshell, `jx` will prompt you for a 
github username & api token.  If you already have one, simply enter the values when prompted. 
If you don't have an api token, click on the link provided to generated one and enter the 
token value into the prompt.

### Jenkins Installation  

* Select Jenkins Installation Type - recommended `Static Jenkins Server and Jenkinsfiles`
* Pick workload build pack - recommend `Kubernetes Workloads: Automated CI+CD with GitOps Promotion`

Next, `jx` will attempt to configure Jenkins connectivity.  This should be done automatically, 
but sometimes Jenkins is not able to start intime.  In this instance, you will be asked to 
login to Jenkins using the admin user.  The password for the admin user will be displayed in the 
console.  At this point, follow the instructions to add the Jenkins API token.

## Step 3 - Create an app

Now that you have a working cluster containing a JX install, we are going to create an
application, that can be built & deployed with Jenkins-X

### Using a quickstart

JX has a `create quickstart` command that will create a build from a standardised template.
To run this command, type the following:

```bash
jx create quickstart
```

For this example, lets select `golang-http` and choose a name for the new application such
as `cloudshell-tutorial`.

JX will then guide you through setting up the git repository for the application.

If this is the first application you have created, it may take a few minutes to download all
of the required builder images in order to build/deploy the application.  To view the status 
of the app, you can use the following:

```bash
jx get activity -f cloudshell-tutorial -w
```

To view the app in each environment along with urls

```bash
jx get applications
```

### Promote the app to production

Using the `jx promote` command, you can push this version from staging to
production.

```bash
cd cloudshell-tutorial
```
_If you have 2FA enabled on your GitHub account, then you may need to use an api token as your password when prompted._

```bash
jx promote cloudshell-tutorial --version 0.0.1 --env production
```

You can check the progress of the production deployment using:

```bash
jx get activity -f cloudshell-tutorial -w
```

```bash
jx get applications
```

## Congratulations

<walkthrough-conclusion-trophy></walkthrough-conclusion-trophy>

You’re all set!

You now have a fully configured Jenkins-X installation on Google Kubernetes Engine.

To avoid running up unnecessary costs, you may wish to shut down your kubernetes cluster at this point.  To view all clusters running with the current account use:

```bash
gcloud container clusters list
```

To delete the cluster run:

```bash
gcloud container clusters delete <clustername> --zone <zone>
```
