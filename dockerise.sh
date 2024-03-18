git clone https://github.com/Raajath/chargingInfrastructure
git clone https://github.com/Raajath/estimationServerEV

cd chargingInfrastructure
docker-compose up -d --build

cd ../estimationServerEV
docker-compose up -d --build

cd ..
rm -rf chargingInfrastructure
rm -rf estimationServerEV
