CID=$(docker run -it -p 5002:5002 -d synesthesiam/mozillatts)

until $(curl -G --output /dev/null --silent --head --fail  --data-urlencode 'text=Hello world!' http://localhost:5002/api/tts); do
    echo '.'
    sleep 1
done
curl -o $1 -G \
    --data-urlencode "text=$2" \
    'http://localhost:5002/api/tts' 

docker stop $CID
docker rm $CID