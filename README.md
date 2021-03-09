# CPSC-449-Project2
## Group members: 
##                  CINDY QUACH
##                  DALISA NGUYEN
##                  TEVIN VU

### 1. Start the project to start build users.db and timelines.db
```
./bin/init.sh
```

### 2. In the same terminal or a new terminal run this command to start microservices:
```
foreman start
```

### 3. http requests available
|   HTTP Methods                                                            |                                   Descriptions                                      |
| --------------------------------------------------------------            |     -------------------------------------------------------------------------       |
| HTTP POST http://localhost:5000/users/ username=? email=? pw=?            | Register a new user account                                                         |
| HTTP POST http://localhost:5000/users/<username\>/ pw=?                    | Returns true if the password parameter matches the password stored for the username |
| HTTP POST http://localhost:5000/users/<username>/<usernameToFollow>/      | <username> is now following <usernameToFollow>                                      |
| HTTP DELETE http://localhost:5000/users/<username>/<usernameToFollow>/    | <username> has unfollowed {usernameToRemove}                                        |
| HTTP GET http://localhost:5100/timelines/<username>/                      | Returns recent posts from a user                                                    |                
| HTTP GET http://localhost:5100/timelines/public/                          | Returns recent posts from all users                                                 |
| HTTP GET http://localhost:5100/timelines/<username>/followings/           | Returns recent posts from all users that this user follows                          |
| HTTP POST http://localhost:5100/timelines/<username>/ post=?              | Post a new tweet                                                                    |


### 4. Example:
4.1 Register a new account:
- Sample request:
HTTP --verbose POST http://localhost:5000/users/ username='JohnLegend' email='johnlegend@gmail.com' pw='John*123'

- Sample response:
Response.status = 201
```
{
    "id":5,
    "email": "johnlegend@gmail.com",
    "pw": "John*123",
    "username": "JohnLegend"
}
```

4.2 Check the password if the password parameter matches the password stored for the username
- Sample request:
http --verbose POST http://localhost:5000/users/JohnLegend/ pw='John*123'
- Sample response:
Response status: 200 OK
Your password match with user: JohnLegend

4.3 Start to following a new user
- Sample request:
http --verbose POST http://localhost:5000/users/TaylorSwift/JohnLegend/
- Sample response:
Response status: 200 OK
TaylorSwift is now following JohnLegend

4.4 Stop following a new user:
- Sample request:
http --verbose DELETE http://localhost:5000/users/TaylorSwift/JohnLegend/
- Sample response:
Response status: 201 
TaylorSwift has unfollowed JohnLegend

4.5 Returns recent posts from a user.
- Sample request:
http --verbose GET http://localhost:5100/timelines/JohnLegend/
- Sample response:
Response status: 201
```
{
    JohnLegend's Timeline: {
        "id": 5,
        "email": "JohnLegend@gmail.com",
        "pw": "John*123",
        "username": "JohnLegend",
        "post": "Hello World!";

        "id": 5,
        "email": "JohnLegend@gmail.com",
        "pw": "John*123",
        "username": "JohnLegend",
        "post": "It's a beautiful day!";      
    }
}
```

4.6 Returns recent posts from all users.
- Sample request:
http --verbose GET http://localhost:5100/timelines/public/
```
{
    Public Timeline: {
        "id": 5,
        "email": "johnlegend@gmail.com",
        "pw": "John*123",
        "username": "JohnLegend",
        "post": "Hello World!";

        "id": 3,
        "email": "andrewdo@gmail.com",
        "pw": "Flyingcarts764!",
        "username": "AndrewDo",
        "post": "Going shopping today.";

        "id": 1,
        "email": "janedo@gmail.com",
        "pw": "Rustictable^345",
        "username": "JaneDo",
        "post": "Just got some coffee!";      
    }
}
``` 

4.7 Returns recent posts from all users that this user follows.
- Sample request:
http --verbose GET http://localhost:5100/timelines/JohnLegend/TaylorSwift/
- Sample response:
Response status: 201
```

{
    followingsPosts: {
        "id": 5,
        "email": "tomvo@gmail.com",
        "pw": "Tom*123",
        "username": "JohnLegend",
        "post": "Hello World!",
        "usernameToFollow": "TaylorSwift";

        "id": 5,
        "email": "tomvo@gmail.com",
        "pw": "Tom*123",
        "username": "JohnLegend",
        "post": "It's a beautiful day!", 
         "usernameToFollow": "BrunoMars"; 
        
        "id": 1,
        "email": "janedo@gmail.com",
        "pw": "rustictable^345",
        "username": "JohnLegend",
        "post": "Just got some coffee!",
        "usernameToFollow": "BrunoMars";
    }
}
```

4.8 Post a new tweet
- Sample request:
http --verbose POST http://localhost:5100/timelines/JohnLegend/ post="449 is a challenge"
- Sample response:
Response status: 201
```
TomVo's Timeline: {
        "id": 7,
        "email": "johnlegend@gmail.com",
        "pw": "John*123",
        "username": "JohnLegend",
        "post": "449 is a challenge";    
}
```
JohnLegend just tweeted!