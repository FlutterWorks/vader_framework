#!/bin/bash

curl -X POST -H "Content-Type: application/json" -d '{"name": "Martin", "age": 25}' http://localhost:8080/json
