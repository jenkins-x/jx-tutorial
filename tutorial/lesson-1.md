# Creating your first JX install on GKE

## Let's get started!

This guide will show you how to install `jx` and use it to create a cluster on Google Kubernetes Engine.

**Time to complete**: About 15 minutes

Click the **Continue** button to move to the next step.

## Step 1 - Installing Dependencies

The first thing we need to do is install the `jx` binary and add it to your PATH.

```bash
eval "$(./install-jx.sh)"
```

**Tip**: Click the copy button on the side of the code box and paste the command in the Cloud Shell terminal to run it.

Next, you’ll write and launch a basic tutorial.

**Time to complete**: About 15 minutes

Click the **Continue** button to move to the next step.

## Step 2 - Create a cluster

To create the cluster, run the following:

```bash
jx create cluster gke --skip-login
```

This will guide you through creating a cluster on GKE.

## Congratulations

<walkthrough-conclusion-trophy></walkthrough-conclusion-trophy>

You’re all set!
