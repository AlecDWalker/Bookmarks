 # Bookmark Manager

 This code is intended as a supplementary guide for [bookmark manager](https://github.com/makersacademy/course/tree/master/bookmark_manager).

 ## User stories:

 As a a web user
 So that I can keep track of important websites
 I would like to have a visible list of bookmarked pages

 As a web user
 So that I can can save a new website
 I would like to be able to add a site address and title to the bookmark manager

 As a user
 So I can remove my bookmark from Bookmark Manager
 I want to delete a bookmark

 As a user
 So I can change a bookmark in Bookmark Manager
 I want to update a bookmark

 ## Domain model

 ![Bookmark Manager domain model](https://raw.githubusercontent.com/makersacademy/course/master/bookmark_manager/images/bookmark_manager_1.png?token=AMJF77DYPGEW7B2KGLPVABS5UWE2Q)

 ## SQL connection

 In order to access the necessary database for this task, the following steps need to be carried out:

 1-Connect to psql (run psql in the command line)
 2-Create a database inside psql using the CREATE DATABASE command
 3-Connect to the created database using the '\c' command
 4-Run the query saved in the 01_create_bookmarks_table.sql file
