#!/bin/bash

mongosh <<EOF
   var config = {
        "_id": "mongoReplica",
        "members": [
            {
                "_id": 0,
                "host": "mongo1:27017"
            },
            {
                "_id": 1,
                "host": "mongo2:27017"
            },
            {
                "_id": 2,
                "host": "mongo3:27017"
            }
        ]
    };
    rs.initiate(config, { force: true });
    rs.status();
EOF
sleep 10

mongosh <<EOF
   use admin;
   admin = db.getSiblingDB("admin");
   admin.createUser(
     {
	user: "rsAdmin",
        pwd: "raj123",
        roles: [ { role: "root", db: "admin" } ]
     });
     db.getSiblingDB("admin").auth("rsAdmin", "raj123");
     rs.status();
EOF