# Collaboration using Git and Pull Requests

Once you've forked the repository as describe in the following documentation:

[git-fork-update](gistfile1.md)

you can then start contibuting to the project. 

The suggested workflow process is:

- ###### Create a new branch 

  Name it with following convention:
  "your-git-username"-"subject-of-branch"[version]

  Ie: "cslanzi-readme-fixes1"


  If you use git on command line, it'll be:

  ```
  git checkout -b cslanzi-readme-fixes1
  ```

  Then run

  ```
  git branch
  ```

  and verify that your new branch is checked out (has an * next to it).
  

- ###### Make changes in your local repository

  Fix typos in the documentation, write code, add a diagram ... the changes will only affect the branch you checked out.
  

- ###### Commit your changes to the branch

  stage your changes

  ```
  git add -a
  ```

  then commit the changes with a description

  ```
  git commit -m "DESCRIPTION OF CHANGES"
  ```

  For changes on multiple concerns, it's a good habit to make also multiple commits.
  

- ###### Push the changes to your fork

  ```
  git push origin BRANCH_NAME
  ```

  

- ###### From your fork, review the changes and start a pull request to the upstream repository

  On your GitHub you should see the changes in your branch and you should also see a green "Compare & pull request" button to begin the pull request. If you don't see it, be sure your branch is active selected and then click the "New pull request" button.

  

- ###### Create the pull request

  The project repository is listed on the left as "base repository", master, and your fork is listed on the right as "head repository".
  Review your changes and write a descriptive title for your pull request and a detailed description on the body.
  After you proved that everything looks good, click the green "Create pull request" button.

  

- ###### Review the pull request

  In the project's repository on GitHub is now listed your pull request and is waiting for review by the project's maintainers.
  You still have time the check your request and add further details if necessary, by clicking the "3 dots" in the upper right corner of your requests.
  

- ###### Add more commits to your pull request

  Till the pull request is open, you can still add further commits to it. For example, when the maintainers ask you to make some changes before to approve the request.
  Get back to your local repository, be sure you are still in the checked out branch, then repeat the steps: make changes, commit them, push them to your fork.
  When completed return to your pull request on GitHub and you'll see that the new commits have been added to it.

- ###### Discuss the pull request

  Use the comment box at the bottom of the pull request to reply if the are comments or questions from the project maintainers.
  

- ###### Pull request gets accepted

  If the pull request gets accepted, the project maintainers will merge your proposed changes into the project's master branch and close your pull request.
  

- ###### Delete your branch from your fork

  On GitHub you'll be given the option to delete the branch from your fork, since it is no more necessary.
  

- ###### Delete your branch from your local repository

  You should also delete the branch fron your local repository. First, switch to the master branch:

  ```
  git checkout master
  ```

  Then, delete the branch you created:

  ```
  git branch -D BRANCH_NAME
  ```

  

- ###### Synchronize your fork with the project repository

  Now you need to resync your fork with the project repository's master branch.
  First pull the latest changes from the upstream into your local repository:


  The pull request is completed!

