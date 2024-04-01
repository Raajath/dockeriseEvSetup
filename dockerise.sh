mkdir mongo-keyfile
chmod 755 mongo-keyfile
chmod 755 setup.sh
openssl rand -base64 756 > mongo-keyfile/keyfile
docker-compose up -d --build

sleep 20
docker exec mongo3 ./scripts/setup.sh

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