docker pull python:3.6.12-buster
docker build . -t obamanet
CID=$(docker run -it -d obamanet -n obamanet1)

echo $CID
docker wait $CID

docker cp $CID:/obamanet/output.mp4 output.mp4


docker stop $CID
docker rm $CID
