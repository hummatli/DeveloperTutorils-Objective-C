var express = require('express');
var bodyParser = require('body-parser');
var app = express();

app.all('/*', function(req, res, next) {

  res.header("Access-Controll-Allow-Origin", "*");
  res.header("Access-Controll-Allow-Headers", "X-Requested-With", "ContentType, Accept");
  res.header("Access-Controll-Allow-Methods", "POST, GET");
  next();
});


app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: false}));


var tutorials = [
  {
    id: 1,
    title: "Android Studio Tutorial For Beginners",
    description: "Lear how to install Androd Studio and go through this tutoril how to create your first Android app",
    thumbnail: "https://lh3.ggpht.com/cWJcuSdRqNvocpYqjgThbvyq78cjIP_LOyxBQimP3I4mb4Uu8My_hJ94qEscrI30QA=w300",
    iframe: '<iframe width="560" height="315" src="https://www.youtube.com/embed/F-k5gwz_91o" frameborder="0" allowfullscreen></iframe>'
  },
  {
    id: 2,
    title: "iOS App Icon Designe in Photoshop",
    description: "Lear how to install Androd Studio and go through this tutoril how to create your first Android app",
    thumbnail: "https://lh3.ggpht.com/cWJcuSdRqNvocpYqjgThbvyq78cjIP_LOyxBQimP3I4mb4Uu8My_hJ94qEscrI30QA=w300",
    iframe: '<iframe width="560" height="315" src="https://www.youtube.com/embed/F-k5gwz_91o" frameborder="0" allowfullscreen></iframe>'
  }
]


app.get('/tutorials', function(req, res) {
  console.log("GET from server");
  res.send(tutorials);
});


app.listen(6069);
