function titleize(names, callback) {
  let titleized = names.map(name => `Mx. ${name} Jingleheimer Schmidt`);
  callback(titleized);
};

function print(names) {
  arr.forEach(name => console.log(name));
}

function Elephant(name, height, tricks) {
  this.name = name;
  this.height = height;
  this.tricks = tricks;
}

Elephant.prototype.trumpet = function() {
   console.log(`${this.name} the elephant goes 'phrRRRRRRRRRRR!!!!!!!'"`);
};

Elephant.prototype.grow = function() {
  this.height += 2;
};

Elephant.prototype.addTrick = function(trick) {
  this.tricks.push(trick)
};

Elephant.prototype.play = function() {
  var trick = this.tricks[Math.floor(Math.random() * this.tricks.length)]
  console.log(`${this.name} is ${trick}`)
};

Elephant.paradeHelper = function (elephant) {
  console.log(`${elephant.name} is trotting by!`);
};
// herd.forEach(Elephant.paradeHelper)
function dinerBreakfast() {
  let order = "I'd like cheesy scrambled eggs please.";
  console.log(order);

  return function (food) {
    order = `${order.slice(0, order.length - 8)} and ${food} please.`;
    console.log(order);
  };
};
