
rm data/frames/*

ffmpeg -i data/incidente.webm -r 5 data/frames/output_%04d.png