let currentAudio = new Audio();

function playSong(url, title, artist) {
  currentAudio.src = url;
  currentAudio.play();
  document.getElementById('now-playing-title').innerHTML = title;
  document.getElementById('now-playing-artist').innerHTML = artist;
}