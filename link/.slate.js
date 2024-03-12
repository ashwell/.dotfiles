
slate.configAll({
  defaultToCurrentScreen: true
});


// Monitors
var resolutions = {
  laptop: "1792x1120",
  dellUW: "3440x1440"
};

// var getLaptop = () => slate.screenForRef(resolutions.laptop);
// var getDellUW = () => slate.screenForRef(resolutions.dellUW);


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

var shrinkHeight = slate.operation("move", {
  x: "windowTopLeftX",
  y: "windowTopLeftY",
  width: "windowSizeX",
  height: "windowSizeY-(windowSizeY*0.1)"
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
slate.bind('down:ctrl,alt,cmd', shrinkHeight, false);


// Not working not sure why
// on Zoom open reposition
/*
slate.on("windowOpened", function(event, win) {
  // slate.log('saw win open ' + win.app().name());
  if( win.app().name() === 'zoom.us' ) {
    slate.log('saw zoom open');
    win.move({
      screen: resolutions.laptop
      x: "screenOriginX+910",
      y: "screenOriginY+435",
      width: "windowSizeX",
      height: "windowSizeY"
    });
  }
});
*/

