document.addEventListener("DOMContentLoaded", function(){

				let canvas = document.getElementById('mycanvas')

				canvas.height = 500, canvas.width = 500

				let ctx = canvas.getContext('2d')

				drawRect(ctx, 20, 20, 60, 30, 'yellow')


				ctx.beginPath()
				ctx.lineWidth = 5
				ctx.rect(0, 0, canvas.width, canvas.height)
				ctx.stroke()



				for (let numCircles = 10; numCircles > 0; numCircles--){
								var x = Math.floor(Math.random() * 500),
								 		y = Math.floor(Math.random() * 500);
								for (let i = 50; i > 0; i -= 10){
												ctx.beginPath()
												ctx.arc(x, y, i, 0, Math.PI * 2)
												ctx.strokeStyle = 'purple'
												ctx.lineWidth = 3
												ctx.fillStyle = 'teal'
												if (i == 50) ctx.fill()
												ctx.stroke()
								}
				}


});

function drawRect(ctx, x, y, width, height, color = 'black'){
				ctx.fillRect(x, y, width, height)
}
