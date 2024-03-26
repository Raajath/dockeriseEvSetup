mkdir mongo-keyfile
chmod 755 mongo-keyfile
openssl rand -base64 756 > mongo-keyfile/keyfile
docker-compose up -d --build

sleep 5
chmod 755 initiateRS.sh
./initiateRS.sh

git clone https://github.com/Raajath/chargingInfrastructure
git clone https://github.com/Raajath/estimationServerEV

cd chargingInfrastructure
docker-compose up -d --build

cd ../estimationServerEV
docker-compose up -d --build

cd ..
rm -rf chargingInfrastructure
rm -rf estimationServerEV
rm -rf mongo-keyfile