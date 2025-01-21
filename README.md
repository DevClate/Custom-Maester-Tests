# Custom Maester Test Collection

A collection of customs tests that can be quickly dropped into [Maester](https://www.maester.dev) and customized to your enviroment where needed. 

This repository is still in it's beginning stages and I plan to add many more tests to this repository that just aren't 365 focused as well. I welcome any contributions, please make sure you create all 3 files per test so that it works smoothly for everyone - [Creating Tests](https://devclate.github.io/Custom-Maester-Tests/docs/Getting-Started/create-a-test/)

There is also a webversion at [Custom Maester Tests](https://devclate.github.io/Custom-Maester-Tests/)

## Introduction

### What are custom Maester tests?
Custom Maester tests are tests that fully integrate into Maester's framework to test your Microsoft 365 tenant and anything else you want to using Pester tests. Also providing PowerShell scripts to resolve any issues where possible.

### Why custom Maester tests?

These are tests that aren't standard in Maester, but integrate into it.. Ensure that your tenant is always followning company standards. You may want to run tests that the current Maester framework doesn't have on your tenant or network and want a nice way to display those results as well as keeping it under one umbrella.

### How do custom Maester tests help?

Allows you to have all of your tests under a single pane of glass that are specific to your company while gaining all of the benefits of Maester.

## Getting Started

### Step 1: Download Tests from GitHub

Download all tests needed from the repository. There should be 3 files for each test( .ps1, .tests.ps1, .md )

### Step 2: Copy to your `Custom` folder

Copy the test files into your Maester `Custom` folder.

#### Step 3: Run the tests

Now when you run your custom tests folder these tests should show

### Step 4: Customize to your company

For all files, run the Find and Replace in VSCode for "Contoso" with your company name. I have this as the last step to ensure the test works correctly in your enviroment before changing the name.

