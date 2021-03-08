# CPSC-449-Project2
## Group members: 
##                  CINDY QUACH
##                  DALISA NGUYEN
##                  TEVIN VU

### 1. Start the project to start build users.db and timelines.db
###
'''
./bin/init.sh
'''

### 2. In the same terminal or a new terminal run this command to start microservices:
###
'''
foreman start
'''

### 3. http requests available
|   HTTP Methods                                                 |   Descriptions              |
| -------------------------------------------------------------- | --------------------------- |
| HTTP POST http://localhost:5000/users/ username=? email=? pw=? | Register a new user account |
| HTTP POST http://localhost:5000/users/<username>/ pw=?         | Returns true if the password parameter matches the password stored for the username |


