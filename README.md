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
|   HTTP Methods                                                 |   Descriptions              |
| -------------------------------------------------------------- | --------------------------- |
| HTTP POST http://localhost:5000/users/ username=? email=? pw=? | Register a new user account |
| HTTP POST http://localhost:5000/users/<username>/ pw=?         | Returns true if the password parameter matches the password stored for the username |


### 4. Example:
4.1 Register a new account:
- Sample request:
HTTP --verbose POST http://localhost:5000/users/ username='TomVo' email='tomvo@gmail.com' pw='tom*123'

- Sample response:
Response.status = 201
```
{
    "email": "tomvo@gmail.com",
    "id":5,
    "pw": "Tom*123",
    "username": "TomVo"
}
```
4.2 Check the password if the password parameter matches the password stored for the username
- Sample request:
http --verbose POST http://localhost:5000/users/TomVo/ pw='Tom*123'
- Sample response:
Response status: 200 OK
Your password match with user: TomVo

4.3 