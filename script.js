// script.js

window.addEventListener('DOMContentLoaded', () => {
    const playButton = document.getElementById('play-button');
    const schizophreniaButton = document.getElementById('schizophrenia-button');

    playButton.addEventListener('click', () => {
        const youtubeURL = 'https://www.youtube.com/watch?v=kOHB85vDuow';
        const startTime = 45;
        const urlWithStartTime = `${youtubeURL}&start=${startTime}`;
        window.open(urlWithStartTime, '_blank');

        // Request fullscreen mode after a delay to ensure the YouTube page is loaded
        setTimeout(requestFullscreen, 1000);
    });

    schizophreniaButton.addEventListener('click', () => {
        // Handle the action when the "The first stage of schizophrenia starts here" button is clicked
        // You can add your desired functionality here
        console.log("The first stage of schizophrenia starts here");
    });

    function requestFullscreen() {
        const iframe = document.getElementById('youtube-player');
        if (iframe) {
            if (iframe.requestFullscreen) {
                iframe.requestFullscreen();
            } else if (iframe.mozRequestFullScreen) {
                iframe.mozRequestFullScreen();
            } else if (iframe.webkitRequestFullscreen) {
                iframe.webkitRequestFullscreen();
            } else if (iframe.msRequestFullscreen) {
                iframe.msRequestFullscreen();
            }
        }
    }
});




window.addEventListener('DOMContentLoaded', () => {
    const backButton = document.getElementById('back-button');

    backButton.addEventListener('click', () => {
        // Navigate back to the previous page
        window.history.back();
    });
});


