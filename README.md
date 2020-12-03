# What is this

I created this to test and debug my idea for a wiki style website. I wanted to be able to have pages, which belong to other pages in a child-parent relationship. Pages are called "nodes" and they have a one-to-many relationship with themselves(aka "nodes"). Each node can optionally belong to one parent. If they do not have a parent then the code assumes they are one of the root nodes. A single node can be a parent to however many other nodes you wish.

This code is very bare bones as I only included what I deemed necessary to test and debug before implementing it to my primary website. While the nodes index page does show all the existing records in the database, displayed in a tree format, they do not have working links. To visit them you have to know or guess the id and enter it in the url. To edit or create new records you also have to type in the url into the adress bar. See this this tutorial to understand how I implemented the these urls: https://guides.rubyonrails.org/getting_started.html

##### Example of the site (note that some of the names are incorrect as I was debugging and it was at the time not in a working state):

![sample](https://i.imgur.com/6bGIeUz.png)

