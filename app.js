const bodyParser = require('body-parser');
const express = require('express');
const app = express();
const path = require('path');
const passport = require('passport');
const localStrategy = require('passport-local');
const session = require('express-session');
const SQLiteStore = require('connect-sqlite3')(session);
const mysql  = require('mysql2');


const CreatePath =(page) => path.resolve(__dirname,'views',`${page}.ejs`);

app.use(express.static('./script'));
app.use(express.static('./style'));
app.use(express.static(path.join(__dirname, 'public')));
app.use(bodyParser.urlencoded({extended:true}));
app.set('view engine', 'ejs');


const connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : '1234567',
  database : 'test'
});
connection.connect();

app.use(session({
    secret: 'keyboard cat',
    resave: false,
    saveUninitialized: false,
    store: new SQLiteStore({ db: 'sessions.db', dir: './var/db' })
}));
app.use(passport.authenticate('session'));


passport.serializeUser(function(user, cb) {
    process.nextTick(function() {
        console.log(user.ID);
      cb(null, { id: user.ID, username: user.USERNAME });
    });
});

passport.deserializeUser(function(user, cb) {
    process.nextTick(function() {
      return cb(null, user);
    });
});

passport.use(new localStrategy(function verify(username, password, cb) {
    connection.query('SELECT * FROM registration WHERE USERNAME = ? AND PASSWORD=?', [ username,password ], function(err, rows) {
      if (err) { return cb(err); }
      if (!rows) { return cb(null, false, { message: 'Incorrect username or password.' }); }
        const user = rows[0];
        return cb(null, user);
    });
}));

app.get('/', (req, res) => {
        const user = req?.user?.username;
        res.render(CreatePath('index'),{user});
});

app.get('/people', (req, res) => {
    if(req.query.query){
        connection.query(req.query.query,(err,results,fields,user)=>{
            if (err){
                res.render(CreatePath('people'),{error:err,results:false,fields:false,user});
            }
            res.render(CreatePath('people'),{results,fields,user});
        });
    }
    else{
        res.render(CreatePath('people'),{results:false,fields:false,user});
    }
});

app.get('/chat', (req, res) => {
    const user = req?.user?.username;
    res.render(CreatePath('chat'),{user}); 
});

app.get('/login', (req, res) => {
    res.render(CreatePath('login'),{title:'login || chat',user:undefined});
}); 

app.post('/login',passport.authenticate('local',{
    successRedirect:"/",
    failureRedirect:"/login"
})); 

app.get('/people', (req, res) => {
    connection.query('SELECT * FROM registration',(error, result,fields) => {
        res.render(CreatePath('people'),{result});
    });
});

app.get('/registration', (req, res) => {
    res.render(CreatePath('reg'));
});

app.post('/registration', (req,res)=>{
    connection.query('INSERT INTO registration SET ?', {USERNAME: req.body.email, PASSWORD: req.body.psw}, (err, results, fields)=>{
        if (err) throw err;
        res.redirect(`/about?ID=${results.insertId}`);
    });
});

app.get('/about', (req, res) => {
    res.render(CreatePath('about'),{ID:req.query.ID});
});

app.post('/about', (req, res) => {
    const SEX = req.body.jins=='erkak'?"M":"W";
    const Age = Number(req.body.yosh);
    const Firstname = req.body.ism;
    const Lastname = req.body.familiya;
    const USERID = req.body.ID;
    const sql = `insert into user (Firstname, Lastname, Age, SEX, USER_ID) VALUES(?,?,?,?,?)`;
    const values = [Firstname, Lastname, Age, SEX, USERID];
    connection.query(sql, values,(error,result,fields)=>{
        if (error){
            console.error('error:', error);
            return;
        }
    });
    res.redirect('/')
});


app.listen(3000, () =>{
    console.log('listening on port');
});