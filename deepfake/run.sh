git clone https://github.com/AliaksandrSiarohin/first-order-model.git

cp *.tar ./first-order-model
cp source.png ./first-order-model/source.png
cp output.mp4 ./first-order-model/output.mp4
rm ./first-order-model/Dockerfile
cp Dockerfile ./first-order-model/Dockerfile

cd first-order-model


docker build -t first-order-model .

CID=$(docker run -d -it first-order-model)

echo $CID
docker wait $CID

docker cp $CID:/result.mp4 ../result.mp4


docker stop $CID
docker rm $CID
