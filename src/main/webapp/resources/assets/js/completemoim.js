var cnt = 31;
function countDown() {
	if (cnt != 0) {
		cntspan.innerHTML = cnt-1;
		cnt--;
	}
	else {
		location.replace("/index")
		clearInterval(repeat);
	}
}

cntspan.innerHTML = cnt-1;
var repeat = setInterval(countDown, 1000);

function animateCSS(element, animationName, callback) {
    const node = document.querySelector(element)
    node.classList.add('animated', animationName)

    function handleAnimationEnd() {
        node.classList.remove('animated', animationName)
        node.removeEventListener('animationend', handleAnimationEnd)

        if (typeof callback === 'function') callback()
    }

    node.addEventListener('animationend', handleAnimationEnd)
}
animateCSS(".animate__heartBeat", 'bounce')