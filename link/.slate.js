
slate.configAll({
  defaultToCurrentScreen: true
});


// Monitors
var laptop = "1792x1120";
var dellUW = "3440x1440";


// Operations
var fullscreen = slate.operation("move", {
  x : "screenOriginX",
  y : "screenOriginY",
  width  : "screenSizeX",
  height : "screenSizeY"
});

// half screen
var leftHalf = slate.operation("corner", {
  direction: "top-left",
  width: "screenSizeX/2",
  height:"screenSizeY"
});
var rightHalf = slate.operation("corner", {
  direction: "top-right",
  width: "screenSizeX/2",
  height:"screenSizeY"
});

var halveHeight = slate.operation("move", {
  x: "windowTopLeftX",
  y: "windowTopLeftY",
  width: "windowSizeX",
  height: "windowSizeY/2"
});

// quarters
var quarters = {
  topLeft: slate.operation("corner", {
    direction: "top-left",
    width: "screenSizeX/2",
    height: "screenSizeY/2"
  }),
  topRight: slate.operation("corner", {
    direction: "top-right",
    width: "screenSizeX/2",
    height: "screenSizeY/2"
  }),
  bottomLeft: slate.operation("corner", {
    direction: "bottom-left",
    width: "screenSizeX/2",
    height: "screenSizeY/2"
  }),
  bottomRight: slate.operation("corner", {
    direction: "bottom-right",
    width: "screenSizeX/2",
    height: "screenSizeY/2"
  })
};

// Bindngs
//slate.bind('', op, false);
slate.bind('up:ctrl,alt,cmd', fullscreen, false);
slate.bind('right:ctrl,alt,cmd', rightHalf, false);
slate.bind('right:shift,ctrl,alt,cmd', quarters.bottomRight, false);
slate.bind('left:ctrl,alt,cmd', leftHalf, false);
slate.bind('left:shift,ctrl,alt,cmd', quarters.bottomLeft, false);
slate.bind('down:ctrl,alt,cmd', halveHeight, false);
