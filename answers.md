1. The reason why the automatic CSV import is not working is because the mapping is missing one key thing. The mapping is missing the unique identifier that is used to distingush between each user. The person that set this up must have missed the part in the assessment that points this out. Emails are not good enough since they might be subject to change. In order to solve this problem, I just read the documentation and compared what was in the assignment to what a typical csv request should look like.

2. Notes for question 2 are posted in the script. 

3. I had issues understanding what the steps needed to be. I was able to get the users but was having problems with designing the body of the post request to write data into the user via the API. In a normal environment like this, I would reach out to the Staffbase support team for assistance and have them provide me with an example request for when this post operation is done. Using that example, I would be able to implement a script. 

My thought process would be to create a post request to the https://developers.staffbase.com/user/ API. I would dynamically add the user id to the end of the URL request. In the body of the request, I would add the key avatar and send the data up as a file path to where the file lives. In theory, since this is a puts/post request, this would update the image. The script would look very similar to the script that I wrote for the news uploads. I would be interested on jumping on a call to see how you would solve this question from your end, regardless of how my candidacy ends up. 





