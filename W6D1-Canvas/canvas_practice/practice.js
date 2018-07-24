document.addEventListener("DOMContentLoaded", function(){
  var canvas = document.getElementById('mycanvas');
  canvas.height = 500;
  canvas.width = 500;
  var ctx = canvas.getContext('2d');
  ctx.fillStyle= 'red';
  ctx.fillRect(10,10,100,100);

  ctx.beginPath();
  ctx.arc(200, 200, 50, 0, 2*Math.PI, true);
  ctx.strokeStyle = "blue";
  ctx.lineWidth = 3;
  ctx.stroke();
  ctx.fillStyle = "orange";
  ctx.fill();


  ctx.beginPath();
  ctx.moveTo(300,300);
  ctx.lineTo(325,325);
  ctx.lineTo(325,275);
  ctx.fillStyle = "purple";
  ctx.fill();
  //



   ctx.beginPath();
   ctx.moveTo(350,300);
   ctx.lineTo(325,325);
   ctx.lineTo(325,375);

   ctx.fillStyle = "purple";
   ctx.fill();
});
