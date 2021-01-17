cd ./TTS

bash run.sh test.wav "$1"

cd ..

cp ./TTS/test.wav ./obamanet/test.wav

cd ./obamanet

bash run.sh

cd ..

cp ./obamanet/output.mp4 ./deepfake/output.mp4

cd ./deepfake

bash run.sh

cd ..

cp ./deepfake/result.mp4 .
cp ./TTS/test.wav .

ffmpeg -i result.mp4 -i test.wav -c:v copy -map 0:v:0 -map 1:a:0 final.mp4